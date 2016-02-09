From: Alban <albeu-GANU6spQydw@public.gmane.org>
Subject: Re: [RFC v5 02/15] dt-bindings: clock: qca,ath79-pll: fix
 copy-paste typos
Date: Tue, 9 Feb 2016 22:52:54 +0100
Message-ID: <20160209225254.1a03c2b1@tock>
References: <1455005641-7079-1-git-send-email-antonynpavlov@gmail.com>
	<1455005641-7079-3-git-send-email-antonynpavlov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455005641-7079-3-git-send-email-antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Aban Bedel <albeu-GANU6spQydw@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Wills Wang <wills.wang-EMRzualFZlQ@public.gmane.org>, Daniel Schwierzeck <daniel.schwierzeck-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue,  9 Feb 2016 11:13:48 +0300
Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Signed-off-by: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
> Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
> Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  Documentation/devicetree/bindings/clock/qca,ath79-pll.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qca,ath79-pll.txt b/Documentation/devicetree/bindings/clock/qca,ath79-pll.txt
> index e0fc2c1..ae99f22 100644
> --- a/Documentation/devicetree/bindings/clock/qca,ath79-pll.txt
> +++ b/Documentation/devicetree/bindings/clock/qca,ath79-pll.txt
> @@ -3,7 +3,7 @@ Binding for Qualcomm Atheros AR7xxx/AR9XXX PLL controller
>  The PPL controller provides the 3 main clocks of the SoC: CPU, DDR and AHB.
>  
>  Required Properties:
> -- compatible: has to be "qca,<soctype>-cpu-intc" and one of the following
> +- compatible: has to be "qca,<soctype>-pll" and one of the following
>    fallbacks:
>    - "qca,ar7100-pll"
>    - "qca,ar7240-pll"
> @@ -21,7 +21,7 @@ Optional properties:
>  
>  Example:
>  
> -	memory-controller@18050000 {
> +	pll-controller@18050000 {
>  		compatible = "qca,ar9132-ppl", "qca,ar9130-pll";
>  		reg = <0x18050000 0x20>;
>  

Acked-by: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>

Alban
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
