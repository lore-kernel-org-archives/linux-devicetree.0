From: Y Vo <yvo@apm.com>
Subject: [PATCH v1] arm64: dts: Add poweroff button device node for APM X-Gene platform
Date: Fri, 26 Jun 2015 15:01:46 +0700
Message-ID: <1435305707-22786-1-git-send-email-yvo@apm.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arm@kernel.org, linux-kernel@vger.kernel.org
Cc: Y Vo <yvo@apm.com>, Phong Vo <pvo@apm.com>, Toan Le <toanle@apm.com>, patches@apm.com, Loc Ho <lho@apm.com>
List-Id: devicetree@vger.kernel.org

This patch adds poweroff button device node to support poweroff feature
on APM X-Gene Mustang platform.

V1 change:
	- Remove unused property.

Y Vo (1):
  arm64: dts: Add poweroff button device node for APM X-Gene platform

 arch/arm64/boot/dts/apm/apm-mustang.dts |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

