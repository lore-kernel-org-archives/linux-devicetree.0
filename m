From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [GIT PULL] Devicetree bug fix for v3.18
Date: Sat, 8 Nov 2014 23:22:55 +0000
Message-ID: <CACxGe6sskK4wFXwx=b0B9QyCP602h6vC4EZU-iEBuN0YE9bB2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[resending; forgot to cc the mailing lists]

Hi Linus.

Please pull the following branch for a device tree bug fix.

Thanks,
g.

The following changes since commit 0df1f2487d2f0d04703f142813d53615d62a1da4:

  Linux 3.18-rc3 (2014-11-02 15:01:51 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/glikely/linux devicetree/merge

for you to fetch changes up to a87fa1d81a9fb5e9adca9820e16008c40ad09f33:

  of: Fix overflow bug in string property parsing functions
(2014-11-04 10:19:48 +0000)

----------------------------------------------------------------
Devicetree bugfix for v3.18

One buffer overflow bug that shouldn't be left around.

----------------------------------------------------------------
Grant Likely (1):
      of: Fix overflow bug in string property parsing functions

 drivers/of/base.c                           | 88 ++++++++---------------------
 drivers/of/selftest.c                       | 66 ++++++++++++++++++++--
 drivers/of/testcase-data/tests-phandle.dtsi |  2 +
 include/linux/of.h                          | 84 ++++++++++++++++++++++-----
 4 files changed, 154 insertions(+), 86 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
