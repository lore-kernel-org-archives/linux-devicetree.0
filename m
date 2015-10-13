From: zhangfei <zhangfei.gao@linaro.org>
Subject: Re: [PATCH 07/25] scsi: hisi_sas: add ioremap for device HW
Date: Tue, 13 Oct 2015 23:09:24 +0800
Message-ID: <561D1EA4.2060601@linaro.org>
References: <1444663237-238302-1-git-send-email-john.garry@huawei.com> <5285087.C8umupFr76@wuerfel> <561CD316.6040406@linaro.org> <5074860.NRYCq0Qjjh@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-scsi-owner@vger.kernel.org>
In-Reply-To: <5074860.NRYCq0Qjjh@wuerfel>
Sender: linux-scsi-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: John Garry <john.garry@huawei.com>, James.Bottomley@hansenpartnership.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linuxarm@huawei.com, linux-scsi@vger.kernel.org, xuwei5@hisilicon.com, john.garry2@mail.dcu.ie, hare@suse.de
List-Id: devicetree@vger.kernel.org



On 10/13/2015 08:20 PM, Arnd Bergmann wrote:
> On Tuesday 13 October 2015 17:47:02 zhangfei wrote:
>> On 10/12/2015 11:21 PM, Arnd Bergmann wrote:
>>> On Monday 12 October 2015 23:20:19 John Garry wrote:
>>>> +int hisi_sas_ioremap(struct hisi_hba *hisi_hba)
>>>> +{
>>>> +       struct platform_device *pdev = hisi_hba->pdev;
>>>> +       struct device *dev = &pdev->dev;
>>>> +       struct resource *res;
>>>> +
>>>> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>> +       hisi_hba->regs = devm_ioremap(dev,
>>>> +                                     res->start,
>>>> +                                     resource_size(res));
>>>> +       if (!hisi_hba->regs)
>>>> +               return -ENOMEM;
>>>> +
>>>> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>>>> +       hisi_hba->ctrl_regs = devm_ioremap(dev,
>>>> +                                          res->start,
>>>> +                                          resource_size(res));
>>>> +       if (!hisi_hba->ctrl_regs)
>>>> +               return -ENOMEM;
>>>> +
>>>> +       return 0;
>>>> +}
>>>>
>>>>    static const struct of_device_id sas_of_match[] = {
>>>>
>>>
>>> Better use devm_ioremap_resource() here, which registers the resource so they
>>> are checked for conflicts and listed in /proc/iomem.
>>>
>>
>> Yes, hisi_hba->regs can use devm_ioremap_resource.
>>
>> However ctrl_regs have to use devm_ioremap, since the address are
>> sharing among different nodes, unfortunately, and devm_ioremap_resource
>> will fail.
>
> This sounds like it should be fixed in the DT binding then, to ensure
> that the ranges don't overlap.
>
> Mapping the same register region multiple times is generally considered
> a bad idea because the drivers that map them often don't have global
> locks that serialize the access, so it's better to have code in place
> that ensures that they are distinct.
>
> What is the purpose of the ctrl_regs region, and why is it shared
> across multiple devices?
>
> Are all users of these registers in the same driver?
>

We are considering using syscon for ctrl_regs.

Thanks Arnd.

