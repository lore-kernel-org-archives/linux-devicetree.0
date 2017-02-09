From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH v3 1/3] of: Support parsing phandle argument lists
 through a nexus node
Date: Thu, 9 Feb 2017 15:31:01 +0000
Message-ID: <20170209153101.GE27312@n2100.armlinux.org.uk>
References: <20170123204851.12808-1-stephen.boyd@linaro.org>
 <20170123204851.12808-2-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170123204851.12808-2-stephen.boyd@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <stephen.boyd@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 23, 2017 at 12:48:49PM -0800, Stephen Boyd wrote:
> 	connector: connector {
> 		#gpio-cells = <2>;
> 		gpio-map = <0 0 &soc_gpio1 1 0>,
> 			   <1 0 &soc_gpio2 4 0>,
> 			   <2 0 &soc_gpio1 3 0>,
> 			   <3 0 &soc_gpio2 2 0>;
> 		gpio-map-mask = <0xf 0x0>;
> 		gpio-map-pass-thru = <0x0 0x1>

This -map-mask and -map-pass-thru mechanism needs documentation in
Documentation/devicetree.  There's a bunch of users of -map-mask
(eg, interrupt-map-mask) but there's nothing that actually describes
how this works.

The "-map-pass-thru" thing also seems to be a new, undocumented idea.

So, NAK until this stuff goes through the same level of review WRT
DT documentation as other bindings are required to.

I'm not saying that it's a bad idea, but it's important for consistency
that this stuff is well documented, and people don't end up having to
interpret the code when writing their DT descriptions.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
