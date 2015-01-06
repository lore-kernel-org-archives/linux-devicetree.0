From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v3 3/3] ARM: dts: Specify VMMC and VQMMC on rk3288-evb
Date: Tue, 06 Jan 2015 18:44:13 +0100
Message-ID: <1798568.RumoICfKOO@phil>
References: <1418689340-29517-1-git-send-email-dianders@chromium.org>
 <1418689340-29517-3-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1418689340-29517-3-git-send-email-dianders@chromium.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Doug Anderson <dianders@chromium.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux@arm.linux.org.uk, Alexandru Stan <amstan@chromium.org>, pawel.moll@arm.com, linux-rockchip@lists.infradead.org, Seungwon Jeon <tgih.jun@samsung.com>, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, robh+dt@kernel.org, Jaehoon Chung <jh80.chung@samsung.com>, Andrew Bresticker <abrestic@chromium.org>, Mark Brown <broonie@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, galak@codeaurora.org, Sonny Rao <sonnyrao@chromium.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Doug,

Am Montag, 15. Dezember 2014, 16:22:20 schrieb Doug Anderson:
> Specifying these rails should eventually let us do UHS.
> 
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> ---
> Changes in v3: None
> Changes in v2:
> - Fix subject line
> 
>  arch/arm/boot/dts/rk3288-evb.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rk3288-evb.dtsi
> b/arch/arm/boot/dts/rk3288-evb.dtsi index 3e067dd..d660fe6 100644
> --- a/arch/arm/boot/dts/rk3288-evb.dtsi
> +++ b/arch/arm/boot/dts/rk3288-evb.dtsi
> @@ -114,6 +114,8 @@
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_cd &sdmmc_bus4>;
>  	status = "okay";
> +	vmmc-supply = <&vcc_io>;

according to the schematics there is a switch between the card and vcc_io with 
a controlling pin called SDMMC_PWR providing a supply called vcc_sd.

So there should probably be a fixed-regulator get introduced for this, like the 
older rockchip boards do.


Heiko
