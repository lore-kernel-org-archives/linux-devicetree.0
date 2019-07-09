From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V2 1/4] dt-bindings: opp: Support multiple opp-suspend
 properties
Date: Tue, 9 Jul 2019 13:44:36 +0530
Message-ID: <20190709081436.fguhzv2quldql2k4@vireshk-i7>
References: <20190709080015.43442-1-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190709080015.43442-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson.Huang@nxp.com
Cc: vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, leonard.crestez@nxp.com, p.zabel@pengutronix.de, ping.bai@nxp.com, daniel.baluta@nxp.com, l.stach@pengutronix.de, abel.vesa@nxp.com, angus@akkea.ca, andrew.smirnov@gmail.com, ccaione@baylibre.com, agx@sigxcpu.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On 09-07-19, 16:00, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> Update opp-suspend property's description to support multiple
> opp-suspend properties defined in DT, the OPP with highest opp-hz
> and with opp-suspend property present will be used as suspend opp.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> New patch.
> ---
>  Documentation/devicetree/bindings/opp/opp.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/opp/opp.txt b/Documentation/devicetree/bindings/opp/opp.txt
> index 76b6c79..6859227 100644
> --- a/Documentation/devicetree/bindings/opp/opp.txt
> +++ b/Documentation/devicetree/bindings/opp/opp.txt
> @@ -140,8 +140,8 @@ Optional properties:
>    frequency for a short duration of time limited by the device's power, current
>    and thermal limits.
>  
> -- opp-suspend: Marks the OPP to be used during device suspend. Only one OPP in
> -  the table should have this.
> +- opp-suspend: Marks the OPP to be used during device suspend. If multiple OPPs
> +  in the table have this, the OPP with highest opp-hz will be used.
>  
>  - opp-supported-hw: This enables us to select only a subset of OPPs from the
>    larger OPP table, based on what version of the hardware we are running on. We

LGTM. Once Rob Acks it, I will apply the first two patches to the OPP
tree.

-- 
viresh
