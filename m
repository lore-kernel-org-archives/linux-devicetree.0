Return-Path: <SRS0=0B+L=JF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:36382 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756548AbeFSJF7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 Jun 2018 05:05:59 -0400
Received: by mail-pf0-f194.google.com with SMTP id a12-v6so9618873pfi.3
        for <devicetree@vger.kernel.org>; Tue, 19 Jun 2018 02:05:59 -0700 (PDT)
Date: Tue, 19 Jun 2018 14:35:56 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v3 1/2] cpufreq: imx6q/thermal: imx: register cooling
 device depending on OF
Message-ID: <20180619090556.p2xjpbealrfej533@vireshk-i7>
References: <20180608090640.29076-1-bst@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180608090640.29076-1-bst@pengutronix.de>
Sender: devicetree-owner@vger.kernel.org
To: Bastian Stender <bst@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Zhang Rui <rui.zhang@intel.com>, Leonard Crestez <leonard.crestez@nxp.com>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-imx@nxp.com, Anson Huang <anson.huang@nxp.com>, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

On 08-06-18, 11:06, Bastian Stender wrote:
> The cooling device should be part of the i.MX cpufreq driver, but it
> cannot be removed for the sake of DT stability.

I am not sure what you meant by DT stability here. Can you please explain that ?
What about calling both OF and non-OF calls from the cpufreq driver, based on
the fact that data is present in DT or not ?

-- 
viresh
