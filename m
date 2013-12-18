From: Jonas Jensen <jonas.jensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 2/2] ARM: mach-moxart: add MOXA ART SoC device tree files
Date: Wed, 18 Dec 2013 14:10:13 +0100
Message-ID: <CACmBeS2amFHRQM9HB5pvT5eZYYidWHDNBsWEvSpMKAy7yCqmPw@mail.gmail.com>
References: <1387294714-12872-1-git-send-email-jonas.jensen@gmail.com>
	<1387294714-12872-3-git-send-email-jonas.jensen@gmail.com>
	<CAEgOgz7kqU-Z6cQk8kiMBiNs=9coOVq-6it1eKEiN62wKXcsZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAEgOgz7kqU-Z6cQk8kiMBiNs=9coOVq-6it1eKEiN62wKXcsZg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org" <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Thanks for the replies, changes should be in v6.

On 18 December 2013 00:29, Peter Crosthwaite
<peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>> +       clocks {
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +
>> +               ref12: ref12M {
>> +                       compatible = "fixed-clock";
>> +                       #clock-cells = <0>;
>> +                       clock-frequency = <12000000>;
>
> Crystal board level?

I couldn't move this due to fixed-clock load order.

See my comments in v6 cover letter:

http://lists.infradead.org/pipermail/linux-arm-kernel/2013-December/220302.html


Thanks,
Jonas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
