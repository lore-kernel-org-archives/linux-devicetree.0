From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/6] microblaze: fix various problems in building boot images
Date: Fri,  7 Dec 2018 20:33:51 +0900
Message-ID: <1544182437-26660-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <monstr@monstr.eu>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

This patch set fixes various issues in microblaze Makefiles.

V2 reflected Michal's comments, and cleaned up a little more.

I did not add Michals' Acked-by.
If this patch set goes to the MicroBlaze tree, he will add
Signed-off-by anyway.

This patch set is independent of Kbuild tree,
so it should apply to MicroBlaze tree.

Resolved the conflict with:

commit 1e17ab5320a654eaf1e4ce121c61e7aa9732805a
Author: Firoz Khan <firoz.khan@linaro.org>
Date:   Tue Nov 13 11:34:34 2018 +0530

    microblaze: generate uapi header and system call table files




Masahiro Yamada (6):
  microblaze: adjust the help to the real behavior
  microblaze: move "... is ready" messages to arch/microblaze/Makefile
  microblaze: fix multiple bugs in arch/microblaze/boot/Makefile
  microblaze: add linux.bin* and simpleImage.* to PHONY
  microblaze: fix race condition in building boot images
  microblaze: remove the explicit removal of system.dtb

 arch/microblaze/Makefile          | 22 ++++++++++++++--------
 arch/microblaze/boot/Makefile     | 23 +++++++++--------------
 arch/microblaze/boot/dts/Makefile |  5 +----
 3 files changed, 24 insertions(+), 26 deletions(-)

-- 
2.7.4
