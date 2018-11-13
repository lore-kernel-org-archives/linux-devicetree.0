From: Gilad Ben-Yossef <gilad@benyossef.com>
Subject: [PATCH 0/3] new HW version and co-maintainer
Date: Tue, 13 Nov 2018 09:40:34 +0000
Message-ID: <1542102039-22256-1-git-send-email-gilad@benyossef.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Yael Chemla <yael.chemla@foss.arm.com>
Cc: Ofir Drang <Ofir.Drang@arm.com>, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add support for CryptoCell 703 HW revision and a new co-maintainer.

Gilad Ben-Yossef (3):
  crypto: ccree: add support for CryptoCell 703
  dt-bindings: crypto: ccree: add dt bindings for ccree 703
  MAINTAINERS: ccree: add co-maintainer

 .../devicetree/bindings/crypto/arm-cryptocell.txt  |  1 +
 MAINTAINERS                                        |  1 +
 drivers/crypto/Kconfig                             |  2 +-
 drivers/crypto/ccree/cc_aead.c                     | 16 ++++++++-
 drivers/crypto/ccree/cc_cipher.c                   | 38 +++++++++++++++++++++-
 drivers/crypto/ccree/cc_driver.c                   | 19 ++++++++---
 drivers/crypto/ccree/cc_driver.h                   |  8 +++++
 drivers/crypto/ccree/cc_hash.c                     | 16 +++++++--
 8 files changed, 92 insertions(+), 9 deletions(-)

-- 
2.7.4
