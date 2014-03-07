From: Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>
Subject: [PATCH v4 0/4] checkpatch: enhance compatible string checking
Date: Sat,  8 Mar 2014 00:38:43 +0100
Message-ID: <1394235527-8999-1-git-send-email-florian.vaussard@epfl.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

This series proposes a number of fixes and enhancements to the checks
performed on compatible strings:

1) Fix vendor check for strings with dashes
2) Fix spurious vendor warning, when there is no vendor
3) Check for compatible strings in .c and .h files too
4) Match only at the begining of each line in vendor-prefixes.txt

Regards,
Florian

Since v3 [3]:
- Removed the SOB of Joe Perches
- Cc: Andrew Morton

Since v2 [2]:
- Merged changes proposed by Joe Perches
1) check compatible also in .[ch] files
2) match strings at the begining of vendor-prefixes.txt
3) minor cleanups

Since v1 [1]:
- Add check for vendors with '-', as suggested by Joe Perches

[1] http://thread.gmane.org/gmane.linux.drivers.devicetree/63770
[2] http://thread.gmane.org/gmane.linux.kernel/1657871
[3] https://lkml.org/lkml/2014/3/7/247

Florian Vaussard (4):
  checkpatch: check vendor compatible with dashes
  checkpatch: fix spurious vendor compatible warnings
  checkpatch: check compatible strings in .c and .h too
  checkpatch: improve the compatible vendor match

 scripts/checkpatch.pl | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
