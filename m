Return-Path: <SRS0=zz4c=JV=verge.net.au=horms@kernel.org>
Date: Thu, 5 Jul 2018 18:00:42 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: dts: gr-peach: Add GR-Peach audiocamerashield
 support
Message-ID: <20180705160042.idocy5thyz26jshk@verge.net.au>
References: <1530650469-29201-1-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1530650469-29201-1-git-send-email-jacopo+renesas@jmondi.org>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: geert@linux-m68k.org, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-media@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Jul 03, 2018 at 10:41:09PM +0200, Jacopo Mondi wrote:
> Add device tree header for GR-Peach's audiocamerashield with MT9V111
> image sensor.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> 
> The GR-Peach audiocamera shield is an expansion board for the GR-Peach that
> comes with an MT9V111 camera module.
> 
> https://www.core.co.jp/product/m2m/gr-peach/audio-camera.html
> https://www.digikey.com/product-detail/en/renesas-electronics-america/YGRPEACHAUDIOCAMERASHIELD/YGRPEACHAUDIOCAMERASHIELD-ND/5800301
> 
> The series functionally depends on the already sent support for the MT9V111
> sensor, but does not have any compile time dependency on it (a checkpatch
> warning on the un-documented "aptina-mt9v111" compatible string apart).
> 
> https://lkml.org/lkml/2018/6/11/469
> 
> (copied the linux-media list to which I'll send a gentle ping for the
> driver later ;)
> 
> Thanks
>    j
> ---
>  arch/arm/boot/dts/gr-peach-audiocamerashield.dtsi | 79 +++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 arch/arm/boot/dts/gr-peach-audiocamerashield.dtsi

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
