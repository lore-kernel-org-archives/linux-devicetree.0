From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 00/14] dma-jz4780 improvements
Date: Tue,  3 Jul 2018 14:32:00 +0200
Message-ID: <20180703123214.23090-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

Hi,

This set of patches by myself and Daniel extends the dma-jz4780 driver
to support other SoCs (JZ4770, JZ4740, JZ4725B).

Some fixes are also included, for proper residue reporting, which fixes
errors with ALSA.

Finally, the last two patches update the devicetree bindings for the
JZ4780 SoC and add a binding for the JZ4770 SoC.

This patchset was tested on JZ4780, JZ4770 and JZ4725B, but was not tested
on the JZ4740, so it would be fantastic if somebody could test it there.

Regards,
-Paul
