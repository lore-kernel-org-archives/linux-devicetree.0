From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH V17 2/3] dmaengine: qcom_hidma: add debugfs hooks
Date: Wed, 27 Apr 2016 09:47:45 +0100
Message-ID: <57207CB1.4040307@arm.com>
References: <1460384473-5775-1-git-send-email-okaya@codeaurora.org>
 <1460384473-5775-3-git-send-email-okaya@codeaurora.org>
 <20160426033029.GB2274@localhost>
 <b068ead6474f2ffee5acef9ea799aba3@codeaurora.org>
 <20160426162529.GK2274@localhost> <571F9D76.2060809@codeaurora.org>
 <20160427081501.GV2274@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160427081501.GV2274@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, shankerd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, vikrams-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, eric.auger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 27/04/16 09:15, Vinod Koul wrote:
> On Tue, Apr 26, 2016 at 12:55:18PM -0400, Sinan Kaya wrote:
>> On 4/26/2016 12:25 PM, Vinod Koul wrote:
>>> On Tue, Apr 26, 2016 at 08:08:16AM -0400, okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org wrot=
e:
>>>> On 2016-04-25 23:30, Vinod Koul wrote:
>>>>> On Mon, Apr 11, 2016 at 10:21:12AM -0400, Sinan Kaya wrote:
>>>>>
>>>>>> +static int hidma_chan_stats(struct seq_file *s, void *unused)
>>>>>> +{
>>>>>> +	struct hidma_chan *mchan =3D s->private;
>>>>>> +	struct hidma_desc *mdesc;
>>>>>> +	struct hidma_dev *dmadev =3D mchan->dmadev;
>>>>>> +
>>>>>> +	pm_runtime_get_sync(dmadev->ddev.dev);
>>>>>
>>>>> debug shouldn't power up device, why do you want to do that
>>>>
>>>>
>>>> Clocks are turned off while the hw is idle. I can=E2=80=99t reach =
hw
>>>> registers without restoring power.
>>>
>>> Hmm, have you thought about using regmap?
>>>
>>
>> To be honest, I didn't know what regmap is but I just read some code
>> and looked at how it is used. Feel free to correct me if I got it=20
>> wrong.=20
>>
>> Regmap seems to be designed for *slow* speed peripherals to improve =
frequent
>> accesses by the SW. It looks like it is used by MFD, SPI and I2C dri=
vers.
>>
>> It seems to cache the register contents and flush/invalidate them on=
ly when
>> needed.
>>
>> The MMIO version seems to be assuming the presence of device-tree li=
ke CLK
>> API which doesn't exist on ACPI systems and is not portable.
>>
>> My reaction is that it is a lot of code with no added functionality =
to what
>> HIDMA driver is trying to achieve.=20
>>
>> Given that the use case here is only for debug purposes; I think it =
is OK=20
>> to keep this runtime call here. I don't want to add any overhead int=
o the
>> existing code just to support the debug use case. =20
>>
>> None of my register read/writes are slow. This file will only be use=
d to=20
>> troubleshoot customer issues.

I'd recommend you actually run perf on a a few of your MMIO accesses. I
believe the result will be eye opening. On the KVM side, we've trimmed
our MMIO access as much as possible, using a memory-based cache (simila=
r
to regmap in concept). This has made some code paths about 40% faster.

> $ is always faster than MMIO. This way you can give reg contents to u=
sers
> without waking up hw.

Indeed. MMIO access sucks rocks, even on a very fast box. Actually, the
faster the box is, the slower MMIO feels (compared to memory).

Thanks,

	M.
--=20
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
