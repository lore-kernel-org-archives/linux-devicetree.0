Return-Path: <SRS0=bLyw=SN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45456 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726538AbfDKPZO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 11 Apr 2019 11:25:14 -0400
Received: by mail-lj1-f195.google.com with SMTP id y6so5889408ljd.12
        for <devicetree@vger.kernel.org>; Thu, 11 Apr 2019 08:25:12 -0700 (PDT)
Date: Thu, 11 Apr 2019 17:25:10 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH v2 00/20] Add more support to the RZ/G1C (r8a77470) SoC
Message-ID: <20190411152510.GD30887@bigcity.dyn.berto.se>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: Cao Van Dong <cv-dong@jinso.co.jp>
Cc: linux-renesas-soc@vger.kernel.org, broonie@kernel.org, geert+renesas@glider.be, horms+renesas@verge.net.au, devicetree@vger.kernel.org, biju.das@bp.renesas.com, yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

Hi Cao,

On 2019-04-11 16:54:02 +0900, Cao Van Dong wrote:
> Dear everyone,
> 
> This series adds HSCIF,MSIOF,PWM,CAN,VIN,Audio,Audio-DMAC,Ether,VSP,FDP1,LVDS support 
> for the RZ/G1C (r8a77470) SoC. It is based on the renesas-drivers-2019-04-02-v5.1-rc3 tag 
> of renesas-drivers tree. Currently, I only add patches to the tree and compiled. 
> Unfortunately, RZ/G1C board is not available, so I have not tested these patches on this board yet.
> 
> cc Biju,
> I know it is very difficult. however I still want to ask if you can help me test them?
> If possible, I will send the .dts file separately to you.
> Because I am known you can be available this board. Thanks!
> 
> Cao Van Dong (20):
>   ARM: dts: r8a77470: Add HSCIF support
>   ARM: dts: r8a77470: Add MSIOF support
>   ARM: dts: r8a77470: Add PWM support
>   ARM: dts: r8a77470: Add CAN support
>   ARM: dts: r8a77470: Add VIN support

The changes for VIN looks OK but as Chris points out it would be nice if 
they could be tested.

>   ARM: dts: r8a77470: Add Audio support
>   ARM: dts: r8a77470: Add Audio-DMAC support
>   ARM: dts: r8a77470: Add Ether support
>   ARM: dts: r8a77470: Add VSP support
>   ARM: dts: r8a77470: Add FDP1 support
>   ARM: dts: r8a77470: Add LVDS support
>   ARM: dts: r8a77470: Add audio clocks
>   ARM: dts: r8a77470: Add can clocks
>   dt-bindings: display: renesas: lvds: Add r8a77470 support
>   media: dt-bindings: media: rcar_vin: Document r8a77470 bindings
>   ASoC: rsnd: Document r8a77470 bindings
>   dt-bindings: pwm: Document r8a77470 bindings
>   sh_eth: Document r8a77470 bindings
>   spi: sh-msiof: Document r8a77470 bindings
>   dt-bindings: can: rcar_can: Document r8a77470 bindings

Nit-pick: I would first add the bindings to the documentation and then 
to the dts files.

> 
>  .../bindings/display/bridge/renesas,lvds.txt       |   1 +
>  .../devicetree/bindings/media/rcar_vin.txt         |   1 +
>  .../devicetree/bindings/net/can/rcar_can.txt       |   1 +
>  Documentation/devicetree/bindings/net/sh_eth.txt   |   1 +
>  .../devicetree/bindings/pwm/renesas,pwm-rcar.txt   |   1 +
>  .../devicetree/bindings/sound/renesas,rsnd.txt     |   1 +
>  Documentation/devicetree/bindings/spi/sh-msiof.txt |   1 +
>  arch/arm/boot/dts/r8a77470.dtsi                    | 608 +++++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_lvds.c                |   1 +
>  9 files changed, 616 insertions(+)
> 
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas S�derlund
