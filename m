From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [V2 1/2] clk: imx6q: remove unsupported pll4_audio_div
Date: Mon, 11 Mar 2019 11:35:36 -0700
Message-ID: <155232933665.20095.16726298881697876719@swboyd.mtv.corp.google.com>
References: <1552304271.2453.12.camel@pengutronix.de>
 <1552319997-24622-1-git-send-email-eric@nelint.com>
 <1552319997-24622-2-git-send-email-eric@nelint.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1552319997-24622-2-git-send-email-eric@nelint.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mark.rutland@arm.com, anson.huang@nxp.com, colin.didier@devialet.com, shawnguo@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org, tiny.windzz@gmail.com, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, Eric Nelson <eric@nelint.com>, festevam@gmail.com, s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org, l.stach@pengutronix.de
List-Id: devicetree@vger.kernel.org

Quoting Eric Nelson (2019-03-11 08:59:56)
> diff --git a/include/dt-bindings/clock/imx6qdl-clock.h b/include/dt-bindings/clock/imx6qdl-clock.h
> index b3cef29..34bb14d 100644
> --- a/include/dt-bindings/clock/imx6qdl-clock.h
> +++ b/include/dt-bindings/clock/imx6qdl-clock.h
> @@ -213,7 +213,15 @@
>  #define IMX6QDL_CLK_CKO2                       200
>  #define IMX6QDL_CLK_CKO                                201
>  #define IMX6QDL_CLK_VDOA                       202
> -#define IMX6QDL_CLK_PLL4_AUDIO_DIV             203
> +
> +/* The PLL4_AUDIO_DIV divider only appeared in
> + * early versions of the reference manual.
> + *
> + * Renamed to _BROKEN to prevent inadvertent use,
> + * but reserved the array slot to maintain DT binary
> + * compatibility.
> + */
> +#define IMX6QDL_CLK_PLL4_AUDIO_DIV_BROKEN      203

But it breaks the build. I don't get it. Just add a comment indicating
it shouldn't be used? That breaks the cross-tree dependency chain and
lets clk tree merge the clk driver part and arm-soc merge the dts part.
