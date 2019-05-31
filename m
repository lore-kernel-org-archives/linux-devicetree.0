From: Luca Weiss <luca@z3ntu.xyz>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: Add lradc node
Date: Fri, 31 May 2019 12:27:55 +0200
Message-ID: <6901794.oDhxEVzEqc@g550jk>
References: <20190518170929.24789-1-luca@z3ntu.xyz> <4343071.IDWclfcoxo@g550jk> <20190524092001.ztf3kntaj4uiswnv@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190524092001.ztf3kntaj4uiswnv@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Freitag, 24. Mai 2019 11:20:01 CEST Maxime Ripard wrote:
> 
> It would be great to drop the -keys from the compatible, and to
> document the bindings
> 
> Looks good otherwise
> 
> Maxime

Hi again,

So I should just document the "allwinner,sun50i-a64-lradc" string in 
Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt ? Don't I also 
have to add the compatible to the driver code then? Just adding the a64 
compatible to a dts wouldn't work without that.

Thanks, Luca
