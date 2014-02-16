From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] DeviceTree fixes for 3.14
Date: Sat, 15 Feb 2014 19:22:25 -0600
Message-ID: <CAL_JsqLu4s+r8FfdV=cT_NSQMVq_ewnf99qYw9naYrR5wg4M5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Linus,

Please pull another set of DT fixes to fix booting on some PPC boards.

Rob


The following changes since commit 860a445c25aa2f99aa5881603a1f4ed2cec64025:

  DT: Add vendor prefix for Spansion Inc. (2014-02-05 10:39:17 -0600)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/dt-fixes-for-3.14

for you to fetch changes up to 06b29e76a74b2373e6f8b5a7938b3630b9ae98b2:

  of: search the best compatible match first in __of_match_node()
(2014-02-15 18:51:17 -0600)

----------------------------------------------------------------
DeviceTree fixes for 3.14:

- Fix booting on PPC boards. Changes to of_match_node matching caused
  the serial port on some PPC boards to stop working. Reverted the
  change and reimplement to split matching between new style compatible
  only matching and fallback to old matching algorithm.

----------------------------------------------------------------
Kevin Hao (2):
      Revert "OF: base: match each node compatible against all given
matches first"
      of: search the best compatible match first in __of_match_node()

 drivers/of/base.c | 88 ++++++++++++++++++++++++++++++++++---------------------
 1 file changed, 54 insertions(+), 34 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
