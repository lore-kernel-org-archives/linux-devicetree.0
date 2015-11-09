From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH V3 4/4] dma: add Qualcomm Technologies HIDMA channel
 driver
Date: Sun, 8 Nov 2015 19:31:35 -0500
Message-ID: <563FE967.6080705@codeaurora.org>
References: <1446958380-23298-1-git-send-email-okaya@codeaurora.org>
 <1446958380-23298-5-git-send-email-okaya@codeaurora.org>
 <CAHp75VebMdGRkgddoaCH_d_7hzXJt9QXqWc4yvSY=PJ-FcsRLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAHp75VebMdGRkgddoaCH_d_7hzXJt9QXqWc4yvSY=PJ-FcsRLA@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: dmaengine <dmaengine@vger.kernel.org>, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, Andy Gross <agross@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 11/8/2015 3:47 PM, Andy Shevchenko wrote:
> On Sun, Nov 8, 2015 at 6:53 AM, Sinan Kaya <okaya@codeaurora.org> wrote:
>> This patch adds support for hidma engine. The driver
>> consists of two logical blocks. The DMA engine interface
>> and the low-level interface. The hardware only supports
>> memcpy/memset and this driver only support memcpy
>> interface. HW and driver doesn't support slave interface.
>
> Make lines a bit longer.
>

OK

>> +       pm_runtime_set_autosuspend_delay(&pdev->dev, AUTOSUSPEND_TIMEOUT);
>> +       pm_runtime_use_autosuspend(&pdev->dev);
>> +       pm_runtime_set_active(&pdev->dev);
>> +       pm_runtime_enable(&pdev->dev);
>> +
>> +       trca_resource = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>
>> +       if (!trca_resource) {
>> +               rc = -ENODEV;
>> +               goto bailout;
>> +       }
>
> Why did you ignore my comment about this block?
> Remove that condition entirely.
>
Removed these four lines above.

>> +
>> +       trca = devm_ioremap_resource(&pdev->dev, trca_resource);
>> +       if (IS_ERR(trca)) {
>> +               rc = -ENOMEM;
>> +               goto bailout;
>> +       }
>> +
>> +       evca_resource = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>> +       if (!evca_resource) {
>> +               rc = -ENODEV;
>> +               goto bailout;
>> +       }
>
> Ditto.
>

done


>> +uninit:
>> +       hidma_debug_uninit(dmadev);
>> +       hidma_ll_uninit(dmadev->lldev);
>> +dmafree:
>> +       if (dmadev)
>> +               hidma_free(dmadev);
>> +bailout:
>> +       pm_runtime_disable(&pdev->dev);
>> +       pm_runtime_put_sync_suspend(&pdev->dev);
>
> Are you sure this is appropriate sequence?
>
> I think
>
> pm_runtime_put();
> pm_runtime_disable();
>
corrected, reordered and used pm_runtime_put_sync() instead.

> will do the job.
>
>> +       return rc;
>> +}
>> +
>> +static int hidma_remove(struct platform_device *pdev)
>> +{
>> +       struct hidma_dev *dmadev = platform_get_drvdata(pdev);
>> +
>> +       dev_dbg(&pdev->dev, "removing\n");
>
> Useless message.
>
Removed.

>> +       pm_runtime_get_sync(dmadev->ddev.dev);
>> +
>> +       dma_async_device_unregister(&dmadev->ddev);
>> +       hidma_debug_uninit(dmadev);
>> +       hidma_ll_uninit(dmadev->lldev);
>> +       hidma_free(dmadev);
>> +
>> +       dev_info(&pdev->dev, "HI-DMA engine removed\n");
>> +       pm_runtime_put_sync_suspend(&pdev->dev);
>> +       pm_runtime_disable(&pdev->dev);
>> +
>> +       return 0;
>> +}



-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project
