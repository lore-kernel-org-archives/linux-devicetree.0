Return-Path: <SRS0=QTuQ=ZD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D03C43331
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 Nov 2019 05:26:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 47E5C20869
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 Nov 2019 05:26:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Id2pwHg4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbfKKF0a (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 Nov 2019 00:26:30 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:47047 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbfKKF0a (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 Nov 2019 00:26:30 -0500
Received: by mail-pl1-f194.google.com with SMTP id l4so7286886plt.13
        for <devicetree@vger.kernel.org>; Sun, 10 Nov 2019 21:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=j+5DoLx/+5d+nBT588P2rdKPpi4fh8lF1dO9cEj8nag=;
        b=Id2pwHg4oT/8rPULgYGnoGFCJ/96XHV7i3So7ZiqX8FDx9xxRUtyw/bMtvMWmQ2M6C
         KZFSXVrxv62Q05jfMm9JFmCUIC4mq4fe1hC4wl8TRyF8hETO54CSz+CeM15rZ6d3/RDp
         wf34F/PGXe6ZDZPEPLXgM2BA067vDkUmtZG5A+oIMopscUboWUo5319m8R6+5+K1Net1
         JLuB2Vuoqgk8OThn3x23hOv8/QgXYFDKTomhC8DIznN9FuDgxq0Q9WmRHY5Y5HVJ5AJF
         diWZWul2JiDpSSJTY36fOyjYArnlcZwGuNan8NN8NPQz6cIrw4f+8nX9VsdMTKHDXfRT
         9dIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=j+5DoLx/+5d+nBT588P2rdKPpi4fh8lF1dO9cEj8nag=;
        b=V665uY1b7dRsl6fZOQjMpGg5UA04P3d0/fnbyg+2IUiFGdNDVAhvdVfcBvnomJVRJT
         Q9bGMLckdbrsGvu0ZRPCGDc0/7GrcPnuWRSSUTZb2ivf25BIEuCSRCTyMUTFA2+i6Juh
         IiPKsQf6XCEB10oPaQKJsLHJ2y/WQOvbbrQ+5uwTlnxcidbnnwODkejAzgnrVFbP6ArD
         ofSkaQUVE2p2K9FwIKjvIJjlABya+aIdJ9+UOv2TVf4KBFd+kPnaYYNgYDCptOV2I/nX
         tKT9crge97/rusvaYi1E60/J0MBhHf8Xt5ONPt7JAWej5ZNXFv6I2FN93y0kOYbXPVS+
         6VgQ==
X-Gm-Message-State: APjAAAUXsCO6piu9tyzonbvyWDtCA+TAzv+4dBgKtdgykhCJ+yxMYrLB
        XiRdMTPE1kmY794NR9uWD9yM
X-Google-Smtp-Source: APXvYqwmHEbXyu5c91D+UGBVYPGe00SdKoaGJbfYT43txJuTVOANtSTCgCHvRZXN42W57SwBlvskWQ==
X-Received: by 2002:a17:902:322:: with SMTP id 31mr13803033pld.293.1573449988238;
        Sun, 10 Nov 2019 21:26:28 -0800 (PST)
Received: from Mani-XPS-13-9360 ([2409:4072:6309:fffb:304b:b40d:24e5:f9a8])
        by smtp.gmail.com with ESMTPSA id x190sm14427837pfc.89.2019.11.10.21.26.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Nov 2019 21:26:27 -0800 (PST)
Date:   Mon, 11 Nov 2019 10:56:20 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Kever Yang <kever.yang@rock-chips.com>
Cc:     heiko@sntech.de, linux-rockchip@lists.infradead.org,
        Akash Gajjar <akash@openedev.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: rk3399-rock960: add vdd_log
Message-ID: <20191111052620.GA3858@Mani-XPS-13-9360>
References: <20191111005158.25070-1-kever.yang@rock-chips.com>
 <20191111005158.25070-2-kever.yang@rock-chips.com>
 <20191111052232.GA2842@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191111052232.GA2842@Mani-XPS-13-9360>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Nov 11, 2019 at 10:52:32AM +0530, Manivannan Sadhasivam wrote:
> Hi Kever,
> 
> On Mon, Nov 11, 2019 at 08:51:57AM +0800, Kever Yang wrote:
> > Add vdd_log node according to rock960 schematic V13.
> > 

Forgot to mention that rk3399-rock960.dtsi is common for both Rock960
Model A and Ficus boards. So the commit message should mention it clearly.
Otherwise people will get confused that the patch is only affecting Rock960
boards.

Thanks,
Mani

> > Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> > ---
> > 
> >  arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
> > index c7d48d41e184..73afee257115 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
> > @@ -76,6 +76,18 @@
> >  		regulator-always-on;
> >  		vin-supply = <&vcc5v0_sys>;
> >  	};
> > +
> > +	vdd_log: vdd-log {
> > +		compatible = "pwm-regulator";
> > +		pwms = <&pwm2 0 25000 1>;
> > +		regulator-name = "vdd_log";
> > +		regulator-always-on;
> > +		regulator-boot-on;
> > +		regulator-min-microvolt = <800000>;
> > +		regulator-max-microvolt = <1400000>;
> > +		regulator-init-microvolt = <950000>;
> 
> The default value seems to be 0.9v as per both Rock960 and Ficus schematics.
> 
> Other than that,
> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Thanks,
> Mani
> 
> > +		vin-supply = <&vcc_sys>;
> > +	};
> >  };
> >  
> >  &cpu_l0 {
> > -- 
> > 2.17.1
> > 
