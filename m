From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V2 2/4] opp: of: Support multiple suspend OPPs defined in
 DT
Date: Thu, 25 Jul 2019 07:56:23 +0530
Message-ID: <20190725022623.jzrlsxkppa35kljz@vireshk-i7>
References: <20190709080015.43442-1-Anson.Huang@nxp.com>
 <20190709080015.43442-2-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190709080015.43442-2-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson.Huang@nxp.com
Cc: vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, leonard.crestez@nxp.com, p.zabel@pengutronix.de, ping.bai@nxp.com, daniel.baluta@nxp.com, l.stach@pengutronix.de, abel.vesa@nxp.com, angus@akkea.ca, andrew.smirnov@gmail.com, ccaione@baylibre.com, agx@sigxcpu.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On 09-07-19, 16:00, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> With property "opp-supported-hw" introduced, the OPP table
> in DT could be a large OPP table and ONLY a subset of OPPs
> are available, based on the version of the hardware running
> on. That introduces restriction of using "opp-suspend"
> property to define the suspend OPP, as we are NOT sure if the
> OPP containing "opp-suspend" property is available for the
> hardware running on, and the of opp core does NOT allow multiple
> suspend OPPs defined in DT OPP table.
> 
> To eliminate this restrition, make of opp core allow multiple
> suspend OPPs defined in DT, and pick the OPP with highest rate
> and with "opp-suspend" property present to be suspend OPP, it
> can speed up the suspend/resume process.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> No changes.
> ---
>  drivers/opp/of.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Applied. Thanks.

-- 
viresh
