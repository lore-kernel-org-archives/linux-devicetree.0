From: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH -next v2] dmaengine: ste_dma40: fix error return code in
 d40_probe()
Date: Fri, 31 May 2013 09:07:36 +0800
Message-ID: <CAPgLHd-Gj0UXLdMYdQyGtyHY8T_c=XENc-=SZ=nejCKMiAFXkQ@mail.gmail.com>
References: <CAPgLHd-gjJ6ju3HyhiQi98YFGojvU3aYSTn7SOe4NhQPY1r++w@mail.gmail.com>
 <CAHp75Vf+ifmn62vRNZbqpVX1hnqeUkenzvY81gZLenFkEJ9pFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAHp75Vf+ifmn62vRNZbqpVX1hnqeUkenzvY81gZLenFkEJ9pFA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: srinidhi.kasagar-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, djbw-b10kYP2dOMg@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/31/2013 02:29 AM, Andy Shevchenko wrote:
> On Thu, May 30, 2013 at 7:32 AM, Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> In many of the error handling case, the return value 'ret' not set
>> and 0 will be return from d40_probe() even if error, but we should
>> return a negative error code instead in those error handling case.
>> This patch fixed them, and also removed useless variable 'err'.
> Hold on, please.
>
>> --- a/drivers/dma/ste_dma40.c
>> +++ b/drivers/dma/ste_dma40.c
>> @@ -3619,6 +3618,7 @@ static int __init d40_probe(struct platform_device *pdev)
>>                 if (IS_ERR(base->lcpa_regulator)) {
>>                         d40_err(&pdev->dev, "Failed to get lcpa_regulator\n");
>>                         base->lcpa_regulator = NULL;
>> +                       ret = PTR_ERR(base->lcpa_regulator);
> Is it really what we want?
>
> I thixh you may remove that NULL assignment.

Ohh, I will move the ret = PTR_ERR(base->lcpa_regulator) above the NULL
assignment, the failure path test for base->lcpa_regulator to release regulator.

        if (base->lcpa_regulator) {
            regulator_disable(base->lcpa_regulator);
            regulator_put(base->lcpa_regulator);
        }

>
>
>>                         goto failure;
>>                 }
>>
>> @@ -3647,8 +3647,8 @@ static int __init d40_probe(struct platform_device *pdev)
>>         d40_hw_init(base);
>>
>>         if (np) {
>> -               err = of_dma_controller_register(np, d40_xlate, NULL);
>> -               if (err && err != -ENODEV)
>> +               ret = of_dma_controller_register(np, d40_xlate, NULL);
>> +               if (ret && ret != -ENODEV)
> >From the discussion of dw_dmac I remember we decide that ENODEV check
> is redundant.

Get it, I will remove the ENODEV check.

Thanks,
Yongjun Wei
