From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 07/37] MIPS: JZ4740: probe CPU interrupt controller
 via DT
Date: Sun, 24 May 2015 18:17:13 +0300
Message-ID: <5561EB79.30209@cogentembedded.com>
References: <1432480307-23789-1-git-send-email-paul.burton@imgtec.com> <1432480307-23789-8-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432480307-23789-8-git-send-email-paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 05/24/2015 06:11 PM, Paul Burton wrote:

> Use the generic irqchip_init function to probe irqchip drivers using DT,
> and add the appropriate node to the JZ4740 devicetree in place of the
> call to mips_cpu_irq_init.
>
> Signed-off-by: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
> ---

> Changes in v5: None
> Changes in v4: None
> Changes in v3:
> - Rebase.

> Changes in v2: None

>   arch/mips/boot/dts/ingenic/jz4740.dtsi | 7 +++++++
>   arch/mips/jz4740/irq.c                 | 4 ++--
>   2 files changed, 9 insertions(+), 2 deletions(-)

> diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi b/arch/mips/boot/dts/ingenic/jz4740.dtsi
> index c538691f..2d64765c 100644
> --- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
> @@ -2,4 +2,11 @@
>   	#address-cells = <1>;
>   	#size-cells = <1>;
>   	compatible = "ingenic,jz4740";
> +
> +	cpuintc: cpuintc@0 {

    The node shoiuld be called "inbterrupt-controller@0".

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
