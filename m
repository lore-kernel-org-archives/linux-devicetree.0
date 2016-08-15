From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 3/3] ARM64: dts: amlogic: meson-gxbb: Add watchdog node
Date: Mon, 15 Aug 2016 13:40:21 -0700
Message-ID: <7hinv1ahqi.fsf@baylibre.com>
References: <1468141867-4172-1-git-send-email-narmstrong@baylibre.com>
	<1468141867-4172-4-git-send-email-narmstrong@baylibre.com>
	<578271D3.4080704@roeck-us.net> <7hbn237aw7.fsf@baylibre.com>
	<m2bn19qsy3.fsf@baylibre.com>
	<CAOi56cUQaFKYu2jNP0AuLOSNnNramu+DNPc+PH7K0gHDZMf+zA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOi56cUQaFKYu2jNP0AuLOSNnNramu+DNPc+PH7K0gHDZMf+zA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Kevin Hilman's message of "Wed, 3 Aug 2016 17:29:13 -0700")
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:

> On Wed, Aug 3, 2016 at 5:27 PM, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
>> Hi Guenter,
>>
>> Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:
>>
>>> Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> writes:
>>>
>>>> On 07/10/2016 02:11 AM, Neil Armstrong wrote:
>>>>> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>>>>
>>>> Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
>>>>
>>>> Would this go in through one of the arm trees ?
>>>
>>> You can take the driver through the watchdog tree, but I'll take the DT
>>> stuff through the amlogic tree (and submit via arm-soc).
>>>
>>> However, with your ack, and since this is a brand new driver, I could
>>> take the driver as well.  Just let me know your preference.
>>
>> ping... do you have a prefernce here?
>>
>
> Oops, just noticed Wim already picked these up.
>

Strange, seems that Wim picked up patches 1 & 3, but this one was missed.  I'll
queue this for the arm-soc tree.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
