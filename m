From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH V7 4/4] dmaengine: qcom_hidma: add MSI support for interrupts
Date: Fri, 21 Oct 2016 22:11:41 +0300
Message-ID: <CAHp75Vd+u5va3kyqcapeF9JATUfv5gBnoEM_W+frDmMXs5f2Uw@mail.gmail.com>
References: <1477067879-23750-1-git-send-email-okaya@codeaurora.org> <1477067879-23750-5-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477067879-23750-5-git-send-email-okaya@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sinan Kaya <okaya@codeaurora.org>
Cc: dmaengine <dmaengine@vger.kernel.org>, Timur Tabi <timur@codeaurora.org>, devicetree <devicetree@vger.kernel.org>, Christopher Covington <cov@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Jon Masters <jcm@redhat.com>, Andy Gross <agross@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, Lars-Peter Clausen <lars@metafoo.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 21, 2016 at 7:37 PM, Sinan Kaya <okaya@codeaurora.org> wrote:
> The interrupts can now be delivered as platform MSI interrupts on newer
> platforms. The code looks for a new OF and ACPI strings in order to enable
> the functionality.

> +#ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
> +static void hidma_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
> +{
> +       struct device *dev = msi_desc_to_dev(desc);
> +       struct hidma_dev *dmadev = dev_get_drvdata(dev);
> +
> +       if (!desc->platform.msi_index) {
> +               writel(msg->address_lo, dmadev->dev_evca + 0x118);
> +               writel(msg->address_hi, dmadev->dev_evca + 0x11C);
> +               writel(msg->data, dmadev->dev_evca + 0x120);
> +       }
> +}
> +#endif
> +
> +static void hidma_free_msis(struct hidma_dev *dmadev)
> +{
> +#ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN

Perhaps one #ifdef and two definitions of functions?

-- 
With Best Regards,
Andy Shevchenko
