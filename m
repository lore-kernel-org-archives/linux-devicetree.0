From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 2/3] dts: arm64/sdm845: Add WCN3990 WLAN module device node
Date: Tue, 16 Oct 2018 14:45:01 -0700
Message-ID: <CAD=FV=WEJoGKXy_V0KRv-kR4EBFKns_6TDqBvKN5GBKNakPR3Q@mail.gmail.com>
References: <1539172376-19269-1-git-send-email-govinds@codeaurora.org> <1539172376-19269-3-git-send-email-govinds@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1539172376-19269-3-git-send-email-govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Oct 10, 2018 at 4:53 AM Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>
> Add device node for the ath10k SNOC platform driver probe
> and add resources required for WCN3990 on SDM845 soc.
>
> Signed-off-by: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts |  8 ++++++++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi    | 26 ++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> index eedfaf8..b89b8dd 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts

nit: it's usually considered nicer to split the patch into two: one
which adds the node to the SoC file and one which enables it in a
board file.


> +               wlan_msa_mem: reserved-memory@96700000 {

Everything else calls this "memory@", not "reserved-memory@".
Presumably someone (like Rob H?) thought that it should be "memory".
Please follow the pattern.


> +                       no-map;
> +                       reg = <0 0x96700000 0 0x100000>;

nit: though it doesn't really matter, it'd be nice to follow the
pattern and put "reg" above "no-map" like all the other nodes in this
section.


> +               };
>         };
>
>         cpus {
> @@ -1403,5 +1408,26 @@
>                                 status = "disabled";
>                         };
>                 };
> +
> +               wifi: wifi@18800000 {
> +                       compatible = "qcom,wcn3990-wifi";
> +                       status = "disabled";
> +                       reg = <0x18800000 0x800000>;
> +                       reg-names = "membase";
> +                       memory-region = <&wlan_msa_mem>;
> +                       interrupts =
> +                               <0 413 0 /* CE0 */ >,
> +                               <0 414 0 /* CE1 */ >,
> +                               <0 415 0 /* CE2 */ >,
> +                               <0 416 0 /* CE3 */ >,
> +                               <0 417 0 /* CE4 */ >,
> +                               <0 418 0 /* CE5 */ >,
> +                               <0 420 0 /* CE6 */ >,
> +                               <0 421 0 /* CE7 */ >,
> +                               <0 422 0 /* CE8 */ >,
> +                               <0 423 0 /* CE9 */ >,
> +                               <0 424 0 /* CE10 */ >,
> +                               <0 425 0 /* CE11 */ >;

Please change all the above to look like:

<GIC_SPI num IRQ_TYPE_LEVEL_HIGH>

...specifically:
* GIC_SPI is 0, but GIC_SPI is more documenting.
* having 0 for the final element means 'IRQ_TYPE_NONE'.  On newer
kernels commit 6ef6386ef7c1 ("irqchip/gic-v3: Loudly complain about
the use of IRQ_TYPE_NONE") will cause loud yells if you do this.
* I don't see what the comments about "/* CE# */ buy you.  Remove them.


-Doug
