From: James Hartley <james.hartley@imgtec.com>
Subject: [PATCH 0/2] crypto: Add support for the IMG hash accelerator
Date: Mon, 10 Nov 2014 12:10:53 +0000
Message-ID: <1415621455-10468-1-git-send-email-james.hartley@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-crypto-owner@vger.kernel.org>
Sender: linux-crypto-owner@vger.kernel.org
To: herbert@gondor.apana.org.au, davem@davemloft.net, grant.likely@linaro.org, robh+dt@kernel.org, akpm@linux-foundation.org, gregkh@linuxfoundation.org, joe@perches.com, mchehab@osg.samsung.com, crope@iki.fi, jg1.han@samsung.com, linux-crypto@vger.kernel.org
Cc: devicetree@vger.kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, abrestic@chromium.org, ezequiel.garcia@imgtec.com, James Hartley <james.hartley@imgtec.com>
List-Id: devicetree@vger.kernel.org

This adds support for the Imagination Technologies hash
accelerator that provides hardware acceleration for
SHA1 SHA224 SHA256 and MD5 Hashes. 

This hardware is present in the upcoming Pistachio SoC.

James Hartley (2):
  crypto: Add Imagination Technologies hw hash accelerator
  Documentation: crypto: Add DT binding info for the img hw hash
    accelerator

 .../devicetree/bindings/crypto/img-hash.txt        |   28 +
 MAINTAINERS                                        |    5 +
 drivers/crypto/Kconfig                             |   13 +
 drivers/crypto/Makefile                            |    1 +
 drivers/crypto/img-hash.c                          | 1048 ++++++++++++++++++++
 5 files changed, 1095 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/img-hash.txt
 create mode 100644 drivers/crypto/img-hash.c

-- 
1.7.9.5
