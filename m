From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [RFC v5 05/15] MIPS: dts: qca: introduce AR9331 devicetree
Date: Tue, 9 Feb 2016 12:12:12 +0100
Message-ID: <201602091212.12258.marex@denx.de>
References: <1455005641-7079-1-git-send-email-antonynpavlov@gmail.com> <1455005641-7079-6-git-send-email-antonynpavlov@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455005641-7079-6-git-send-email-antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Wills Wang <wills.wang-EMRzualFZlQ@public.gmane.org>, Daniel Schwierzeck <daniel.schwierzeck-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday, February 09, 2016 at 09:13:51 AM, Antony Pavlov wrote:
> This patch introduces devicetree for Atheros AR9331 SoC (AKA Hornet).
> The AR9331 chip is a Wi-Fi System-On-Chip (WiSOC),
> typically used in very cheap Access Points and Routers.
> 
> Signed-off-by: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
> Cc: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
> Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---

[...]

> +			usb: usb@1b000100 {
> +				compatible = "qca,ar7100-ehci", "generic-ehci";
> +				reg = <0x1b000100 0x100>;

It's actually chipidea HDRC , you should bind that driver with it instead.
See for example this:
http://patchwork.linux-mips.org/patch/4968/

> +				interrupt-parent = <&cpuintc>;
> +				interrupts = <3>;
> +				resets = <&rst 5>;
> +
> +				has-transaction-translator;
> +
> +				phy-names = "usb";
> +				phys = <&usb_phy>;
> +
> +				status = "disabled";
> +			};

[...]

Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
