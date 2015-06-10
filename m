From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv3] gpio: add ETRAXFS GPIO driver
Date: Wed, 10 Jun 2015 09:11:54 +0200
Message-ID: <CACRpkdbOeok3nS=LTHQf+oMggY9TGA5OHbCLJJ2cEpOG1KyeVw@mail.gmail.com>
References: <1433622640-26231-1-git-send-email-rabin@rab.in>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433622640-26231-1-git-send-email-rabin-66gdRtMMWGc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rabin Vincent <rabin-66gdRtMMWGc@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jun 6, 2015 at 10:30 PM, Rabin Vincent <rabin-66gdRtMMWGc@public.gmane.org> wrote:

> Add a GPIO driver for the General I/O block on Axis ETRAX FS SoCs.
>
> Signed-off-by: Rabin Vincent <rabin-66gdRtMMWGc@public.gmane.org>
> ---
> v3: Move port number to last cell and use of_gpio_simple_xlate().

Awesome, patch applied for the v4.2 cycle!

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
