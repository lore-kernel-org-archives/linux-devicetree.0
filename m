From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/3] ARM: at91/dt: add clock properties to sama5d3 crypto
 devs
Date: Thu, 19 Dec 2013 17:47:40 +0100
Message-ID: <52B3232C.3000400@atmel.com>
References: <1387465875-4548-1-git-send-email-b.brezillon@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387465875-4548-1-git-send-email-b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 19/12/2013 16:11, Boris BREZILLON :
> Hello,
> 
> This series adds missing clock properties in sama5d3 crypto devices nodes.

Fine, thanks Boris. On the whole series:

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

and integrated in the at91-3.14-dt2 branch.

Bye,

> Best Regards,
> 
> Boris
> 
> Boris BREZILLON (3):
>   ARM: at91/dt: add clk properties to sama5d3 SHA device node
>   ARM: at91/dt: add clk properties to sama5d3 AES device node
>   ARM: at91/dt: add clk properties to sama5d3 TDES device node
> 
>  arch/arm/boot/dts/sama5d3.dtsi |    6 ++++++
>  1 file changed, 6 insertions(+)
> 


-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
