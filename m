From: Richard Zhao <richard.zhao@linaro.org>
Subject: Re: An extremely simplified pinctrl bindings proposal
Date: Sun, 05 Feb 2012 14:07:10 +0800
Message-ID: <2e92398f-b634-4bad-a911-2a2295b7e1b0@email.android.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF178E5D3160@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF178E5D3160@HQMAIL01.nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@nvidia.com>, Dong Aisheng <dongas86@gmail.com>, Shawn Guo <shawn.guo@linaro.org>, Dong Aisheng-B29396 <B29396@freescale.com>, "Linus Walleij (linus.walleij@linaro.org)" <linus.walleij@linaro.org>, "Sascha Hauer (s.hauer@pengutronix.de)" <s.hauer@pengutronix.de>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "cjb@laptop.org" <cjb@laptop.org>, "Simon Glass (sjg@chromium.org)" <sjg@chromium.org>, Thomas Abraham <thomas.abraham@linaro.org>, "Grant Likely (grant.likely@secretlab.ca)" <grant.likely@secretlab.ca>"rob.herring@calxeda.com" <rob.herring@calxeda.com>, "ext Tony Lindgren (tony@atomide.com)" <tony@atomide.com>
Cc: "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

lol, great, and it may be more generic by define register update routines.
some boards may need different pad settings in suspend.
some quirks or work around for hw issues may be out kernel this way.

richard
