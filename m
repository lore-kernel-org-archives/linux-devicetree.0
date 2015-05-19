From: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: Add msm8916 CoreSight components
Date: Tue, 19 May 2015 07:52:46 -0600
Message-ID: <CANLsYkwTm+8B-ehnC-9MD19MCha_jZU1UCVCev+44eGv_nS50w@mail.gmail.com>
References: <1431333119-13626-1-git-send-email-ivan.ivanov@linaro.org>
	<CANLsYkyKrtyMicsNs2CDd4=GfrQJOPJkAqSUiTB=5hRs3+d=tQ@mail.gmail.com>
	<7F8B0480-06A8-4381-90C8-3F2A35F14FCD@codeaurora.org>
	<1432018984.29174.2.camel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432018984.29174.2.camel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ivan T. Ivanov" <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pratik Patel <pratikp-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 19 May 2015 at 01:03, Ivan T. Ivanov <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
> On Mon, 2015-05-18 at 13:52 -0500, Kumar Gala wrote:
>> >
>> > On May 11, 2015, at 2:21 PM, Mathieu Poirier poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> w=
rote:
>> >
>> > On 11 May 2015 at 02:31, Ivan T. Ivanov ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> > > Add initial set of CoreSight components found on Qualcomm's 8x16=
 chipset.
>> >
>
>> >
>> > Kumar, I'm happy with this DT specification for Coresight.  Since =
I'm
>> > taking the driver it would likely make more sense for this to go
>> > through my tree.  Could you please have a look and give me your ac=
k?
>>
>> It looks ok, however I don=E2=80=99t see us including this file anyw=
here, so that=E2=80=99s my only concern.
>>
>
> True. The reason is that 'rpmcc' driver is still in testing phase
> and it is not upstreamed. Once it is ready, I will include this file
> where is appropriate.
>
> Regards,
> Ivan

Very well - as such I won't take the DT patch right away.  Please
re-submit when all the components are ready.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
