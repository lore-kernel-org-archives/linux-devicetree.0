From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 0/3] Qualcomm Resource Power Manager driver
Date: Thu, 19 Jun 2014 09:25:48 +0530
Message-ID: <CAJe_ZhfmsgvnVu-VgN63LaZ-522HuAY_EVfB6ujQjdzBE+u=zA@mail.gmail.com>
References: <1402944372-31901-1-git-send-email-bjorn.andersson@sonymobile.com>
	<7hvbrzbh1u.fsf@paris.lan>
	<CAJAp7OhHr4Cgcp9pvQ3=MAie_zSnFJxG28Vf37qJ98BK7P1jaQ@mail.gmail.com>
	<7hzjha8b97.fsf@paris.lan>
	<842A7147-A2CC-42BD-9947-CBADF738DC92@codeaurora.org>
	<7hegym6uca.fsf@paris.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7hegym6uca.fsf-4poPxKt068f/PtFMR13I2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 18 June 2014 22:14, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> writes:
>
>> On Jun 18, 2014, at 10:53 AM, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>
>>> Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org> writes:
>>>
>>>> On Tue, Jun 17, 2014 at 10:07 AM, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>>>> +Paul Walmsley
>>>>>
>>>>> Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org> writes:
>>>>>
>>>>>> This series adds a regulator driver for the Resource Power Manager found in
>>>>>> Qualcomm 8660, 8960 and 8064 based devices.
>>>>>>
>>>>>> The RPM driver exposes resources to its child devices, that can be accessed to
>>>>>> implement drivers for the regulators, clocks and bus frequency control that's
>>>>>> owned by the RPM in these devices.
>>>>>>
>>>>>> Changes since v2:
>>>>>>  - Fix copy-paste error in dt binding
>>>>>>  - Correct incomplete move from mfd to soc
>>>>>>  - Correct const mistake in regulator driver
>>>>>>
>>>>>> Changes since v1:
>>>>>>  - Moved rpm driver to drivers/soc
>>>>>
>>>>> I'm not sure I follow the motivation for having this under drivers/soc?
>>>>>
>>>> Hi Kevin,
>>>>
>>>> I've made the argument that to me this is conceptually a black box
>>>> handling regulators, clocks and other stuff; hence similar to a PMIC,
>>>> which would fit nicely into drivers/mfd.
>>>>
>>>> I still think this is the case and now that I look back I didn't get
>>>> any pushback from Lee Jones so maybe the move was premature?
>>>
>>> Yes, IMO, the move was premature, but hopefully the drivers/soc folks
>>> can chime in an clarify the criteria for inclusion there.
>>>
>>> Kevin
>>
>> I dont agree, I think having this in drivers/soc means that we can
>> clearly go through drivers/soc in the future and look for patterns
>> across SoCs that should be re-factored.
>
> I don't believe that was the goal in creating drivers/soc.
>
>> Where MFD seems like its become the new drivers misc.
>
> Well, I don't think that drivers/soc wants to be the new drivers/misc
> either. ;)
>
> Thinking more about what this RPM driver actually does, and since you
> mentioned patterns across SoCs, it seems to me the RPM driver bascially
> just doing the IPC.
>
> So, rather than MFD or drivers/soc, it seems to me that it should be
> implmented as a controller in the new common mailbox framwork[1] being
> worked on by Jassi Brar (added to Cc.)
>
> IIUC, RPM is actually only doing one-way IPC (it only exposes a write()
> interface to clients) so it seems like a rather simple implementation of
> a mailbox controller.
>
Yup, qcom_rpm.c is exactly what drivers/mailbox/ is meant for.

 Agreed the driver is _very_ SoC specific (Qualcomm) but so is any
other mailbox driver in my knowledge. So either we move all to
drivers/mailbox/ or empty that out into drivers/soc/   I tend to lean
towards the first option.

Thanks
-Jassi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
