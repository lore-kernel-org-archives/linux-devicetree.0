From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Subject: [PATCH 0/2] Enable DRM/KMS support for STiH407 and STiH410 boards
Date: Wed, 14 Jan 2015 16:47:10 +0100
Message-ID: <1421250432-25903-1-git-send-email-gabriel.fernandez@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, benjamin.gaignard@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Gabriel Fernandez <gabriel.fernandez@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch-set Enable DRM/KMS support for STiH407-b2120 and STiH410-b2120 boards.

This patch-set replace the previous one (PATCH 0/2] Enable DRM/KMS support for STiH407 Family boards)

Gabriel Fernandez (2):
  ARM: DT: STiH407: Add DRM dt nodes
  ARM: DT: STiH410: Add DRM dt nodes

 arch/arm/boot/dts/stih407-b2120.dts  |   3 +-
 arch/arm/boot/dts/stih407.dtsi       | 151 +++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/stih410.dtsi       | 138 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/stihxxx-b2120.dtsi |   2 +-
 4 files changed, 291 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/stih407.dtsi

-- 
1.9.1
