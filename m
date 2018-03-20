From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCHv2 5/5] arm64: allwinner: a64: Add support for TERES-I
 laptop
Date: Tue, 20 Mar 2018 15:13:54 +0100
Message-ID: <20180320141353.zmzq4e5652rsp4ye@flea>
References: <20180315162510.11669-1-harald@ccbib.org>
 <20180315162510.11669-6-harald@ccbib.org>
 <20180318202251.5gpv6sblfr4edxmj@flea>
 <E1exwhF-0000Qw-4g@stardust.g4.wien.funkfeuer.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E1exwhF-0000Qw-4g@stardust.g4.wien.funkfeuer.at>
Sender: linux-kernel-owner@vger.kernel.org
To: Harald Geyer <harald@ccbib.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Icenowy Zheng <icenowy@aosc.io>, info@olimex.com
List-Id: devicetree@vger.kernel.org

On Mon, Mar 19, 2018 at 04:27:36PM +0100, Harald Geyer wrote:
> > together with all the patches but the
> > PWM (so I had to drop the backlight node as well).
> >
> > Please coordinate with Andre about who should send the PWM support.
> 
> Seems the patch got broken because only the backlight node but not the
> pwm node was removed. Anyway, since Andre has already sent an updated
> version of his series, maybe just revert the broken patch, merge his
> series and then apply the original teres-i patch again?

Unfortunately, there's dependencies on the PWM driver itself, and the
maintainer hasn't replied yet.

Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
