Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43676C282DD
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 20:38:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 194BD20692
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 20:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578515917;
	bh=xfWnOd0ixEmSnzOZ2K1ZrN99iyNkxjXxN6XgVWk9nCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=MO0zyzTGUO/y2JocyoZVfOBwXwuhOpw0MEWeV5MxpGCtxpHsqLkauePykybct9QHR
	 mgGTupz2vGrcF1nb8d9GcBSLF17pPpZaDE2B0y7TOphlZutz8NceIX6tdPrMLO783k
	 gwy2TLqALW+n+EOBV3hQh3rynX3zJfD4ocJm2CIc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725446AbgAHUig (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 15:38:36 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35735 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbgAHUid (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 15:38:33 -0500
Received: by mail-ot1-f67.google.com with SMTP id i15so4955294oto.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 12:38:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fYbMCE8GKhztIwg7FUhSFbp5MPOuXQT9UONOLwZL9bI=;
        b=BZvuI3lPom2ywEXzksuW/h0w9dselxV3cQyE5cZXJP3avd6yq4Z+5Yyhy1bgTjqViH
         s7Qx0A61tLQ1Il9k1vM8LSIQo0JF8wrKtk9IPKtSuSSysD7oGGmDyUIjRFnuVgOjRtOb
         0s+ndeS0oUgQuLgEt/bCNa/zFXNvluio46r1zN6Bjo3gdNmBrM2hxqoOHq/UCqdYb/cO
         waJwpUG94+aRQeSNaKudiXacFeX6jdpr8tI2QDlgLin7kGan9ObjZik6/MiHgsGi8A/X
         2Xid+fGiY0+s7GIn5Po2qCKiu9wNP5uVYu11ivk+24M9pOiEFsOKAuJyfqo+cRmsGWBs
         3Vsg==
X-Gm-Message-State: APjAAAXSImH90ALb2Uiv76Xm7/kQrfzehulRT93hiG7dKEiu5RpmJq02
        /kTFzuzJowGopeHUmiHSPGua/Dc=
X-Google-Smtp-Source: APXvYqw1Q3X0INm8ciIeFVc4oXQLz3nYW+Z3aEnonUp+Th+otErq3C4KAVyZLAVUaHnTmFuVj4Kl/Q==
X-Received: by 2002:a05:6830:ce:: with SMTP id x14mr5419554oto.289.1578515911950;
        Wed, 08 Jan 2020 12:38:31 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l82sm1451517oib.41.2020.01.08.12.38.29
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 12:38:30 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220333
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 14:38:29 -0600
Date:   Wed, 8 Jan 2020 14:38:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Roger Lu <roger.lu@mediatek.com>
Cc:     Kevin Hilman <khilman@kernel.org>,
        Nicolas Boichat <drinkcat@google.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Fan Chen <fan.chen@mediatek.com>,
        HenryC Chen <HenryC.Chen@mediatek.com>,
        YT Lee <yt.lee@mediatek.com>,
        Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
        Charles Yang <Charles.Yang@mediatek.com>,
        Angus Lin <Angus.Lin@mediatek.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: soc: add mtk svs dt-bindings
Message-ID: <20200108203829.GA18987@bogus>
References: <20200107070154.1574-1-roger.lu@mediatek.com>
 <20200107070154.1574-2-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107070154.1574-2-roger.lu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jan 07, 2020 at 03:01:52PM +0800, Roger Lu wrote:
> Document the binding for enabling mtk svs on MediaTek SoC.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> ---
>  .../devicetree/bindings/power/mtk-svs.txt     | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/mtk-svs.txt
> 
> diff --git a/Documentation/devicetree/bindings/power/mtk-svs.txt b/Documentation/devicetree/bindings/power/mtk-svs.txt
> new file mode 100644
> index 000000000000..9a3e81b9e1d2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/mtk-svs.txt
> @@ -0,0 +1,76 @@
> +* Mediatek Smart Voltage Scaling (MTK SVS)
> +
> +This describes the device tree binding for the MTK SVS controller (bank)
> +which helps provide the optimized CPU/GPU/CCI voltages. This device also
> +needs thermal data to calculate thermal slope for accurately compensate
> +the voltages when temperature change.
> +
> +Required properties:
> +- compatible:
> +  - "mediatek,mt8183-svs" : For MT8183 family of SoCs
> +- reg: Address range of the MTK SVS controller.
> +- interrupts: IRQ for the MTK SVS controller.
> +- clocks, clock-names: Clocks needed for the svs hardware. required
> +                       clocks are:
> +		       "main": Main clock for svs controller to work.
> +- nvmem-cells: Phandle to the calibration data provided by a nvmem device.
> +- nvmem-cell-names: Should be "svs-calibration-data" and "calibration-data"
> +
> +Subnodes:
> +- svs-cpu-little: SVS bank device node of little CPU
> +  compatible: "mediatek,mt8183-svs-cpu-little"
> +  operating-points-v2: OPP table hooked by SVS little CPU bank.
> +		       SVS will optimze this OPP table voltage part.
> +  vcpu-little-supply: PMIC buck of little CPU
> +- svs-cpu-big: SVS bank device node of big CPU
> +  compatible: "mediatek,mt8183-svs-cpu-big"
> +  operating-points-v2: OPP table hooked by SVS big CPU bank.
> +		       SVS will optimze this OPP table voltage part.
> +  vcpu-big-supply: PMIC buck of big CPU
> +- svs-cci: SVS bank device node of CCI
> +  compatible: "mediatek,mt8183-svs-cci"
> +  operating-points-v2: OPP table hooked by SVS CCI bank.
> +		       SVS will optimze this OPP table voltage part.
> +  vcci-supply: PMIC buck of CCI
> +- svs-gpu: SVS bank device node of GPU
> +  compatible: "mediatek,mt8183-svs-gpu"
> +  operating-points-v2: OPP table hooked by SVS GPU bank.
> +		       SVS will optimze this OPP table voltage part.
> +  vgpu-supply: PMIC buck of GPU
> +
> +Example:
> +
> +	svs: svs@1100b000 {
> +		compatible = "mediatek,mt8183-svs";
> +		reg = <0 0x1100b000 0 0x1000>;
> +		interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&infracfg CLK_INFRA_THERM>;
> +		clock-names = "main_clk";
> +		nvmem-cells = <&svs_calibration>, <&thermal_calibration>;
> +		nvmem-cell-names = "svs-calibration-data", "calibration-data";
> +
> +		svs_cpu_little: svs-cpu-little {
> +			compatible = "mediatek,mt8183-svs-cpu-little";
> +			operating-points-v2 = <&cluster0_opp>;
> +			vcpu-little-supply = <&mt6358_vproc12_reg>;
> +		};

I don't think this is a good binding. This information already exists 
elsewhere in the DT, so your driver should just look in those nodes. 
For example the regulator can be in the cpu nodes or the OPP table 
itself.

Rob
