From: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] rtc: sprd: Add Spreadtrum RTC driver
Date: Wed, 8 Nov 2017 13:48:54 +0800
Message-ID: <CAMz4kuJNALMSmGV7tSiGZMj6S2=5LyfaqTpzowzM95gLKpHO1A@mail.gmail.com>
References: <7037c5053a533505f38fc036290a398989cfdafc.1510051749.git.baolin.wang@spreadtrum.com>
 <b053858c3325e7c35436f35adf09b5df90106d42.1510051749.git.baolin.wang@spreadtrum.com>
 <20171108034409.cm65hvuhz67hmz3b@piout.net> <CAMz4kuK=7W7t63Axi=jcqLPYz-L=MF=uE-8rNNf9LhqP1E=hXw@mail.gmail.com>
 <20171108053522.qhoagssswonevae4@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171108053522.qhoagssswonevae4-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 8 November 2017 at 13:35, Alexandre Belloni
<alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On 08/11/2017 at 13:29:21 +0800, Baolin Wang wrote:
>> > Don't do that. This is a valuable information. If you know the time is
>> > invalid, return -EINVAL in read_time(). What your are doing here is
>> > confusing the system by making it believe your fake date is the correct
>> > time.
>>
>> Usually for mobile device, we should give one reasonable start time if
>> the RTC powered down. Anyway I can remove this feature now.
>> Very appreciated for your helpful comments.
>
> Then userspace will have -EINVAL when reading the RTC and will be able
> to set the RTC to whatever value it wants. Don't encode that policy in
> the kernel.

That's great. Thanks for explanation.

-- 
Baolin.wang
Best Regards
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
