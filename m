Return-Path: <SRS0=byNV=46=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05560C10DCE
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 23:47:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B7FFA20637
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 23:47:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HNvgMOR2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgCMXrD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Mar 2020 19:47:03 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43861 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbgCMXrD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Mar 2020 19:47:03 -0400
Received: by mail-pg1-f196.google.com with SMTP id u12so5911731pgb.10
        for <devicetree@vger.kernel.org>; Fri, 13 Mar 2020 16:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QqSV3LpUI3XKUkmQyfNi1UamAdu5bkgGpHDrMQfv4MU=;
        b=HNvgMOR2I4lu6ZzQhLaqLLWdM+2GtFd3IZ4AuPpce/zw9p/2oX7gHoLKNpj8pDJ3Pj
         Jij9sP4ezR342y5fuAI/xYD8IyVYpsAdH5FWh6dW9U0DC3yQUz/e9eRPDExe1KhgW0Vy
         rO81pgsWwtIIwk0BTd+z1VJ8I3vFOlSR9xbrp8wt4bH003euw1llVcV39hsIheW0NLZH
         3rH6dYrHUjz0+PDZvr/zh1CgPjpt1cZDRUdc3a/09XwqbDnHLO2Cgy/KP6Q7AQwDMqYy
         lLUX9NU/nAHYdBHqteUHrygCelftfNMsp+AxKPno4amYs3qpLBSFr+4snMF5NW7uHOCj
         kNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QqSV3LpUI3XKUkmQyfNi1UamAdu5bkgGpHDrMQfv4MU=;
        b=L/m+nTNWBiXTQlUBKCZFGWNl/ARKuXHfkFbUK7ClM6Ge8KTua9YBnq3pIaKzDQFjvV
         pueAGqZ7MdNj+EgX/wO79JnPERduTvO7bXMsnFSJESW87cuQV+f4tmFhCT48HYgZhixr
         Za0c0z+OZ8ikHukr/D2Dkfu/QrIp/UQfYarYx4h7Cxpp7ShqlNC1cvxptZk7zyt2K/0n
         8dnPGA1UqM8z/KMrSqqR+pQLWN/KtcWwgccNkTp/082VP9lVBv5F6T2SljQgrz7Xnwo5
         lnZ3iiALJ95VpHkpx0IdbaJXlIGPHr9AgnGkqGZ+XzjyR9h19BS3JssPBUKUENtt+SPC
         RBTg==
X-Gm-Message-State: ANhLgQ2hrUWldfG6IwCHg82d3qlZglGJUXbvvSOFP13zgYzgTKMZDwuz
        IeilE5rZDxov5K1VIuQO38TJDQ==
X-Google-Smtp-Source: ADFU+vsW6m1GL4wfPHL5s4jhGiDzBkhnb+8gcvRgTtKjWKHSrkQbWzNiNxyD247XMBP14NBXaEZ10A==
X-Received: by 2002:a63:1d7:: with SMTP id 206mr13645799pgb.99.1584143221655;
        Fri, 13 Mar 2020 16:47:01 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o11sm10927883pjb.18.2020.03.13.16.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 16:47:00 -0700 (PDT)
Date:   Fri, 13 Mar 2020 16:46:57 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     ansuelsmth@gmail.com
Cc:     'Stephen Boyd' <sboyd@kernel.org>, agross@kernel.org,
        'Mathieu Olivari' <mathieu@codeaurora.org>,
        'Rob Herring' <robh+dt@kernel.org>,
        'Mark Rutland' <mark.rutland@arm.com>,
        'Michael Turquette' <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: R: [PATCH] ARM: qcom: Disable i2c device on gsbi4 for ipq806x
Message-ID: <20200313234657.GD1214176@minitux>
References: <20200313195816.12435-1-ansuelsmth@gmail.com>
 <158413179776.164562.8295974225127853050@swboyd.mtv.corp.google.com>
 <014101d5f987$82790c90$876b25b0$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <014101d5f987$82790c90$876b25b0$@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri 13 Mar 15:34 PDT 2020, ansuelsmth@gmail.com wrote:

> > Quoting Ansuel Smith (2020-03-13 12:58:16)
> > > diff --git a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
> > b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
> > > index 554c65e7aa0e..580aec63030d 100644
> > > --- a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
> > > +++ b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
> > > @@ -21,14 +21,5 @@ mux {
> > >                                 };
> > >                         };
> > >                 };
> > > -
> > > -               gsbi@16300000 {
> > > -                       i2c@16380000 {
> > > -                               status = "ok";
> > > -                               clock-frequency = <200000>;
> > > -                               pinctrl-0 = <&i2c4_pins>;
> > > -                               pinctrl-names = "default";
> > > -                       };
> > > -               };
> > >         };
> > >  };
> > > diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-
> > ipq806x.c
> > > index b0eee0903807..75706807e6cf 100644
> > > --- a/drivers/clk/qcom/gcc-ipq806x.c
> > > +++ b/drivers/clk/qcom/gcc-ipq806x.c
> > > @@ -782,7 +782,7 @@ static struct clk_rcg gsbi4_qup_src = {
> > >                         .parent_names = gcc_pxo_pll8,
> > >                         .num_parents = 2,
> > >                         .ops = &clk_rcg_ops,
> > > -                       .flags = CLK_SET_PARENT_GATE,
> > > +                       .flags = CLK_SET_PARENT_GATE | CLK_IGNORE_UNUSED,
> > 
> > A better solution is to use the protected-clocks property so we don't
> > try to touch these clks at all on this device. So this whole patch can
> > be routed through arm-soc and remove the i2c node and add some dt
> > property to the gcc node.
> > 
> 
> Should I add a comment where the i2c is removed or I can remove it
> directly?
> 

It's fine that you just remove it, like you proposed above.

The commit message should describe the reason and per your description I
don't expect that anyone will miss the node...

Regards,
Bjorn

> > >                 },
> > >         },
> > >  };
> 
