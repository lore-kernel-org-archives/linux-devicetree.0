From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/3] arm: dts: add device_type="memory" for ste-ccu8540
Date: Thu, 15 May 2014 15:50:17 +0100
Message-ID: <CACxGe6sfjZxCuOTHwRswWW2rMQ_gJyxS+R=+5HQHnzT-BNzekg@mail.gmail.com>
References: <1397756521-29387-1-git-send-email-leif.lindholm@linaro.org>
 <1397756521-29387-2-git-send-email-leif.lindholm@linaro.org> <CACRpkda6+0LyHsqP5J-OTHaau1QPJaJRAup1d3KQq5zu2XC=HA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkda6+0LyHsqP5J-OTHaau1QPJaJRAup1d3KQq5zu2XC=HA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 22, 2014 at 2:26 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Apr 17, 2014 at 7:41 PM, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
>> The current .dts for ste-ccu8540 lacks a 'device_type = "memory"' for
>> its memory node, relying on an old ppc quirk in order to discover its
>> memory. Add this, to permit that quirk to be made ppc only.
>>
>> Signed-off-by: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> There are no systems like this deployed so this patch set will not
> affect anything in the wild.

I may as well take all three of these patches through my tree (I've
changed my mind on the last one). There are actually not a huge number
of systems with ram starting at 0, so the impact is contained.

Applied, thanks.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
