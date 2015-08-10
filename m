From: Alban <albeu-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 1/2] MIPS: ath79: set irq ACK handler for
 ar7100-misc-intc irq chip
Date: Mon, 10 Aug 2015 20:11:14 +0200
Message-ID: <20150810201114.468748de@tock>
References: <1438857805-18443-1-git-send-email-lynxis@fe80.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438857805-18443-1-git-send-email-lynxis-qyMx1GtpvWw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Couzens <lynxis-qyMx1GtpvWw@public.gmane.org>
Cc: Aban Bedel <albeu-GANU6spQydw@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu,  6 Aug 2015 12:43:24 +0200
Alexander Couzens <lynxis-qyMx1GtpvWw@public.gmane.org> wrote:

A log message would be nice. IMHO it should mention that the ACK
callbacks have been missed when introducing OF support.

> Signed-off-by: Alexander Couzens <lynxis-qyMx1GtpvWw@public.gmane.org>
> ---
>  arch/mips/ath79/irq.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/mips/ath79/irq.c b/arch/mips/ath79/irq.c
> index afb0096..dc76fa1 100644
> --- a/arch/mips/ath79/irq.c
> +++ b/arch/mips/ath79/irq.c
> @@ -303,13 +303,20 @@ static int __init ath79_misc_intc_of_init(
>  	__raw_writel(0, base + AR71XX_RESET_REG_MISC_INT_ENABLE);
>  	__raw_writel(0, base + AR71XX_RESET_REG_MISC_INT_STATUS);
>  
> -

I would prefer to see this in another patch.


[...]

Alban
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
