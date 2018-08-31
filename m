From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 0/3] firmware: qcom: scm: Improve clock handling
Date: Thu, 30 Aug 2018 18:17:41 -0700
Message-ID: <20180831011741.GO2523@minitux>
References: <20180829231505.22660-1-bjorn.andersson@linaro.org>
 <153567767852.93865.5427679731919930718@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <153567767852.93865.5427679731919930718@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Sricharan R <sricharan@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Craig Tatlor <ctatlor97@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu 30 Aug 18:07 PDT 2018, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2018-08-29 16:15:02)
> > We're currently facing the issue that every new platform requires the addition
> > of a compatible to the DT binding as well as the driver.
> > 
> > The DT binding patch to allow us to use qcom,scm for all these new platforms
> > that doesn't require any clocks and the driver is reworked to make the qcom,scm
> > still pick up specified clocks in this case but won't require them.
> > 
> > This makes it possible to add new platforms by simply add the new compatible to
> > the list in the DT binding, but no changes needs to be done in the driver.
> > Which is what is done in patch 3.
> > 
> 
> I still think it may be even simpler to move to the "get all the clks"
> API and then stop caring completely. Any reason to not do that?
> 

I love working with drivers that tells me things like "hey you forgot to
add the 'core' clock", rather than having to spend hours bisecting which
register access it is that's causing that reboot and then try to drill
that down to a particular clock.

Apart from that, the "get-all-the-clocks" would work fine as well. Does
this API exist yet?

Regards,
Bjorn
