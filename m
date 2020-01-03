Return-Path: <SRS0=7PY0=2Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF16BC00523
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jan 2020 22:39:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A69E52465A
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jan 2020 22:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578091189;
	bh=eZIP4KIWxeGwOG4p0RiBeNAYcb6lwKBGuBGGniccGAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ccBDVhts0019FcN3rusynZLuUt3uV8OcdF4ofozyuEURJXkWnE+oApFO5zym2rm06
	 nH2D9lf5AHj1+Hk7xpuU50gSz1UTZmh9XqPpWpdDqhzYlbJ13qZEMbiOaLBzEPfOse
	 TO3LWCrE+3BSbOPrY0Qyrdl1yed9TTtxcE/EzRoo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728863AbgACWjs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Jan 2020 17:39:48 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:36446 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728816AbgACWjp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Jan 2020 17:39:45 -0500
Received: by mail-io1-f67.google.com with SMTP id r13so32892166ioa.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jan 2020 14:39:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zkpAQHH/RoZyf/tc8qpSyGyxg+iM3EC4X8NtpzdVpM0=;
        b=NXKoYsJSpmkfWYQj/nO2eVEqk6cB9AVRz24KnLWfnk5vdaMqfMgp+7hfX4H7zlGuZZ
         fUhq2s60mt1ub/Omexa5N04l6hK8mYYEuF7/+89lpjvoGUKUrIfspfmOyPIUGwuqtI1t
         trL4ivOTiufazL7E+tWFisADMLpeAetB/rb9rLY2Aw4shgjw1KTK02syDBkPXpkWPPrL
         ALqk216o/pdWD7mO1rB1qrLE1NjKb2lcT4i9KW+bUd/m1RYSKlMfgTXQJ9xFTrFpHhAa
         PfVtpJzW+JUdbKnkC82eo2I4VECGcj9r2y3Qc93qGi0ffjgNiEROM8PiVrnODqNxb+Zd
         HCyg==
X-Gm-Message-State: APjAAAWxkol78xtNp7C5LUEXV2HT7UE4hxQGRxVQSCWWGrXdeHcS7YrN
        yhM+RsR4hZ3d/jGUFZPcf8Elj88=
X-Google-Smtp-Source: APXvYqwLbh8r1WHM545hpF2F1OhgXTNDM3zFcXW8Hbk7IIiCn50KGXR+UUD5oCvbg+qq/0dC6e3Yww==
X-Received: by 2002:a6b:b7d5:: with SMTP id h204mr21194799iof.238.1578091183964;
        Fri, 03 Jan 2020 14:39:43 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id z81sm20341182ilc.17.2020.01.03.14.39.42
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 14:39:42 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 15:39:40 -0700
Date:   Fri, 3 Jan 2020 15:39:40 -0700
From:   Rob Herring <robh@kernel.org>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, kishon@ti.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com
Subject: Re: [PATCH v5 3/5] dt-bindings: phy: tegra: Add Tegra194 support
Message-ID: <20200103223940.GA9205@bogus>
References: <20200103081814.9848-1-jckuo@nvidia.com>
 <20200103081814.9848-4-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200103081814.9848-4-jckuo@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jan 03, 2020 at 04:18:12PM +0800, JC Kuo wrote:
> Extend the bindings to cover the set of features found in Tegra194.
> Note that, technically, there are four more supplies connected to the
> XUSB pad controller (DVDD_PEX, DVDD_PEX_PLL, HVDD_PEX and HVDD_PEX_PLL)
> , but the power sequencing requirements of Tegra194 require these to be
> under the control of the PMIC.
> 
> Tegra194 XUSB PADCTL supports up to USB 3.1 Gen 2 speed, however, it
> is possible for some platforms have long signal trace that could not
> provide sufficient electrical environment for Gen 2 speed. This patch
> adds a "maximum-speed" property to usb3 ports which can be used to
> specify the maximum supported speed for any particular USB 3.1 port.
> For a port that is not capable of SuperSpeedPlus, "maximum-speed"
> property should carry "super-speed".
> 
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
> Changes in v5:
> - re-use "maximum-speed" instead of adding "nvidia,disable-gen2"
> Changes in v4: none
> Changes in v3: none
> Changes in v2:
> - fix a typo
> 
>  .../phy/nvidia,tegra124-xusb-padctl.txt        | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
> index 9fb682e47c29..7d0089006e67 100644
> --- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
> +++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
> @@ -37,6 +37,7 @@ Required properties:
>    - Tegra132: "nvidia,tegra132-xusb-padctl", "nvidia,tegra124-xusb-padctl"
>    - Tegra210: "nvidia,tegra210-xusb-padctl"
>    - Tegra186: "nvidia,tegra186-xusb-padctl"
> +  - Tegra194: "nvidia,tegra194-xusb-padctl"
>  - reg: Physical base address and length of the controller's registers.
>  - resets: Must contain an entry for each entry in reset-names.
>  - reset-names: Must include the following entries:
> @@ -62,6 +63,10 @@ For Tegra186:
>  - vclamp-usb-supply: Bias rail for USB pad. Must supply 1.8 V.
>  - vddio-hsic-supply: HSIC PHY power supply. Must supply 1.2 V.
>  
> +For Tegra194:
> +- avdd-usb-supply: USB I/Os, VBUS, ID, REXT, D+/D- power supply. Must supply
> +  3.3 V.
> +- vclamp-usb-supply: Bias rail for USB pad. Must supply 1.8 V.
>  
>  Pad nodes:
>  ==========
> @@ -154,6 +159,11 @@ For Tegra210, the list of valid PHY nodes is given below:
>  - sata: sata-0
>    - functions: "usb3-ss", "sata"
>  
> +For Tegra194, the list of valid PHY nodes is given below:
> +- usb2: usb2-0, usb2-1, usb2-2, usb2-3
> +  - functions: "xusb"
> +- usb3: usb3-0, usb3-1, usb3-2, usb3-3
> +  - functions: "xusb"
>  
>  Port nodes:
>  ===========
> @@ -221,6 +231,11 @@ Optional properties:
>    is internal. In the absence of this property the port is considered to be
>    external.
>  
> +- maximum-speed: Only for Tegra194. A string property that specifies maximum
> +  supported speed of a usb3 port. Valid values are:
> +  - "super-speed-plus": default, the usb3 port supports USB 3.1 Gen 2 speed.

Not defined as a valid value in usb/generic.txt. '-gen2' instead of 
'-plus' would be clearer IMO. However, is there any need to define the 
maximum speed possible? The purpose of this property is to limit the 
speed below the max.

> +  - "super-speed": the usb3 port supports USB 3.1 Gen 1 speed only.
> +
>  For Tegra124 and Tegra132, the XUSB pad controller exposes the following
>  ports:
>  - 3x USB2: usb2-0, usb2-1, usb2-2
> @@ -233,6 +248,9 @@ For Tegra210, the XUSB pad controller exposes the following ports:
>  - 2x HSIC: hsic-0, hsic-1
>  - 4x super-speed USB: usb3-0, usb3-1, usb3-2, usb3-3
>  
> +For Tegra194, the XUSB pad controller exposes the following ports:
> +- 4x USB2: usb2-0, usb2-1, usb2-2, usb2-3
> +- 4x super-speed USB: usb3-0, usb3-1, usb3-2, usb3-3
>  
>  Examples:
>  =========
> -- 
> 2.17.1
> 
