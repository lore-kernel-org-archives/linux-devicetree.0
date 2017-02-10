From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3] usb: add device tree support for fotg2-hcd driver
Date: Fri, 10 Feb 2017 14:24:40 +0100
Message-ID: <CACRpkdY5g1J94EGkaxryjUCfE9Kf9100ay0YTKO7OWifoVSc3Q@mail.gmail.com>
References: <20170208200010.21522-1-ulli.kroll@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170208200010.21522-1-ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 8, 2017 at 9:00 PM, Hans Ulli Kroll
<ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:

> Add device tree binding and DT driver support for fotg2-hcd controller
> The device is used on Gemini SoC.

All looks good to me.

If you send a patch on top of my git branch adding it to the
gemini.dtsi set as status = "disabled"; and gemini-nas4220b.dts
mainly just setting status = "okay"; I can merge this on top of
the rest of the stuff in my tree that should go upstream to ARM
SoC.

Yours.
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
