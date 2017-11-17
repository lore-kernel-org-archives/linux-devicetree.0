From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/5] Another batch of dtc checks
Date: Fri, 17 Nov 2017 08:45:10 -0600
Message-ID: <20171117144515.10870-1-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Here's another batch of dtc checks. The first 3 patches are pretty
straightforward. The last 2 patches are a bit more subjective.

For aliases, I would like to see them restricted to a documented list of
names. There are some platforms I've seen that seem to just define
aliases for many devices and most are not needed. The main use of
aliases in the Linux kernel is to provide fixed device numbers to
userspace, but this is an anti-goal of in the kernel.

Rob

Rob Herring (5):
  checks: add a string checks for label, bootargs and stdout-path
  checks: add string list check
  checks: add string list check for *-names properties
  checks: check for #{size,address}-cells without child nodes
  checks: add aliases node checks

 checks.c                   | 123 +++++++++++++++++++++++++++++++++++++++++++++
 tests/bad-string-props.dts |  11 ++++
 tests/run_tests.sh         |   2 +-
 3 files changed, 135 insertions(+), 1 deletion(-)

-- 
2.14.1
