From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: explicitly mark skeleton.dtsi as deprecated
Date: Thu, 1 Sep 2016 08:10:28 -0500
Message-ID: <CAL_JsqLCrjWR6dN-u08iiv5xzbLvQZ_=qLz4YWYTrkPJLSTazQ@mail.gmail.com>
References: <1472730037-4972-1-git-send-email-mark.rutland@arm.com> <20160901124611.GA5049@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160901124611.GA5049@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 1, 2016 at 7:46 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> On Thu, Sep 01, 2016 at 12:40:37PM +0100, Mark Rutland wrote:
>> As noted in commit 3ebee5a2e141496b ("arm64: dts: kill skeleton.dtsi"),
>> there are a number of problems with skeleton.dtsi, and it would be
>> prefereable to remove it entirely. As there are a large number of
>> existing users, fixing these up will take a while.
>>
>> This patch adds a note to arm's skeleton.dtsi noting that this is the
>> case, to make this more obvious and hopefully minimize new uptake of
>> skeleton.dtsi in the mean time.
>>
>> Signed-off-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> Cc: Rob Herring <rob.herring-5wv7dgnIgG8@public.gmane.org>
>
> This should have been linaro.org. not sure how I managed that.

Well, kernel.org really.

I was going to ask if we were getting close with the recent activity,
but I just looked and no there's still a ton.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
