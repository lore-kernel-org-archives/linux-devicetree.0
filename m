From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 0/8] pinctrl-ingenic GPIO merge + JZ4725B
Date: Tue, 21 Aug 2018 18:42:28 +0200
Message-ID: <20180821164236.21101-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: od@zcrc.me, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Linus,

I created a V2 to address the issue that Rob's bot reported.
The dt-bindings doc changes were moved to their own patch [1/8].

The only other change is that I dropped the "ingenic,jz4725b-pinctrl"
compatible string as it does not provide any functional difference.

Thanks,
-Paul Cercueil
