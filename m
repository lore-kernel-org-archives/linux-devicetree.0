Return-Path: <SRS0=0B+L=JF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pl0-f67.google.com ([209.85.160.67]:32939 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756374AbeFSJGp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 Jun 2018 05:06:45 -0400
Received: by mail-pl0-f67.google.com with SMTP id 6-v6so10065641plb.0
        for <devicetree@vger.kernel.org>; Tue, 19 Jun 2018 02:06:44 -0700 (PDT)
Date: Tue, 19 Jun 2018 14:36:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v3 2/2] ARM: dts: imx: add cooling-cells for cpufreq
 cooling device
Message-ID: <20180619090642.oi6xzr5ymqvqi4dh@vireshk-i7>
References: <20180608090640.29076-1-bst@pengutronix.de>
 <20180608090640.29076-2-bst@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180608090640.29076-2-bst@pengutronix.de>
Sender: devicetree-owner@vger.kernel.org
To: Bastian Stender <bst@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Zhang Rui <rui.zhang@intel.com>, Leonard Crestez <leonard.crestez@nxp.com>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-imx@nxp.com, Anson Huang <anson.huang@nxp.com>, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

On 08-06-18, 11:06, Bastian Stender wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> Add #cooling-cells for i.MX6/7 SoCs for cpufreq cooling device usage.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Signed-off-by: Bastian Stender <bst@pengutronix.de>
> ---
> Changes since (implicit) v1:
> 
> - add Signed-off-by
> ---
>  arch/arm/boot/dts/imx6dl.dtsi | 1 +
>  arch/arm/boot/dts/imx6q.dtsi  | 1 +
>  arch/arm/boot/dts/imx6sl.dtsi | 1 +
>  arch/arm/boot/dts/imx6sx.dtsi | 1 +
>  arch/arm/boot/dts/imx6ul.dtsi | 1 +
>  arch/arm/boot/dts/imx7d.dtsi  | 1 +

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
