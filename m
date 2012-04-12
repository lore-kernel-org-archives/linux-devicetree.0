From: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH] staging:iio:adc: Add SPEAr ADC driver
Date: Thu, 12 Apr 2012 11:42:02 +0530
Message-ID: <4F867232.3070509@st.com>
References: <1334150388-23296-1-git-send-email-sr@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1334150388-23296-1-git-send-email-sr-ynQEQJNshbs@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Cc: "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org" <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 4/11/2012 6:49 PM, Stefan Roese wrote:
> +static int __devinit spear_adc_probe(struct platform_device *pdev)
> +{
> +       struct device_node *np = pdev->dev.of_node;
> +       struct spear_adc_info *info;
> +       struct resource *res;
> +       int retval = -ENODEV;
> +       struct iio_dev *iodev = NULL;
> +       int irq;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res) {
> +               dev_err(&pdev->dev, "failed to get platform I/O memory\n");
> +               retval = -EBUSY;
> +               goto errout1;
> +       }
> +
> +       iodev = iio_allocate_device(sizeof(struct spear_adc_info));
> +       if (!iodev) {
> +               dev_err(&pdev->dev, "failed allocating iio device\n");
> +               retval = -ENOMEM;
> +               goto errout1;
> +       }
> +
> +       info = iio_priv(iodev);
> +       info->np = np;
> +
> +       /*
> +        * SPEAr600 has a different register layout than other SPEAr SoC's
> +        * (e.g. SPEAr3xx). Let's provide two register base addresses
> +        * to support multi-arch kernels.
> +        */
> +       info->adc_base_spear6xx = ioremap(res->start, resource_size(res));
> +       if (!info->adc_base_spear6xx) {
> +               dev_err(&pdev->dev, "failed mapping memory\n");
> +               retval = -EBUSY;
> +               goto errout2;
> +       }

This must be a DT only driver and so you can use of_iomap() instead of
ioremap() and platform_get_resource()

> +       info->adc_base_spear3xx =
> +               (struct adc_regs_spear3xx *)info->adc_base_spear6xx;
> +
> +       info->clk = clk_get(&pdev->dev, NULL);
> +       if (IS_ERR(info->clk)) {
> +               dev_err(&pdev->dev, "failed getting clock\n");
> +               goto errout3;
> +       }

patch for devm_* variant of clk is also there.

> +       clk_enable(info->clk);

clk_prepare() is required now, before enable.

> +
> +       irq = platform_get_irq(pdev, 0);
> +       if ((irq < 0) || (irq >= NR_IRQS)) {
> +               dev_err(&pdev->dev, "failed getting interrupt resource\n");
> +               retval = -EINVAL;
> +               goto errout4;
> +       }
> +
> +       retval = request_irq(irq, spear_adc_isr, 0, MOD_NAME, info);
> +       if (retval < 0) {
> +               dev_err(&pdev->dev, "failed requesting interrupt\n");
> +               goto errout4;
> +       }
> +

can use devm_* variants wherever possible.

-- 
viresh
