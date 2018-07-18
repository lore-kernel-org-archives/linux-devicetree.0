From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 00/17] JZ4780 DMA patchset v2
Date: Wed, 18 Jul 2018 20:20:06 +0200
Message-ID: <20180718182023.8182-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

Hi,

This is the version 2 of my jz4780-dma driver update patchset.

Changelog:

- All documentation changes have been moved to one single patch [01/17].

- The new patch [02/17] enforces that we're probed from devicetree.

- The driver will not fail if only one memory resource has been supplied
  in the devicetree, to keep compatibility with old devicetree files.

- A new patch [17/17] adds a devicetree node for the DMA driver in the
  JZ4740 DTS file.

- Some other small changes; see per-file changelog.

Regards,
-Paul
