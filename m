Return-Path: <SRS0=0B+L=JF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:43654 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756814AbeFSJcA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 Jun 2018 05:32:00 -0400
Received: by mail-pl0-f65.google.com with SMTP id c41-v6so10632885plj.10
        for <devicetree@vger.kernel.org>; Tue, 19 Jun 2018 02:32:00 -0700 (PDT)
Date: Tue, 19 Jun 2018 15:01:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v3 1/2] cpufreq: imx6q/thermal: imx: register cooling
 device depending on OF
Message-ID: <20180619093157.ike3xmmregese6bh@vireshk-i7>
References: <20180608090640.29076-1-bst@pengutronix.de>
 <20180619090556.p2xjpbealrfej533@vireshk-i7>
 <1529400139.7211.12.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1529400139.7211.12.camel@pengutronix.de>
Sender: devicetree-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Bastian Stender <bst@pengutronix.de>, devicetree@vger.kernel.org, Anson Huang <anson.huang@nxp.com>, linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-imx@nxp.com, kernel@pengutronix.de, Zhang Rui <rui.zhang@intel.com>, Leonard Crestez <leonard.crestez@nxp.com>, Shawn Guo <shawnguo@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 19-06-18, 11:22, Lucas Stach wrote:
> Hi Viresh,
> 
> Am Dienstag, den 19.06.2018, 14:35 +0530 schrieb Viresh Kumar:
> > On 08-06-18, 11:06, Bastian Stender wrote:
> > > The cooling device should be part of the i.MX cpufreq driver, but it
> > > cannot be removed for the sake of DT stability.
> > 
> > I am not sure what you meant by DT stability here. Can you please explain that ?
> 
> The goal that we strive for in i.MX land is that a any newer kernel
> boots on a older DT without functional regressions compared to a
> matching DT/kernel pair when possible.

Right, that's being backwards compatible and we must do that.

> > What about calling both OF and non-OF calls from the cpufreq driver, based on
> > the fact that data is present in DT or not ?
> 
> That's right, we could move the cooling device registration completely
> to the cpufreq driver. As that would consolidate the code some more, I
> agree that this is the right way to go.

We are good to go then :)

-- 
viresh
