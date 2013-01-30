From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 2/6] ARM: dts: Add MFC codec support for Exynos4 DT machines
Date: Wed, 30 Jan 2013 11:30:31 +0530
Message-ID: <CAK9yfHyvhB1Kt81N7O=T7WFVHZupoF6+LcFj6QwD-CXvFOvGWQ@mail.gmail.com>
References: <1359432822-23846-1-git-send-email-sachin.kamat@linaro.org>
	<1359432822-23846-3-git-send-email-sachin.kamat@linaro.org>
	<5107D06F.4000002@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <5107D06F.4000002@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, patches@linaro.org
List-Id: devicetree@vger.kernel.org

Hi Sylwester,


>> +     mfc: codec@13400000 {
>> +             compatible = "samsung,mfc-v5";
>> +             reg = <0x13400000 0x10000>;
>> +             interrupts = <0 94 0>;
>> +             samsung,power-domain = <&pd_mfc>;
>
> Please add:
>                 status = "disabled";

OK

>
>> +     };
>>  };
>> +static void __init exynos4_reserve(void)
>> +{
>> +#ifdef CONFIG_S5P_DEV_MFC
>
> Where is this symbol supposed to be enabled ?
>
> Don't you need a change like this as a part of this patch ?

Yes. Good catch. Since this symbol was defined under other machines
which were getting enabled, I did not notice this.

>

-- 
With warm regards,
Sachin
