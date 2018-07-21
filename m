From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 00/18] JZ4780 DMA patchset v3
Date: Sat, 21 Jul 2018 13:06:25 +0200
Message-ID: <20180721110643.19624-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, Paul Cercueil <paul@crapouillou.net>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

Hi,

This is the version 3 of my jz4780-dma driver update patchset.

Apologies to the DMA people, the v2 of this patchset did not make it to
their mailing-list; see the bottom of this email for a description of
what happened in v2.

Changelog from v2 to v3:

- Modified the devicetree bindings to comply with the specification

- New patch [06/18] allows the JZ4780 DMA driver to be compiled within a
  generic MIPS kernel.

Changelog from v1 to v2:

- All documentation changes have been moved to one single patch [01/17].

- The new patch [02/17] enforces that we're probed from devicetree.

- The driver will not fail if only one memory resource has been supplied
  in the devicetree, to keep compatibility with old devicetree files.

- A new patch [17/17] adds a devicetree node for the DMA driver in the
  JZ4740 DTS file.

- Some other small changes; see per-file changelog.

Regards,
-Paul
