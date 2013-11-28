From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] Documentation: devicetree: arm: add lpae property to
 cpus/cpu bindings
Date: Wed, 27 Nov 2013 21:28:01 -0800
Message-ID: <CAOesGMh45EyTm5ZEAXphiD5L=cyLQ=732qZfW1jtQDo8Rd9rpg@mail.gmail.com>
References: <1385517172-803-1-git-send-email-olof@lixom.net>
	<20131127094911.GE5402@e106331-lin.cambridge.arm.com>
	<CAOesGMh9aQEtqha3gt80q4RmLjXtFTc+Xt39M0m+geTk_betzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMh9aQEtqha3gt80q4RmLjXtFTc+Xt39M0m+geTk_betzQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 27, 2013 at 11:27 AM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> On Wed, Nov 27, 2013 at 1:49 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
>> Hi Olof,
>>
>> On Wed, Nov 27, 2013 at 01:52:52AM +0000, Olof Johansson wrote:
>>> While the LPAE capability is determined by the kernel today, it is still
>>> useful to be able to specify the feature in the device tree. There is
>>> precedence from other architectures for this.
>>>
>>> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
>>> ---
>>>
>>> My personal motive for this is to be able to tell which boards are
>>> work even trying to boot an LPAE kernel on, since we don't disable the
>>> platforms that are based on A8/A9 when LPAE is turned on. I'll add dtsi
>>> patches for A7/A15-based platforms once the binding is settled.
>>
>> It would be nice to have this description of why you want to add this in
>> the commit message proper.
>
> Sure.


By the way, I ended up doing it a different way than depending on DT
contents, so I don't have a need to push for this now.

Still, I think it's worth resolving long-term (how to encode CPU
features on ARM as properties), but lower priority.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
