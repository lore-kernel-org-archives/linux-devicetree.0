From: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v2 07/12] devicetree: Add bindings for the ATH79 PLL controllers
Date: Sun, 19 Apr 2015 16:30:13 +0200
Message-ID: <CAOiHx=nFHarP-Ohjzzvi-V-SYBdrskL+Ur7yqprH8+ZLqGZLXw@mail.gmail.com>
References: <1429448288-20742-1-git-send-email-albeu@free.fr> <1429448288-20742-8-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429448288-20742-8-git-send-email-albeu-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
Cc: MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Sun, Apr 19, 2015 at 2:58 PM, Alban Bedel <albeu-GANU6spQydw@public.gmane.org> wrote:
> Signed-off-by: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
> ---
> v2: * Fixed the node names to respect ePAPR
>     * Fixed the missing 's' in 'fallbacks' and the 'clocks' property
> ---
>  .../devicetree/bindings/clock/qca,ath79-pll.txt    | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qca,ath79-pll.txt
>
> diff --git a/Documentation/devicetree/bindings/clock/qca,ath79-pll.txt b/Documentation/devicetree/bindings/clock/qca,ath79-pll.txt
> new file mode 100644
> index 0000000..df3dbc8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qca,ath79-pll.txt
> @@ -0,0 +1,33 @@
> +Binding for Qualcomm Atheros AR7xxx/AR9XXX PLL controller
> +
> +The PPL controller provides the 3 main clocks of the SoC: CPU, DDR and AHB.
> +
> +Required Properties:
> +- compatible: has to be "qca,<soctype>-cpu-intc" and one of the following
> +  fallbacks:
> +  - "qca,ar7100-pll"
> +  - "qca,ar7240-pll"
> +  - "qca,ar9130-pll"
> +  - "qca,ar9330-pll"
> +  - "qca,ar9340-pll"
> +  - "qca,ar9550-pll"

Shouldn't this be "qca,qca9550-pll"?


Jonas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
