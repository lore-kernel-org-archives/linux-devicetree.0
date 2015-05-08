From: "Ivan T. Ivanov" <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add msm8916 CoreSight components
Date: Fri, 8 May 2015 20:57:49 +0300
Message-ID: <7DD9F545-FA01-427B-BB6E-9A54F1DFF94E@linaro.org>
References: <1431012969-16338-1-git-send-email-ivan.ivanov@linaro.org> <1431012969-16338-3-git-send-email-ivan.ivanov@linaro.org> <CANLsYkzNXBH0d6v1Ny_JwpW6NcKr9v0oAi9K3YfipwDgHWfMMA@mail.gmail.com> <1431092877.21307.18.camel@linaro.org> <CANLsYkyNYQf80c+8uMbZDr=kQ2YEOqy2aS8muEJsLsanDRGLOQ@mail.gmail.com> <1431094640.21307.23.camel@linaro.org> <CANLsYkxFzQPCWXb0w8BddtuJB_cXUtUHBTapYFDF9zqhDBQHrw@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANLsYkxFzQPCWXb0w8BddtuJB_cXUtUHBTapYFDF9zqhDBQHrw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pratik Patel <pratikp-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


> On May 8, 2015, at 7:17 PM, Mathieu Poirier <mathieu.poirier@linaro.o=
rg> wrote:
>=20
> On 8 May 2015 at 08:17, Ivan T. Ivanov <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote=
:
>>=20
>> On Fri, 2015-05-08 at 08:13 -0600, Mathieu Poirier wrote:
>>> On 8 May 2015 at 07:47, Ivan T. Ivanov ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>>> On Fri, 2015-05-08 at 07:38 -0600, Mathieu Poirier wrote:
>>>>> On 7 May 2015 at 09:36, Ivan T. Ivanov ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>>>>> Add initial set of CoreSight components found on Qualcomm's 8x16=
 chipset.
>>>>>>=20
>>>>>>=20
>>>>>> +       replicator@824000 {
>>>>>> +               compatible =3D "qcom,coresight-replicator", "arm=
,primecell";
>>>>>=20
>>>>> Shouldn't it be "qcom,coresight-replicator1x" ?
>>>>>=20
>>>>=20
>>>>=20
>>>>=20
>>>> True, I still wonder, why we have to have this compatible string?
>>>> Drivers are probed by amba_id and "arm,primecell", after all.
>>>>=20
>>>=20
>>> Drivers have their own compatible strings for historical reasons,
>>> something I've been meaning to fix for a long time now...
>>>=20
>>=20
>> Yep, I see that they have been platform drivers in the past, but now
>> they are not, except coresight-replicator driver. IMHO, having
>> additional compatible string could lead just to confusion.
>=20
> I did a little more research on this and based on what I found in the
> kernel it may not need "fixing" after all.  The majority of drivers
> that do specify "arm,primecell" also specify a device-specific
> compatible string.  And in the case of CoreSight devices were
> implementers can do pretty much whatever they  want with the ID
> strings, it is only a matter of time before we need to call something
> like of_device_is_compatible() to fix a quirk.
>=20
> Unless someone heavy asks to remove the device-specific compatible
> strings I'd prefer keeping the current trend set forth by other
> drivers and as such, will ask you to add the "1x" in this bindings.


Well, I don=E2=80=99t strongly object against this =E2=80=9C1x=E2=80=9D=
, I will add it.=20
My point is that if we can dynamically detect device version,=20
which we can do in this case, it will be more robust to do it
in this way.=20

If there are not issues with patch 1/2, I will like to fix and=20
resend only this patch.

Regards,
Ivan

  --
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
