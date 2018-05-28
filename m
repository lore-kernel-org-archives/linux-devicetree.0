From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH 01/15] arm: dts: armada: Fix "#cooling-cells" property's
 name
Date: Mon, 28 May 2018 16:53:04 +0200
Message-ID: <8736ybygq7.fsf@bootlin.com>
References: <cover.1527244200.git.viresh.kumar@linaro.org>
 <cover.1527244200.git.viresh.kumar@linaro.org>
 <26a0666368694db610414a85a08843435ea070a7.1527244201.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <26a0666368694db610414a85a08843435ea070a7.1527244201.git.viresh.kumar@linaro.org>
 (Viresh Kumar's message of "Fri, 25 May 2018 16:01:47 +0530")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Vincent Guittot <vincent.guittot@linaro.org>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, arm@kernel.org, chris.redpath@arm.com, ionela.voinescu@arm.com, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Viresh,
 
 On ven., mai 25 2018, Viresh Kumar <viresh.kumar@linaro.org> wrote:

> It should be "#cooling-cells" instead of "cooling-cells". Fix it.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>


Applied on mvebu/fixes

Thanks,

Gregory

> ---
>  arch/arm/boot/dts/armada-385-synology-ds116.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/armada-385-synology-ds116.dts b/arch/arm/boot/dts/armada-385-synology-ds116.dts
> index 6782ce481ac9..d8769956cbfc 100644
> --- a/arch/arm/boot/dts/armada-385-synology-ds116.dts
> +++ b/arch/arm/boot/dts/armada-385-synology-ds116.dts
> @@ -139,7 +139,7 @@
>  					      3700 5
>  					      3900 6
>  					      4000 7>;
> -			cooling-cells = <2>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		gpio-leds {
> -- 
> 2.15.0.194.g9af6a3dea062
>

-- 
Gregory Clement, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
