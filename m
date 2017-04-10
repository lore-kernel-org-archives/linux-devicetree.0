From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: change fixup of dma-ranges size to error
Date: Mon, 10 Apr 2017 04:59:05 -0700
Message-ID: <58EB7389.7020603@gmail.com>
References: <1491459529-31391-1-git-send-email-frowand.list@gmail.com>
 <CAL_Jsq+GLBtaezUiTbm0DAA2+MjcvxAcCsS-qJrr05YcTO5tdw@mail.gmail.com>
 <58E68ADC.6040603@gmail.com>
 <CAL_Jsq+VreUFtA8ozs0Jcz45PTc-jTT=CEKuezeU7QYviiN-Jg@mail.gmail.com>
 <58E72123.4040607@gmail.com>
 <CAL_Jsq+8PoR5ikPbTbHgd-8rkGFmvorLrS9hHpmkVynkh69e-A@mail.gmail.com>
 <58E82008.7000102@gmail.com>
 <19a2a28f-8338-970e-3b5f-05be3362fb9a@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <19a2a28f-8338-970e-3b5f-05be3362fb9a-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sricharan R <sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Robin Murphy <Robin.Murphy-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/10/17 04:48, Sricharan R wrote:
> Hi Frank,
> 
> <snip..>
> 
>>>> Can we get back to the basic premise of the proposed patch?
>>>>
>>>> The current code in of_dma_configure() contains a hack that allows the
>>>> dma-ranges property to specify a mask instead of a size.  The binding
>>>> in the specification allows a size and does not allow a mask.
>>>>
>>>> The hack was added to account for one or more dts files that did not
>>>> follow the specification.  In the mail list discussion of the hack
>>>> you said "Also, we need a WARN here so DTs get fixed."
>>>>
>>>> The hack was first present in Linux 4.1.  The only in-tree dts that
>>>> incorrectly contained a mask instead of a size in dma-ranges was
>>>> arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
>>>>
>>>> That .dtsi was fixed by
>>>> commit c91cb9123cdd ("dtb: amd: Fix DMA ranges in device tree")
>>>> The fix was present in Linux 4.6, May 15, 2016.
>>>>
>>>> I would like to remove the hack.  I think that enough time has
>>>> elapsed to allow this change.
>>>
>>> If we have no cases of what I'm concerned about, then removing it is
>>> fine. Is this a dependency for iommu series? Doesn't look like it to
>>> me.
>>
>> This patch is a replacement for patch 03/12 in the iommu series.  I
>> think that patch 03/12 of the iommu series could be dropped and my
>> patch could be applied independently of the iommu series.
>>
>> There is likely a conflict between my patch and patch 06/12 of the
>> iommu series because in my patch the first line of the patch chunk
>> of drivers/of/device.c includes a line that is changed in 06/12
>> of the iommu series.  If this is the case then the iommu series
>> should take precedence over my patch (and I should subsequently
>> fixup my patch).
>>
> 
> Ok, for which i just posted a V11 [1] with patch 03/12 from
> V10 dropped.
> 
> [1] https://www.mail-archive.com/linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg1373638.html
> 
> Regards,
>  Sricharan
> 

Thanks.  I'll revisit this patch after the iommu series gets merged.

-Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
