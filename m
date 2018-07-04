Return-Path: <SRS0=klVN=JU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from cloudserver094114.home.pl ([79.96.170.134]:59424 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932673AbeGDKww (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Jul 2018 06:52:52 -0400
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH v3 1/2] cpufreq: imx6q/thermal: imx: register cooling device depending on OF
Date: Wed, 04 Jul 2018 12:51:27 +0200
Message-ID: <1832522.sVWMd1pqUx@aspire.rjw.lan>
In-Reply-To: <20180619093157.ike3xmmregese6bh@vireshk-i7>
References: <20180608090640.29076-1-bst@pengutronix.de> <1529400139.7211.12.camel@pengutronix.de> <20180619093157.ike3xmmregese6bh@vireshk-i7>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>, Bastian Stender <bst@pengutronix.de>
Cc: Lucas Stach <l.stach@pengutronix.de>, devicetree@vger.kernel.org, Anson Huang <anson.huang@nxp.com>, linux-pm@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, Zhang Rui <rui.zhang@intel.com>, Leonard Crestez <leonard.crestez@nxp.com>, Shawn Guo <shawnguo@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tuesday, June 19, 2018 11:31:57 AM CEST Viresh Kumar wrote:
> On 19-06-18, 11:22, Lucas Stach wrote:
> > Hi Viresh,
> > 
> > Am Dienstag, den 19.06.2018, 14:35 +0530 schrieb Viresh Kumar:
> > > On 08-06-18, 11:06, Bastian Stender wrote:
> > > > The cooling device should be part of the i.MX cpufreq driver, but it
> > > > cannot be removed for the sake of DT stability.
> > > 
> > > I am not sure what you meant by DT stability here. Can you please explain that ?
> > 
> > The goal that we strive for in i.MX land is that a any newer kernel
> > boots on a older DT without functional regressions compared to a
> > matching DT/kernel pair when possible.
> 
> Right, that's being backwards compatible and we must do that.
> 
> > > What about calling both OF and non-OF calls from the cpufreq driver, based on
> > > the fact that data is present in DT or not ?
> > 
> > That's right, we could move the cooling device registration completely
> > to the cpufreq driver. As that would consolidate the code some more, I
> > agree that this is the right way to go.
> 
> We are good to go then :)

So I've applied the patch.

Thanks!

