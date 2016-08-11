From: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] MIPS: BMIPS: Add support GPIO device nodes
Date: Thu, 11 Aug 2016 11:00:00 +0900
Message-ID: <2D0C8F56-B6B7-4079-B0D1-7277781C27E4@gmail.com>
References: <20160808021719.4680-1-jaedon.shin@gmail.com> <20160808021719.4680-3-jaedon.shin@gmail.com> <CAOiHx=kxjXiYm_4S3rLOjB0wM-UpQsqfXn+EVq6+FGOH4whuuQ@mail.gmail.com> <D5F26D94-8312-4CAC-8577-205A1AAFB0E5@gmail.com> <CAOiHx=n19Sb3B1_FGkdzqxWqi5Vpy5PQbYWdaVvNaUTW+Njcog@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOiHx=n19Sb3B1_FGkdzqxWqi5Vpy5PQbYWdaVvNaUTW+Njcog-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jonas,

On Aug 9, 2016, at 11:14 PM, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
> Hi,
> 
> On 9 August 2016 at 03:44, Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hi Jonas,
>> 
>> On Aug 8, 2016, at 11:06 PM, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> 
>>> Hi,
>>> 
>>> please always include devicetree for any dts(i) related changes.
>>> 
>>> On 8 August 2016 at 04:17, Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>> (snip)
>>>> diff --git a/arch/mips/boot/dts/brcm/bcm97435svmb.dts b/arch/mips/boot/dts/brcm/bcm97435svmb.dts
>>>> index 9db84f2a6664..dd8b8fb97053 100644
>>>> --- a/arch/mips/boot/dts/brcm/bcm97435svmb.dts
>>>> +++ b/arch/mips/boot/dts/brcm/bcm97435svmb.dts
>>>> @@ -59,6 +59,14 @@
>>>>       status = "okay";
>>>> };
>>>> 
>>>> +&upg_gio {
>>>> +       status = "okay";
>>>> +};
>>>> +
>>>> +&upg_gio_aon {
>>>> +       status = "okay";
>>>> +};
>>>> +
>>> 
>>> You don't set their status in the dtsi, they will be enabled by
>>> default, and you can drop this change.
>>> 
>>>> &enet0 {
>>>>       status = "okay";
>>>> };
>>> 
>>> 
>>> Regards
>>> Jonas
>> 
>> The status="disabled" has been missing. It will be added in v2.
>> The interrupt-controller@ will also be changed.
> 
> I thought that was indented, since GPIO controllers usually are always
> present (you don't disable the irq controllers by default either).
> 
> Not that I want to tell you how you do your dts(i) files, but I would
> expect things that you usually always need (irq, clocks, gpios) are
> present by default.
> 
> 
> Regards
> Jonas

I checked the BCM7445 ARM based SoC device tree and other BRCM boards, and
I agree with your point. The status="okay" nodes will be removed in v2.

Thanks,
Jaedon--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
