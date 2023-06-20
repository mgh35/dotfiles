.PHONY: empty cleanCaches

.DEFAULT_GOAL := empty

empty:
	echo "You must specify a target"

cleanCaches:
	ls -d ~/Library/Caches/* | xargs rm -rf || true
	rm -rf ~/.cache || true
	# find ~/Library -type d -name CacheStorage 2>/dev/null | grep "Service Worker" | xargs -I{} du -h -d 0 {} | sort -h
	rm -rf \
		"/Users/mark/Library/Containers/com.tinyspeck.slackmacgap/Data/Library/Application Support/Slack/Service Worker/CacheStorage"	\
		"/Users/mark/Library/Application Support/Microsoft/Teams/Service Worker/CacheStorage" \
		|| true;

