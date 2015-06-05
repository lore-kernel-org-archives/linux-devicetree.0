From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V7 1/3] OPP: Add new bindings to address shortcomings of
 existing bindings
Date: Fri, 5 Jun 2015 08:11:24 +0530
Message-ID: <20150605024124.GA9448@linux>
References: <cover.1433434659.git.viresh.kumar@linaro.org>
 <d83c0b6b1768c7229384216329b607d13886aa02.1433434659.git.viresh.kumar@linaro.org>
 <20150604183752.GI490@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150604183752.GI490@codeaurora.org>
Sender: linux-pm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Rafael Wysocki <rjw@rjwysocki.net>, rob.herring@linaro.org, linaro-kernel@lists.linaro.org, linux-pm@vger.kernel.org, arnd.bergmann@linaro.org, nm@ti.com, broonie@kernel.org, mike.turquette@linaro.org, grant.likely@linaro.org, olof@lixom.net, Sudeep.Holla@arm.com, devicetree@vger.kernel.org, viswanath.puttagunta@linaro.org, l.stach@pengutronix.de, thomas.petazzoni@free-electrons.com, linux-arm-kernel@lists.infradead.org, ta.omasab@gmail.com, kesavan.abhilash@gmail.com, khilman@linaro.org, santosh.shilimkar@oracle.com
List-Id: devicetree@vger.kernel.org

On 04-06-15, 11:37, Stephen Boyd wrote:
> Ok. I'm still interested to see if this binding will have to
> change to support how multiple regulators will be matched up with
> the device using the OPP.

I can understand your concern here, but getting everything working
on the first attempt would be difficult to write/review.. There will at
least be 5-7 patches just for getting the very basic v2 bindings
coded. And so we can get all that coded slowly and steadily.

> But for now,
> 
> Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>

Thanks. Finally :)

-- 
viresh
