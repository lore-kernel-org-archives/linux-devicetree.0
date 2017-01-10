From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v5 2/2] ARM: dts: vf610-zii-dev: Add .dts file for rev. C
Date: Tue, 10 Jan 2017 14:18:20 +0800
Message-ID: <20170110061818.GY20956@dragon>
References: <20170107200654.26056-1-andrew.smirnov@gmail.com>
 <20170107200654.26056-2-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170107200654.26056-2-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Stefan Agner <stefan@agner.ch>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, andrew@lunn.ch, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>, cphealy@gmail.com
List-Id: devicetree@vger.kernel.org

On Sat, Jan 07, 2017 at 12:06:54PM -0800, Andrey Smirnov wrote:
> Add .dts file for rev. C of the board by factoring out commonalities
> into a shared include file (vf610-zii-dev-rev-b-c.dtsi) and deriving
> revision specific file from it (vf610-zii-dev-rev-b.dts and
> vf610-zii-dev-reb-c.dts).
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
> Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> Cc: cphealy@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

This patch doesn't apply to my imx/dt branch.  Please rebase.  Also
please ensure the copyright text is the correct one [1].

Shawn

[1] https://git.kernel.org/cgit/linux/kernel/git/shawnguo/linux.git/diff/?h=imx/dt&id=13283626c889fd5c03b485d54c924b795aca1c1e
