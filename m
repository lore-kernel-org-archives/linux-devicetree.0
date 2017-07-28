From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] DeviceTree fixes for 4.13
Date: Fri, 28 Jul 2017 17:52:13 -0500
Message-ID: <CAL_JsqLsiB40Fi8CRNZovQ8XLw9_0Cn6QvrtVbLPn6qEwoNGYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Linus,

Please pull 2 small DT fixes for 4.13.

Rob

The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:

  Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-fixes-for-4.13

for you to fetch changes up to 531da74075a7805768ce3cd323e37e3548cbf6c5:

  of: irq: fix of_irq_to_resource() error check (2017-07-21 16:58:55 -0500)

----------------------------------------------------------------
DeviceTree fixes for 4.13:

- Fix error handling in of_irq_to_resource_table() due to
  of_irq_to_resource() error return changes.

- Fix dtx_diff script due to dts include path changes.

----------------------------------------------------------------
Frank Rowand (1):
      scripts/dtc: dtx_diff - update include dts paths to match build

Sergei Shtylyov (1):
      of: irq: fix of_irq_to_resource() error check

 drivers/of/irq.c     | 2 +-
 scripts/dtc/dtx_diff | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
