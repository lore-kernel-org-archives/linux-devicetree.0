From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v6 1/2] ARM: dts: vf610-zii-dev-rev-b: Remove leftover
 PWM pingroup
Date: Tue, 10 Jan 2017 15:52:22 +0800
Message-ID: <20170110075221.GE20956@dragon>
References: <20170110073555.12178-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170110073555.12178-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Stefan Agner <stefan@agner.ch>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, andrew@lunn.ch, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, cphealy@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, Jan 09, 2017 at 11:35:54PM -0800, Andrey Smirnov wrote:
> Remove pwm0grp since it is:
> 
> 	a) Not referenced anywhere in the DTS file (unlike Tower board it
> 	is based on, this board does not use/expose FTM0)
> 
> 	b) Configures PTB2 and PTB3 in a way that contradicts
> 	pinctrl-mdio-mux
> 
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: andrew@lunn.ch
> Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> Cc: cphealy@gmail.com
> Tested-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Applied both, thanks.
