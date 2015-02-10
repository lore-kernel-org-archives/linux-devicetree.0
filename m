From: Scott Branden <sbranden@broadcom.com>
Subject: [PATCH 0/2] Add support for Broadcom RNG200
Date: Mon, 9 Feb 2015 16:07:08 -0800
Message-ID: <1423526830-29516-1-git-send-email-sbranden@broadcom.com>
References: <Scott Branden <sbranden@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <Scott Branden <sbranden@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bcm-kernel-feedback-list@broadcom.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Grant Likely <grant.likely@linaro.org>
Cc: Ray Jui <rjui@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Scott Branden <sbranden@broadcom.com>
List-Id: devicetree@vger.kernel.org

This series of patchsets contains the Broadcom Random Number Generator
driver and device tree binding documentation.

Scott Branden (2):
  hwrng: iproc-rng200 - Add Broadcom IPROC RNG driver
  hwrng: iproc-rng200 - Add device tree bindings

 .../bindings/hwrng/brcm,iproc-rng200.txt           |  12 ++
 drivers/char/hw_random/Kconfig                     |  13 ++
 drivers/char/hw_random/Makefile                    |   1 +
 drivers/char/hw_random/iproc-rng200.c              | 239 +++++++++++++++++++++
 4 files changed, 265 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwrng/brcm,iproc-rng200.txt
 create mode 100644 drivers/char/hw_random/iproc-rng200.c

-- 
2.2.2
