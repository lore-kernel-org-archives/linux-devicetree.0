From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v5 00/18] JZ4780 DMA patchset v5
Date: Wed, 29 Aug 2018 23:32:42 +0200
Message-ID: <20180829213300.22829-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>
Cc: od@zcrc.me, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

Hi Vinod,

This is the V5 of my Ingenic JZ4780 DMA patchset.

- Patch [01/18] dropped the "doc:" in the patch title;
- Patches [11/18] and [12/18] now use the GENMASK() macro.
- The rest is untouched.

Thanks,
-Paul Cercueil
