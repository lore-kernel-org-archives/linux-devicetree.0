From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v4 00/18] JZ47xx DMA patchset v4
Date: Tue,  7 Aug 2018 13:42:00 +0200
Message-ID: <20180807114218.20091-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: Paul Cercueil <paul@crapouillou.net>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

Hi,

This is the V4 of my Ingenic JZ47xx DMA patchset.

Changelog:

- Added my Signed-off-by on Daniel's patches

- Removed the jz_version enum and IDs; add a 'flags' field with
  corresponding macros instead

Regards,
-Paul
