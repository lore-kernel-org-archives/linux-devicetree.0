From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] DeviceTree fixes for 4.5
Date: Wed, 3 Feb 2016 09:28:12 -0600
Message-ID: <CAL_Jsq+NcJKgZ1AVJUGjSc9+2RjYsw5ubjDw4bHuCz5DJRY4Qg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull these 2 DT fixes for 4.5.

Rob

The following changes since commit 92e963f50fc74041b5e9e744c330dca48e04f08d:

  Linux 4.5-rc1 (2016-01-24 13:06:47 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-fixes-for-4.5

for you to fetch changes up to 71f50c6d9a2276f3ec85384bffe2aee1962f4669:

  of: drop symbols declared by _OF_DECLARE() from modules (2016-01-25
08:35:50 -0600)

----------------------------------------------------------------
DeviceTree fixes for 4.5:

- Fix build error with *_OF_DECLARE() when used in modules

- Add missing platform maintainers for dts files in MAINTAINERS

----------------------------------------------------------------
Masahiro Yamada (1):
      of: drop symbols declared by _OF_DECLARE() from modules

Rob Herring (1):
      MAINTAINERS: Add missing platform maintainers for dts files

 MAINTAINERS        | 19 ++++++++++++++++++-
 include/linux/of.h |  2 +-
 2 files changed, 19 insertions(+), 2 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
