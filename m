From: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 14/18] arm64: dts: ulcb-kf: enable PCA9539 on I2C2
Date: Fri, 6 Oct 2017 05:40:55 +0300
Message-ID: <377d7b16-15be-a488-6187-4c57b8b57d6e@cogentembedded.com>
References: <1505398760-4774-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdWvhm_bbLz8cBqPWC-nXrTr6jw4cBV1A_WAsvi6DzsR0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdWvhm_bbLz8cBqPWC-nXrTr6jw4cBV1A_WAsvi6DzsR0w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On 20.09.2017 16:44, Geert Uytterhoeven wrote:
> Hi Vladimir,
>
> On Thu, Sep 14, 2017 at 4:19 PM, Vladimir Barinov
> <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
>> This supports PCA9539 gpio expanders on I2C2 bus on ULCB Kingfisher board
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>
>> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
>> @@ -48,6 +48,28 @@
>>          status = "okay";
>>   };
>>
>> +&i2c2 {
>> +       gpio_exp_74: gpio@74 {
>> +               compatible = "nxp,pca9539";
> According to the schematics, this is the TI TCA9539, an enhanced version
> of the NXP PCA9539. So I'd expect "ti,tca9539".
>
> However, using the latter may not work (I didn't try), as pca953x_id[]
> lists both parts, while pca953x_dt_ids[] lists only the NXP part number.
It works with "ti,tca9539"

-- 
Regards,
Vladimir

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
