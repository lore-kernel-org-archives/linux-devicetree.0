From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH 10/10] dmaengine: qcom_hidma: add MSI support for
 interrupts
Date: Sun, 24 Jul 2016 12:12:56 +0530
Message-ID: <20160724064256.GA9681@localhost>
References: <1468867177-15007-1-git-send-email-okaya@codeaurora.org>
 <1468867177-15007-11-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1468867177-15007-11-git-send-email-okaya@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Sinan Kaya <okaya@codeaurora.org>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "timur@codeaurora.org" <timur@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "cov@codeaurora.org" <cov@codeaurora.org>, "jcm@redhat.com" <jcm@redhat.com>, "eric.auger@linaro.org" <eric.auger@linaro.org>, "agross@codeaurora.org" <agross@codeaurora.org>, "arnd@arndb.de" <arnd@arndb.de>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "Williams, Dan J" <dan.j.williams@intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 19, 2016 at 12:09:37AM +0530, Sinan Kaya wrote:

> @@ -567,6 +578,98 @@ static int hidma_create_sysfs_entry(struct hidma_dev *dev, char *name,
>         return device_create_file(dev->ddev.dev, attrs);
>  }
> 
> +#ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN

This can be true on machine with your older HW, so I would be bit more
careful here..

> +       if (rc)
> +               dev_warn(&pdev->dev,
> +                        "failed to request MSI irq, falling back to wired IRQ\n");
> +       return rc;
> +#else
> +       return -EINVAL;

-EINVAL doesnt sound apt here..

> +       struct acpi_device *adev = ACPI_COMPANION(dev);
> +       const char *of_compat;
> +       int ret;
> +
> +       if (!adev || acpi_disabled) {
> +               ret = device_property_read_string(dev, "compatible",
> +                                                 &of_compat);
> +               if (ret)
> +                       return false;
> +
> +               ret = strcmp(of_compat, "qcom,hidma-1.1");
> +       } else {
> +               ret = strcmp(acpi_device_hid(adev), "QCOM8062");

Okay if you ahve a device ID then why do we need new binding? This device as
you said implies the support for MSI interrupts.

Thanks
-- 
~Vinod
