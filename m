From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH V10 7/7] dma: qcom_hidma: add support for object hierarchy
Date: Mon, 21 Dec 2015 16:05:51 -0600
Message-ID: <CAOZdJXVmsb=K0CeO=AsA2zr4CSNbV+TMs3GMVTnQ1AVO2jpgzg@mail.gmail.com>
References: <1450371684-23415-1-git-send-email-okaya@codeaurora.org>
	<1450371684-23415-8-git-send-email-okaya@codeaurora.org>
	<CAHp75Vd-ku1E4+BWGwtL06mO7EZHFmwCvwFiAhLUVwrJHNKD7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vd-ku1E4+BWGwtL06mO7EZHFmwCvwFiAhLUVwrJHNKD7w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Sinan Kaya <okaya@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Vinod Koul <vinod.koul@intel.com>, Jon Masters <jcm@redhat.com>, Timur Tabi <timur@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, cov@codeaurora.org, Andy Gross <agross@codeaurora.org>, dmaengine <dmaengine@vger.kernel.org>, linux-arm-msm@vger.kernel.org, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sat, Dec 19, 2015 at 12:37 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>> +static int __init hidma_mgmt_of_populate_channels(struct device_node *np)
>> +{
>> +       struct platform_device *pdev_parent = of_find_device_by_node(np);
>> +       struct platform_device_info pdevinfo;
>> +       struct of_phandle_args out_irq;
>> +       struct device_node *child;
>> +       struct resource *res;
>> +       const __be32 *cell;
>
> Always BE ?

Unless things have changed, device tree properties are always in
big-endian order, even on little-endian systems.


-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
