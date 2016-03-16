From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [linux-sunxi] [PATCH 1/4] gpio: Add AXP209 GPIO driver
Date: Wed, 16 Mar 2016 10:57:37 +0100
Message-ID: <CACRpkdY4L4uVAF9er4eD5jn8wsMfdtOoHn3r8qUzYxY3eySSLg@mail.gmail.com>
References: <1457520614-32239-1-git-send-email-maxime.ripard@free-electrons.com>
	<1457520614-32239-2-git-send-email-maxime.ripard@free-electrons.com>
	<87io0v23fz.fsf@dell.be.48ers.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87io0v23fz.fsf-D6SC8u56vOOJDPpyT6T3/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Korsgaard <peter-+2lRwdCCLRT2eFz/2MeuCQ@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 9, 2016 at 2:20 PM, Peter Korsgaard <peter-+2lRwdCCLRT2eFz/2MeuCQ@public.gmane.org> wrote:
>>>>>> "Maxime" == Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> writes:

>  > +    dev_info(&pdev->dev, "AXP209 GPIO driver loaded\n");
>
> Any reason to be so noisy?

The GPIO maintainer likes boasty drivers.

I don't understand people who are dmesg minimalists, I want to
have positive indications that things work in there, not just bad news
about what went wrong.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
