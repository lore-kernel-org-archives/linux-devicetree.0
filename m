From: Rob Herring <robherring2@gmail.com>
Subject: [GIT PULL] Devicetree fix for 5.0-rc
Date: Sat, 19 Jan 2019 10:43:42 -0600
Message-ID: <CAL_JsqKbma-kw0hrdBa2e7CLzSBsEy7dJZwvj+BrLjqzhuCPQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Linus,

Please pull one more DT fix.

Rob

The following changes since commit 3705add0b783e0deeb6646ba0311bf214fe52b0a:

  dt-bindings: reset: meson-axg: fix SPDX license id (2019-01-16 12:50:27 -0600)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-fixes-for-5.0-2

for you to fetch changes up to 75a080cde08d2dcba19ee864f9732094d93fab41:

  powerpc: chrp: Use of_node_is_type to access device_type (2019-01-19
10:35:42 -0600)

----------------------------------------------------------------
A single build fix for powerpc due to device_node.type removal

----------------------------------------------------------------
Rob Herring (1):
      powerpc: chrp: Use of_node_is_type to access device_type

 arch/powerpc/platforms/chrp/setup.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
