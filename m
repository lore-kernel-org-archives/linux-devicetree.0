From: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH] misc: Introduce reboot_reason driver
Date: Wed, 9 Dec 2015 17:32:02 -0800
Message-ID: <CALAqxLXATE4TCGTu+NcDYFTvQ3YTS_m0baCa_AeJp-j4POtSQA@mail.gmail.com>
References: <1449610162-30543-1-git-send-email-john.stultz@linaro.org>
	<20151208220722.GG4000@usrtlx11787.corpusers.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20151208220722.GG4000@usrtlx11787.corpusers.net>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinay Simha BN <simhavcs@gmail.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Android Kernel Team <kernel-team@android.com>, Andy Gross <agross@codeaurora.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 8, 2015 at 2:07 PM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:
> On Tue 08 Dec 13:29 PST 2015, John Stultz wrote:
>> diff --git a/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts b/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts
>> index 5183d18..ee5dcb7 100644
>> --- a/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts
>> +++ b/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts
>> @@ -282,6 +282,15 @@
>>                       };
>>               };
>>
>> +             reboot_reason: reboot_reason@2a03f65c {
>> +                     compatible              = "reboot_reason";
>> +                     reg                     = <0x2A03F65C 0x4>;
>> +                     reason,none             = <0x77665501>;
>> +                     reason,bootloader       = <0x77665500>;
>> +                     reason,recovery         = <0x77665502>;
>> +                     reason,oem              = <0x6f656d00>;
>> +             };
>> +
>
> This address refers to IMEM, which is shared with a number of other
> uses. So I think we should have a simple-mfd (and syscon) with this
> within.

So talking with Arnd some more it looked like IMEM was really just
SRAM. Is that not the case, or is there something else special about
it?  Does it really need simple-mfd and syscon? I'm still fuzzy on how
to use those for this.

>> +     /* initialize specified reasons from DT */
>> +     if (!of_property_read_u32(pdev->dev.of_node, "reason,none", &val))
>> +             reasons[NONE] = val;
>> +     if (!of_property_read_u32(pdev->dev.of_node, "reason,bootloader", &val))
>> +             reasons[BOOTLOADER] = val;
>> +     if (!of_property_read_u32(pdev->dev.of_node, "reason,recovery", &val))
>> +             reasons[RECOVERY] = val;
>> +     if (!of_property_read_u32(pdev->dev.of_node, "reason,oem", &val))
>> +             reasons[OEM] = val;
>
> I would like for this to be less hard coded.

So thinking of this more. Is having something like:

cmds = "default", "bootloader", "recovery";
vals  = <0xmagic1>, <0xmagic2>, <0xmagic3>;

what you're thinking about?

This wouldn't quite handle the "oem-N" options as simply, but they
could define each oem- case explicitly in the DT to support it.

thanks
-john
