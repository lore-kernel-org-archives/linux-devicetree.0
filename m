From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [RFC v5 10/15] MIPS: ath79: add initial support for Dragino MS14 (Dragino 2)
Date: Tue, 9 Feb 2016 12:16:38 +0100
Message-ID: <201602091216.38470.marex@denx.de>
References: <1455005641-7079-1-git-send-email-antonynpavlov@gmail.com> <1455005641-7079-11-git-send-email-antonynpavlov@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455005641-7079-11-git-send-email-antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Wills Wang <wills.wang-EMRzualFZlQ@public.gmane.org>, Daniel Schwierzeck <daniel.schwierzeck-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday, February 09, 2016 at 09:13:56 AM, Antony Pavlov wrote:
> The following features are supported:
> 
>   * UART;
>   * SPI-flash;
>   * USB host;
>   * GPIO keys and LEDs.
> 
> Links:
> 
>     * http://www.dragino.com/products/mother-board/item/71-ms14-p.html
>     * https://wiki.openwrt.org/toh/dragino/ms14
> 
> Signed-off-by: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
> Cc: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
> Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  arch/mips/boot/dts/qca/Makefile         |   1 +
>  arch/mips/boot/dts/qca/dragino_ms14.dts | 101
> ++++++++++++++++++++++++++++++++ 2 files changed, 102 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/qca/Makefile
> b/arch/mips/boot/dts/qca/Makefile index 504c4b1..e949cff 100644
> --- a/arch/mips/boot/dts/qca/Makefile
> +++ b/arch/mips/boot/dts/qca/Makefile
> @@ -1,5 +1,6 @@
>  # All DTBs
>  dtb-$(CONFIG_ATH79)			+= ar9132_tl_wr1043nd_v1.dtb
> +dtb-$(CONFIG_ATH79)			+= dragino_ms14.dtb

ar9331_dragino_ms14.dtb ?

>  dtb-$(CONFIG_ATH79)			+= tl_mr3020.dtb
> 

You should re-order the board additions at the end of the patchset, so you
can then squash the USB DT patch for the mr3020 board into it.

Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
