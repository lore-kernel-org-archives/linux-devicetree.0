From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: mvebu: fix gpio misspelling in some dts files
Date: Tue, 19 May 2015 22:52:23 +0200
Message-ID: <555BA287.7040904@gmail.com>
References: <1432067238-4682-1-git-send-email-pbrobinson@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432067238-4682-1-git-send-email-pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Robinson <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 19.05.2015 22:27, Peter Robinson wrote:
> A few of the Marvell armadda/dove/kirkwood dts(i) files appear to
> have some gpio options misspelled as gpo.
>
> Signed-off-by: Peter Robinson <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   arch/arm/boot/dts/armada-370-mirabox.dts         | 2 +-
>   arch/arm/boot/dts/armada-370-netgear-rn104.dts   | 2 +-
>   arch/arm/boot/dts/armada-370-synology-ds213j.dts | 2 +-
>   arch/arm/boot/dts/dove.dtsi                      | 4 ++--

Peter,

Sorry, but NACK for dove. This is not a misspelling but the nand
pins only support GP-output hence the "gpo" function name.

Is there any verified mismatch between HW datasheet and pinctrl/DT
or did you just assume "gpo" is a misspelling?

Sebastian

[...]
> diff --git a/arch/arm/boot/dts/dove.dtsi b/arch/arm/boot/dts/dove.dtsi
> index 9ad8295..684daa1 100644
> --- a/arch/arm/boot/dts/dove.dtsi
> +++ b/arch/arm/boot/dts/dove.dtsi
> @@ -603,9 +603,9 @@
>   					marvell,function = "nand";
>   				};
>
> -				pmx_nand_gpo: pmx-nand-gpo {
> +				pmx_nand_gpio: pmx-nand-gpio {
>   					marvell,pins = "mpp_nand";
> -					marvell,function = "gpo";
> +					marvell,function = "gpio";
>   				};
>
>   				pmx_i2c1: pmx-i2c1 {


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
