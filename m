From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: update DT bindings with ebi2 groups
Date: Tue, 12 Jul 2016 16:04:41 -0700
Message-ID: <20160712230441.GJ23833@tuxbot>
References: <1467999672-14259-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1467999672-14259-1-git-send-email-linus.walleij@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, David Brown <david.brown@linaro.org>, Andy Gross <andy.gross@linaro.org>, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri 08 Jul 10:41 PDT 2016, Linus Walleij wrote:

> This adds the ebi2 and ebi2cs groups to the MSM8660 pin control
> documentation document.
> =

> Cc: devicetree@vger.kernel.org
> Cc: Andy Gross <andy.gross@linaro.org>
> Cc: Bj=F6rn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,msm8660-pinctrl.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8660-pinct=
rl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8660-pinctrl.txt
> index 77aa11790163..df9a838ec5f9 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8660-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8660-pinctrl.txt
> @@ -52,7 +52,7 @@ Valid values for function are:
>    gsbi2_spi_cs3_n, gsbi3, gsbi3_spi_cs1_n, gsbi3_spi_cs2_n, gsbi3_spi_cs=
3_n,
>    gsbi4, gsbi5, gsbi6, gsbi7, gsbi8, gsbi9, gsbi10, gsbi11, gsbi12, hdmi=
, i2s,
>    lcdc, mdp_vsync, mi2s, pcm, ps_hold, sdc1, sdc2, sdc5, tsif1, tsif2, u=
sb_fs1,
> -  usb_fs1_oe_n, usb_fs2, usb_fs2_oe_n, vfe, vsens_alarm,
> +  usb_fs1_oe_n, usb_fs2, usb_fs2_oe_n, vfe, vsens_alarm, ebi2, ebi2cs
>  =

>  Example:
>  =

> -- =

> 2.7.4
> =

> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
