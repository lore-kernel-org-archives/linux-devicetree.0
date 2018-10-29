From: Gilad Ben-Yossef <gilad@benyossef.com>
Subject: [PATCH v2 0/3] crypto: ccree: add CryptoCell 713 baseline support
Date: Mon, 29 Oct 2018 09:50:11 +0000
Message-ID: <1540806616-5483-1-git-send-email-gilad@benyossef.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Ofir Drang <Ofir.Drang@arm.com>, Yael Chemla <Yael.Chemla@arm.com>, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add first batch of patches for support of Arm TrustZone CryptoCell 713.

Changes from v1:
- Format dt bindings document one version per line and correct the heading
  as indicated by Rob Herring.

Gilad Ben-Yossef (3):
  crypto: ccree: add support for CryptoCell 713
  dt-bindings: crypto: ccree: add ccree 713
  crypto: ccree: add SM4 support

 .../devicetree/bindings/crypto/arm-cryptocell.txt  |  7 ++-
 drivers/crypto/Kconfig                             |  3 +-
 drivers/crypto/ccree/cc_cipher.c                   | 66 ++++++++++++++++++++++
 drivers/crypto/ccree/cc_driver.c                   | 23 +++++---
 drivers/crypto/ccree/cc_driver.h                   |  5 +-
 drivers/crypto/ccree/cc_hw_queue_defs.h            |  3 +
 6 files changed, 94 insertions(+), 13 deletions(-)

-- 
2.7.4
