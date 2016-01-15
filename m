From: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] MIPS: dts: tl_wr1043nd_v1: fix "aliases" node name
Date: Fri, 15 Jan 2016 10:48:21 -0800
Message-ID: <56993EF5.9040008@gmail.com>
References: <1452759657-7114-1-git-send-email-antonynpavlov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452759657-7114-1-git-send-email-antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/14/2016 12:20 AM, Antony Pavlov wrote:
> The correct name for aliases node is "aliases" not "alias".
>
> An overview of the "aliases" node usage can be found
> on the device tree usage page at devicetree.org [1].
>
> Also please see chapter 3.3 ("Aliases node") of the ePAPR 1.1 [2].
>
> [1] http://devicetree.org/Device_Tree_Usage#aliases_Node
> [2] https://www.power.org/documentation/epapr-version-1-1/
>
> Signed-off-by: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
> Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts b/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
> index 003015a..4b6d38c 100644
> --- a/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
> +++ b/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
> @@ -9,7 +9,7 @@
>   	compatible = "tplink,tl-wr1043nd-v1", "qca,ar9132";
>   	model = "TP-Link TL-WR1043ND Version 1";
>
> -	alias {
> +	aliases {
>   		serial0 = "/ahb/apb/uart@18020000";
>   	};

What uses this alias?  If the answer is nothing (likely, as it was 
broken and nobody seems to have noticed), just remove the whole thing.

>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
