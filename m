From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V4 2/3] OPP: Allow multiple OPP tables to be passed via DT
Date: Wed, 13 May 2015 10:11:29 +0530
Message-ID: <20150513044129.GC28858@linux>
References: <cover.1430394884.git.viresh.kumar@linaro.org>
 <d734a94af2263285fe8cef9f177212f15f218944.1430394884.git.viresh.kumar@linaro.org>
 <555225A0.8050707@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <555225A0.8050707@ti.com>
Sender: linux-pm-owner@vger.kernel.org
To: Nishanth Menon <nm@ti.com>
Cc: Rafael Wysocki <rjw@rjwysocki.net>, rob.herring@linaro.org, arnd.bergmann@linaro.org, broonie@kernel.org, mike.turquette@linaro.org, sboyd@codeaurora.org, linaro-kernel@lists.linaro.org, linux-pm@vger.kernel.org, grant.likely@linaro.org, olof@lixom.net, Sudeep.Holla@arm.com, devicetree@vger.kernel.org, viswanath.puttagunta@linaro.org, l.stach@pengutronix.de, thomas.petazzoni@free-electrons.com, linux-arm-kernel@lists.infradead.org, ta.omasab@gmail.com, kesavan.abhilash@gmail.com, khilman@linaro.org, santosh.shilimkar@oracle.com
List-Id: devicetree@vger.kernel.org

On 12-05-15, 11:09, Nishanth Menon wrote:
> On 04/30/2015 07:08 AM, Viresh Kumar wrote:
> > (sort of an eeprom) and knowing characteristics of the SoC.
> 
> they are more like prom than eeprom in many instances.

Will replace.

> With some SoCs like AM335x - thanks to some brain dead incompatible
> hardware design choices, this might end up as a big list or various
> OPP tables. but overall, I must prefer this approach as well.
> 
> Thanks for proposing this. will be great to see examples documented in
> bindings doc as well.

Right.

-- 
viresh
