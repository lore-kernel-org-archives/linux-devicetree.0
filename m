Return-Path: <SRS0=0B+L=JF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58083 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756178AbeFSJWX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 Jun 2018 05:22:23 -0400
Message-ID: <1529400139.7211.12.camel@pengutronix.de>
Subject: Re: [PATCH v3 1/2] cpufreq: imx6q/thermal: imx: register cooling
 device depending on OF
From: Lucas Stach <l.stach@pengutronix.de>
Date: Tue, 19 Jun 2018 11:22:19 +0200
In-Reply-To: <20180619090556.p2xjpbealrfej533@vireshk-i7>
References: <20180608090640.29076-1-bst@pengutronix.de>
         <20180619090556.p2xjpbealrfej533@vireshk-i7>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>, Bastian Stender <bst@pengutronix.de>
Cc: devicetree@vger.kernel.org, Anson Huang <anson.huang@nxp.com>, linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-imx@nxp.com, kernel@pengutronix.de, Zhang Rui <rui.zhang@intel.com>, Leonard Crestez <leonard.crestez@nxp.com>, Shawn Guo <shawnguo@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Viresh,

Am Dienstag, den 19.06.2018, 14:35 +0530 schrieb Viresh Kumar:
> On 08-06-18, 11:06, Bastian Stender wrote:
> > The cooling device should be part of the i.MX cpufreq driver, but it
> > cannot be removed for the sake of DT stability.
> 
> I am not sure what you meant by DT stability here. Can you please explain that ?

The goal that we strive for in i.MX land is that a any newer kernel
boots on a older DT without functional regressions compared to a
matching DT/kernel pair when possible.

> What about calling both OF and non-OF calls from the cpufreq driver, based on
> the fact that data is present in DT or not ?

That's right, we could move the cooling device registration completely
to the cpufreq driver. As that would consolidate the code some more, I
agree that this is the right way to go.

Regards,
Lucas
