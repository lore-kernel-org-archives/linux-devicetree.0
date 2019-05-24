From: Neal Liu <neal.liu@mediatek.com>
Subject: Re: [PATCH 3/3] hwrng: add mt67xx-rng driver
Date: Fri, 24 May 2019 15:42:34 +0800
Message-ID: <1558683754.5671.4.camel@mtkswgap22>
References: <1557287937-2410-1-git-send-email-neal.liu@mediatek.com>
         <1557287937-2410-4-git-send-email-neal.liu@mediatek.com>
         <12193108.aNnqf5ydOJ@tauon.chronox.de>
         <1557311737.11818.11.camel@mtkswgap22>
         <20190509052649.xfkgb3qd7rhcgktj@gondor.apana.org.au>
         <1557413686.23445.6.camel@mtkswgap22>
         <20190510063915.kwqy3e5urs6j7ity@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190510063915.kwqy3e5urs6j7ity@gondor.apana.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, wsd_upstream <wsd_upstream@mediatek.com>, Stephan Mueller <smueller@chronox.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "mpm@selenic.com" <mpm@selenic.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, Crystal Guo =?UTF-8?Q?=28=E9=83=AD=E6=99=B6=29?= <Crystal.Guo@mediatek.com>, Neal Liu <neal.liu@mediatek.com>
List-Id: devicetree@vger.kernel.org

Hi Herbert,
	Could you kindly help to review our patches?
	Thanks

From	Neal Liu <>
Subject	[PATCH 0/3] MT67XX random number generator support
Date	Wed, 8 May 2019 11:58:54 +0800
share
These patch series introduce a generic rng driver for Trustzone
based kernel driver which would like to communicate with ATF
SIP services.

Patch #1 initials SMC fid table for Mediatek SIP interfaces and
adds HWRNG related SMC call.

Patch #2..3 adds mt67xx-rng kernel driver for Trustzone based SoCs.
For Mediatek SoCs on ARMv8 with TrustZone enabled, peripherals like
entropy sources is not accessible from normal world (linux) and
rather accessible from secure world (ATF/TEE) only. This driver aims
to provide a generic interface to ATF rng service.

Neal Liu (3):
  soc: mediatek: add SMC fid table for SIP interface
  dt-bindings: rng: update bindings for MT67xx SoCs
  hwrng: add mt67xx-rng driver

 Documentation/devicetree/bindings/rng/mtk-rng.txt |   13 ++-
 drivers/char/hw_random/Kconfig                    |   16 ++++
 drivers/char/hw_random/Makefile                   |    1 +
 drivers/char/hw_random/mt67xx-rng.c               |  104
+++++++++++++++++++++
 include/linux/soc/mediatek/mtk_sip_svc.h          |   55 +++++++++++
 5 files changed, 186 insertions(+), 3 deletions(-)
 create mode 100644 drivers/char/hw_random/mt67xx-rng.c
 create mode 100644 include/linux/soc/mediatek/mtk_sip_svc.h

-- 
1.7.9.5

Best Regards,
-Neal Liu
