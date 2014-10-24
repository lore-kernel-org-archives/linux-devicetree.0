From: Yingjoe Chen <srv_yingjoe.chen@mediatek.com>
Subject: Re: [PATCH 6/7] arm: mediatek: enable gpt6 on boot up to make arch
 timer working
Date: Fri, 24 Oct 2014 21:53:34 +0800
Message-ID: <1414158814.14830.610.camel@mtksdaap41>
References: <1406824943-24052-1-git-send-email-matthias.bgg@gmail.com>
	 <1406824943-24052-7-git-send-email-matthias.bgg@gmail.com>
	 <CACRpkdbRhGE8tcKj+W_4F9-xmcm-fxcYuCmLOqX-ESC+3PAmyA@mail.gmail.com>
	 <CABuKBe+Q3tnN0s22EMY-dK_6FeN_xN9SmrsW3dPONR6QDJ+V_w@mail.gmail.com>
	 <CACRpkdZOB=9wQ3R3sfcBEiNXLVRtgob4iLZ9QWXyVrgjqyvGXQ@mail.gmail.com>
	 <CABuKBeJOgkDZ8drPf3LnT2jPH7PEWX2__HDM7_jZbg2BhDRy3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABuKBeJOgkDZ8drPf3LnT2jPH7PEWX2__HDM7_jZbg2BhDRy3g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, Stephen Warren <swarren@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, Mike Turquette <mturquette@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbart>
List-Id: devicetree@vger.kernel.org


Hi Matthias,

I didn't saw this in v3.18-rc1, are you working on version 2 of this?
mt8135 and m8127 also need this fixup and we need this to have SMP
working.

Joe.C
