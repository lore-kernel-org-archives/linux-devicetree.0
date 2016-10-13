From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] binding: irqchip: mtk-cirq: Add binding document
Date: Thu, 13 Oct 2016 15:00:11 +0200
Message-ID: <58b24238-659c-c7da-d93c-65db63990930@gmail.com>
References: <1476335194-26604-1-git-send-email-youlin.pei@mediatek.com>
 <1476335194-26604-2-git-send-email-youlin.pei@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1476335194-26604-2-git-send-email-youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Youlin Pei <youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, hongkun.cao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 10/13/2016 07:06 AM, Youlin Pei wrote:
> This commit adds the device tree binding document for
> the mediatek cirq.
>
> Signed-off-by: Youlin Pei <youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>
> ---
> base on v4.8-rc1
> ---
>  .../interrupt-controller/mediatek,cirq.txt         |   30 ++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mediatek,cirq.txt
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,cirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,cirq.txt
> new file mode 100644
> index 0000000..ad16953
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,cirq.txt
> @@ -0,0 +1,30 @@
> +* Mediatek 27xx cirq
> +
> +In Mediatek SOCs, the CIRQ is a low power interrupt controller designed to
> +works outside MCUSYS which comprises with Cortex-Ax cores,CCI and GIC.
> +The external interrupts (outside MCUSYS) will feed through CIRQ and connect
> +to GIC in MCUSYS. When CIRQ is enabled, it will record the edge-sensitive
> +interrupts and generated a pulse signal to parent interrupt controller when
> +flush command is executed. With CIRQ, MCUSYS can be completely turned off
> +to improve the system power consumption without losing interrupts.
> +
> +Required properties:
> +- compatible: should be: "mediatek,mt2701-cirq".

The cirq is present in several SoCs. I suppose it is the same core in 
all of them. So we can name it mediatek,mtk-cirq and add a 
mediatek,mtXXXX-cirq for every SoC, just in case we will need it.

Thanks,
Matthias
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
