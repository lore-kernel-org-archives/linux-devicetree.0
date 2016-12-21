From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: Re: [v4,1/3] ARM: dts: vf610-zii-dev-rev-b: Remove leftover PWM pingroup
Date: Wed, 21 Dec 2016 16:30:11 +0300
Message-ID: <1482327011-19979-1-git-send-email-nikita.yoush@cogentembedded.com>
References: <1482131877-6097-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1482131877-6097-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, andrew@lunn.ch, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Russell King <linux@armlinux.org.uk>, Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, cphealy@gmail.com
List-Id: devicetree@vger.kernel.org

> Remove pwm0grp since it is:
>
>	a) Not referenced anywhere in the DTS file (unlike Tower board it
>	is based on, this board does not use/expose FTM0)
>
>	b) Configures PTB2 and PTB3 in a way that contradicts
>	pinctrl-mdio-mux
>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Tested-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
