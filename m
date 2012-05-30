From: Chris Ball <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/9] ARM: mmp: support DT in irq
Date: Wed, 30 May 2012 15:38:51 -0400
Message-ID: <87ehq1tq5w.fsf@laptop.org>
References: <1335515957-1798-1-git-send-email-haojian.zhuang@gmail.com>
 <1335515957-1798-4-git-send-email-haojian.zhuang@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1335515957-1798-4-git-send-email-haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 (Haojian Zhuang's message of "Fri, 27 Apr 2012 16:39:11 +0800")
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Haojian,

On Fri, Apr 27 2012, Haojian Zhuang wrote:
> Append new interrupt driver that could support both pxa168 and mmp2
> silicon. And this driver supports device tree.
>
> Since CONFIG_SPARSE_IRQ is enabled in arch-mmp, irq driver should
> handle reserved NR_IRQS_LEGACY in irq domain.
>
> Signed-off-by: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

This patch (now in mainline) breaks boot on XO-1.75 (MMP2, non-DT).
I hit the error path below:

> +	for (i = 1; i < max_icu_nr; i++) {
> +		if (irq == icu_data[i].cascade_irq) {
> +			domain = icu_data[i].domain;
> +			data = (struct icu_chip_data *)domain->host_data;
> +			break;
> +		}
> +	}
> +	if (i >= max_icu_nr) {
> +		pr_err("Spurious irq %d in MMP INTC\n", irq);
> +		return;
> +	}

This error path is hit because i=8 and max_icu_nr=8, which is because
we never matched (irq == icu_data[i].cascade_irq) in the for loop above.
This test is outside of a DT path, but cascade_irq appears to only ever
be set *inside* a DT path:

> +		icu_data[i].cascade_irq = irq_of_parse_and_map(node, 0);
> +		if (!icu_data[i].cascade_irq) {
> +			ret = -EINVAL;
> +			goto err;
> +		}

Did you test non-DT boot with these changes?

Thanks,

- Chris.
-- 
Chris Ball   <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>   <http://printf.net/>
One Laptop Per Child
