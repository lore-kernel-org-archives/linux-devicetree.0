From: Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/2] hwrng: npcm: add NPCM RNG driver support
Date: Wed, 28 Aug 2019 19:26:15 +0300
Message-ID: <20190828162617.237398-1-tmaimon77@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mpm@selenic.com, herbert@gondor.apana.org.au, arnd@arndb.de, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com, yuenn@google.com, benjaminfair@google.com, sumit.garg@linaro.org, jens.wiklander@linaro.org, vkoul@kernel.org, tglx@linutronix.de, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch set adds Randon Number Generator (RNG) support 
for the Nuvoton NPCM Baseboard Management Controller (BMC).

The RNG driver we use power consumption when the RNG 
is not required.

The NPCM RNG driver tested on NPCM750 evaluation board.

Tomer Maimon (2):
  dt-binding: hwrng: add NPCM RNG documentation
  hwrng: npcm: add NPCM RNG driver

 .../bindings/rng/nuvoton,npcm-rng.txt         |  17 ++
 drivers/char/hw_random/Kconfig                |  13 ++
 drivers/char/hw_random/Makefile               |   1 +
 drivers/char/hw_random/npcm-rng.c             | 207 ++++++++++++++++++
 4 files changed, 238 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
 create mode 100644 drivers/char/hw_random/npcm-rng.c

-- 
2.18.0
