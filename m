From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/3] Extend dtc with data type handling
Date: Fri, 13 Dec 2013 17:49:09 +0100
Message-ID: <1386953352-25402-1-git-send-email-t.figa@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series intends to extend dtc with appropriate infrastructure
to handle property data types. First, dtc is modified to preserve
type information when parsing DTS. Then type guessing is implemented
for flat and fs trees where type data is not available. After that,
DTS generation code is modified to use only type information when
printing property data.

Effect of this is the ability to implement checks for data types
of properties. Also, as a side effect, it's now possible to do
almost 1:1 dts <=> dts passes (not very useful, but shows that
things are working well).

Tomasz Figa (3):
  dtc: Keep type information from DTS
  dtc: Inject guessed type information in case of flat and fs trees
  dtc: Use type information when printing tree source

 data.c       |  62 +++++++++++++++++++++++-
 dtc-parser.y |  47 ++++++++++++++-----
 dtc.h        |  12 +++++
 flattree.c   |   2 +-
 fstree.c     |   6 ++-
 livetree.c   |  16 +++++--
 treesource.c | 150 +++++++++++++++++++++++++++++++++--------------------------
 7 files changed, 209 insertions(+), 86 deletions(-)

-- 
1.8.4.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
