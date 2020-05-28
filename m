Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1683C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 17:37:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2C03207BC
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 17:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590687479;
	bh=lP3eHe5KHwZbJrbFyf1WV3E4JSbHtHNN5qWLOGSJv3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=stajzAx1skWntdCTBfaf8QoWFpQ30Ez+U58bmfMI34rmdxDXBWNeKH/Dd0x7+tnpa
	 YfRgXXDKvVPrMno25mSSr/Z77gMNtK/1Z+GVD/K3MTuq3ghsfxiBbil8/qg/fICHDh
	 9zOiuo7eL0rfZvGgWNICxOuFo5YcN78nlYHJ7h4c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405372AbgE1Rh7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 13:37:59 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:33006 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405041AbgE1Rh6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 13:37:58 -0400
Received: by mail-il1-f195.google.com with SMTP id y17so1068706ilg.0
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 10:37:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=GiD0oyk/KKQdbg44fIYbxmFQPOLIBFzL4LRBCx2gE2E=;
        b=pdxnbR2WoGwPjqFH8a5chIdrTtJFnT3leOPE1j9WzbeV4K8dSjCto+HAuBO4UYqcz8
         FB85DZMevnDmNRA6XyY9+9O9vRygoJPayGSSHUSHHUdqG9cdEu9O3DBEHHuS8Q2fMQCl
         hvzPxcz4SvJBQ6IlvfFvfVEcQF8qgCyWO2jJrKgExPTyMBq7J7fat6ePjH17ov0oL5gl
         l5dAWzSK3mFdaBNLx4VE7geaziTx1en+XxdBGwyKcLzPmkqtV6JiSf5CW7uNyO+9N5tw
         qtV9Un+Q/eLOIx5v60Gzr9uzUfKc3FOgbC5Jv1NqDEVENu69+7qfxqKApUDW2+axY3qw
         DjFw==
X-Gm-Message-State: AOAM533JoenwX3nNZOdv2yCCE1P3gcZuRtBpdPJndEtJPjgOMAVfqIEp
        MPmR96ve0cDvnEqvifc47Q==
X-Google-Smtp-Source: ABdhPJz6XG8IeR1Wf7SDceVEEvWMzunefbyvqCnZoj/YTWnEQp5dGohnm7sv7KyHZntAzHxF6L2Szw==
X-Received: by 2002:a92:155b:: with SMTP id v88mr3691249ilk.274.1590687477415;
        Thu, 28 May 2020 10:37:57 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id d16sm3567690ilg.71.2020.05.28.10.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 10:37:56 -0700 (PDT)
Received: (nullmailer pid 360225 invoked by uid 1000);
        Thu, 28 May 2020 17:37:55 -0000
Date:   Thu, 28 May 2020 11:37:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Cc:     Laurent.pinchart@ideasonboard.com, kernel@collabora.com,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, jason@lakedaemon.net,
        tomi.valkeinen@ti.com, airlied@linux.ie, shawnguo@kernel.org
Subject: Re: [PATCH v2 1/4] ARM: dts: dove: Make the DT compliant with the
 ti,tfp410 binding
Message-ID: <20200528173755.GA113289@bogus>
References: <20200514143612.2094-1-ricardo.canuelo@collabora.com>
 <20200514143612.2094-2-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200514143612.2094-2-ricardo.canuelo@collabora.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, May 14, 2020 at 04:36:09PM +0200, Ricardo Cañuelo wrote:
> Define a 'ports' node for 'dvi: video@39' and use the proper naming for
> the powerdown-gpios property to make it compliant with the ti,tfp410
> binding.
> 
> This fills the minimum requirements to meet the binding requirements,
> port endpoints are not defined.

Just make 'ports' optional. This isn't really any better unless you add 
endpoints too.

> 
> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
> ---
>  arch/arm/boot/dts/dove-sbc-a510.dts | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/dove-sbc-a510.dts b/arch/arm/boot/dts/dove-sbc-a510.dts
> index 2bb85a9b7614..32804c981625 100644
> --- a/arch/arm/boot/dts/dove-sbc-a510.dts
> +++ b/arch/arm/boot/dts/dove-sbc-a510.dts
> @@ -132,7 +132,18 @@
>  	dvi: video@39 {
>  		compatible = "ti,tfp410";
>  		reg = <0x39>;
> -		powerdown-gpio = <&gpio_ext 3 GPIO_ACTIVE_LOW>;
> +		powerdown-gpios = <&gpio_ext 3 GPIO_ACTIVE_LOW>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			port@0 {
> +				reg = <0>;
> +			};
> +			port@1 {
> +				reg = <1>;
> +			};
> +		};
>  	};
>  };
>  
> -- 
> 2.18.0
> 
