From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v3 3/3] powerpc/mpc85xx: add support for Keymile's
 kmcoge4 board
Date: Tue, 8 Apr 2014 19:47:32 -0500
Message-ID: <1397004452.32034.330.camel@snotra.buserror.net>
References: <1395754915-14534-1-git-send-email-valentin.longchamp@keymile.com>
	 <1395754915-14534-4-git-send-email-valentin.longchamp@keymile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395754915-14534-4-git-send-email-valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2014-03-25 at 14:41 +0100, Valentin Longchamp wrote:
> +	lbc: localbus@ffe124000 {
> +		reg = <0xf 0xfe124000 0 0x1000>;
> +		ranges = <0 0 0xf 0xffa00000 0x00040000		/* LB 0 */
> +			  1 0 0xf 0xfb000000 0x00010000		/* LB 1 */
> +			  2 0 0xf 0xd0000000 0x10000000		/* LB 2 */
> +			  3 0 0xf 0xe0000000 0x10000000>;	/* LB 3 */
> +
> +		nand@0,0 {
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			compatible = "fsl,elbc-fcm-nand";
> +			reg = <0 0 0x40000>;
> +
> +			partition@0 {
> +				label = "ubi0";
> +				reg = <0x0 0x10000000>;
> +			};

Putting partition info in the dts file is a bad habit and (as I've told
others) I don't think we should continue doing so in new dts files.

In this case it looks like you're just making the entire chip into one
partition, so I'm not sure what the point is of partitioning at all.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
