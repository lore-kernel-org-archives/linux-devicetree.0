From: Eliad Peller <eliad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 1/2] dt: bindings: add wl18xx wireless device
Date: Sun, 8 Mar 2015 13:06:00 +0200
Message-ID: <CAB3XZEcPvTpfviwyY5WpPGWYinGk8qq2yWEKm95n1j7LNDQ_CA@mail.gmail.com>
References: <1424362401-8228-1-git-send-email-eliad@wizery.com>
	<36252734.kTKJHJAt2s@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <36252734.kTKJHJAt2s@wuerfel>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 27, 2015 at 10:14 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Thursday 19 February 2015 18:13:20 Eliad Peller wrote:
>> +Required properties:
>> + - compatible : Should be "ti,wl18xx".
>
> Do not use wildcards in the compatible string, use specific model numbers.

ok. i'll change it to ti,wl1835 and ti,wl1837

thanks,
Eliad.
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
