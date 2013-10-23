From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Wed, 23 Oct 2013 18:02:39 -0500
Message-ID: <CAL_JsqLknd9jwUdD-au_f5cvOAJJyuitq0wOATWU2uids8q7Xg@mail.gmail.com>
References: <52644A9E.3060007@wwwdotorg.org>
	<CAHCPf3uKp-aEavjrEbHGBc_Ga-JgJoEDF+io4kOuvtL6H05eRA@mail.gmail.com>
	<CAFEAcA8rPn7x8W4T3qE5OUeSVQd-GB9+EQPnxMsmyNQ0HKoMPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFEAcA8rPn7x8W4T3qE5OUeSVQd-GB9+EQPnxMsmyNQ0HKoMPw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 23, 2013 at 6:41 AM, Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 22 October 2013 22:44, Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org> wrote:
>> Any driver that fails probing for an optional property is
>> broken and needs fixing.
>
> I agree, but I note that by this rule all the primecell peripheral
> drivers are broken, because the binding docs say that the
> "clocks" and "clock-names" properties are optional but if you
> omit them from the dt node then the kernel refuses to even
> call the driver's probe code. (This is specifically irritating for
> QEMU because it means we have to create a dummy clock
> node in our device tree just to placate the kernel sufficiently
> that we can get it to talk to a PL011 UART model.)

I agree this is broken. The amba bus code should allow for
non-existent clocks. I thought it did, but maybe this changed or my
memory is just broken as well.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
