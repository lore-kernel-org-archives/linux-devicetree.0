From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: da850: add the mstpri and ddrctl nodes
Date: Wed, 23 Nov 2016 10:19:53 -0600
Message-ID: <5e647eb0-2f8a-b46b-2048-7616bfb54ad7@lechnology.com>
References: <1479207611-18028-1-git-send-email-bgolaszewski@baylibre.com>
 <a39b9276-865b-6382-574e-a5ef040a452f@lechnology.com>
 <CAMpxmJVqog0Fno_DO0NQKmVNvzu5d=3GOLk145wBmB-V70BLeg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMpxmJVqog0Fno_DO0NQKmVNvzu5d=3GOLk145wBmB-V70BLeg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-drm <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, arm-soc <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/23/2016 04:27 AM, Bartosz Golaszewski wrote:
> 2016-11-22 23:23 GMT+01:00 David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>:
>> On 11/15/2016 05:00 AM, Bartosz Golaszewski wrote:
>>>
>>> Add the nodes for the MSTPRI configuration and DDR2/mDDR memory
>>> controller drivers to da850.dtsi.
>>>
>>> Signed-off-by: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>>> ---
>>> v1 -> v2:
>>> - moved the priority controller node above the cfgchip node
>>> - renamed added nodes to better reflect their purpose
>>>
>>>  arch/arm/boot/dts/da850.dtsi | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
>>> index 1bb1f6d..412eec6 100644
>>> --- a/arch/arm/boot/dts/da850.dtsi
>>> +++ b/arch/arm/boot/dts/da850.dtsi
>>> @@ -210,6 +210,10 @@
>>>                         };
>>>
>>>                 };
>>> +               prictrl: priority-controller@14110 {
>>> +                       compatible = "ti,da850-mstpri";
>>> +                       reg = <0x14110 0x0c>;
>>
>>
>> I think we should add status = "disabled"; here and let boards opt in.
>>
>>> +               };
>>>                 cfgchip: chip-controller@1417c {
>>>                         compatible = "ti,da830-cfgchip", "syscon",
>>> "simple-mfd";
>>>                         reg = <0x1417c 0x14>;
>>> @@ -451,4 +455,8 @@
>>>                           1 0 0x68000000 0x00008000>;
>>>                 status = "disabled";
>>>         };
>>> +       memctrl: memory-controller@b0000000 {
>>> +               compatible = "ti,da850-ddr-controller";
>>> +               reg = <0xb0000000 0xe8>;
>>
>>
>> same here. status = "disabled";
>>
>>> +       };
>>>  };
>>>
>
> Hi David,
>
> I did that initially[1][2] and it was rejected by Kevin[3] and Laurent[4].
>
> FYI this patch has already been queued by Sekhar.

Thanks. I did not see those threads.

FYI to maintainers, having these enabled by default causes error 
messages in the kernel log for other boards that are not supported by 
the drivers. Since there is only one board that is supported and soon to 
be 2 that are not, I would rather have this disabled by default to avoid 
the error messages.

>
> Best regards,
> Bartosz Golaszewski
>
> [1] https://www.spinics.net/lists/arm-kernel/msg539638.html
> [2] http://www.spinics.net/lists/devicetree/msg148575.html
> [3] http://www.spinics.net/lists/devicetree/msg148667.html
> [4] http://www.spinics.net/lists/devicetree/msg148655.html
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
