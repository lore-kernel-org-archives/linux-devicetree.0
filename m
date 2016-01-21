From: Alban <albeu-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 1/3] MIPS: dts: qca: ar9132_tl_wr1043nd_v1.dts: drop
 unused alias node
Date: Thu, 21 Jan 2016 11:31:41 +0100
Message-ID: <20160121113141.66ac374c@tock>
References: <1453370345-16688-1-git-send-email-antonynpavlov@gmail.com>
	<1453370345-16688-2-git-send-email-antonynpavlov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453370345-16688-2-git-send-email-antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Aban Bedel <albeu-GANU6spQydw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 21 Jan 2016 12:59:03 +0300
Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

This will need at least a small log that explain that why it is useless.
This board only have this one serial, so replacing the default of 0
with 0 does nothing usefull.

Alban

> Signed-off-by: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
> Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts b/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
> index 003015a..a6108f8 100644
> --- a/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
> +++ b/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
> @@ -9,10 +9,6 @@
>  	compatible = "tplink,tl-wr1043nd-v1", "qca,ar9132";
>  	model = "TP-Link TL-WR1043ND Version 1";
>  
> -	alias {
> -		serial0 = "/ahb/apb/uart@18020000";
> -	};
> -
>  	memory@0 {
>  		device_type = "memory";
>  		reg = <0x0 0x2000000>;

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
