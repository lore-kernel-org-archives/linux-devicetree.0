From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [RFC v5 06/15] MIPS: ath79: add initial support for TP-LINK MR3020
Date: Tue, 9 Feb 2016 12:13:33 +0100
Message-ID: <201602091213.33787.marex@denx.de>
References: <1455005641-7079-1-git-send-email-antonynpavlov@gmail.com> <1455005641-7079-7-git-send-email-antonynpavlov@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455005641-7079-7-git-send-email-antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Wills Wang <wills.wang-EMRzualFZlQ@public.gmane.org>, Daniel Schwierzeck <daniel.schwierzeck-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday, February 09, 2016 at 09:13:52 AM, Antony Pavlov wrote:
> The following features are supported:
> 
>   * UART;
>   * SPI-flash;
>   * GPIO keys and LEDs.
> 
> Links:
> 
>   * http://www.tp-link.com/en/products/details/?model=TL-MR3020
>   * http://wiki.openwrt.org/toh/tp-link/tl-mr3020
>   * https://wikidevi.com/wiki/TP-LINK_TL-MR3020
> 
> Signed-off-by: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
> Cc: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
> Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  arch/mips/boot/dts/qca/Makefile      |  1 +
>  arch/mips/boot/dts/qca/tl_mr3020.dts | 99
> ++++++++++++++++++++++++++++++++++++ 2 files changed, 100 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/qca/Makefile
> b/arch/mips/boot/dts/qca/Makefile index 14bd225..504c4b1 100644
> --- a/arch/mips/boot/dts/qca/Makefile
> +++ b/arch/mips/boot/dts/qca/Makefile
> @@ -1,5 +1,6 @@
>  # All DTBs
>  dtb-$(CONFIG_ATH79)			+= ar9132_tl_wr1043nd_v1.dtb
> +dtb-$(CONFIG_ATH79)			+= tl_mr3020.dtb

You might want to stay consistent and call it ar9331_tl_mr3020.dtb .

[...]

Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
