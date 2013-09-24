From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3] gpio: interrupt consistency check for OF GPIO IRQs
Date: Tue, 24 Sep 2013 10:59:07 -0600
Message-ID: <5241C4DB.9090200@wwwdotorg.org>
References: <1377526030-32024-1-git-send-email-larsi@wh2.tu-dresden.de> <522FBED9.9000305@collabora.co.uk> <5230C7F6.3080803@wwwdotorg.org> <3653629.tapNZSuWhS@lem-wkst-02> <52373B34.4060709@wwwdotorg.org> <CACRpkdY=cgtf6_eypfAAv-fvmiNgAYyz4StTgDie5THsbrcumg@mail.gmail.com> <5240A2D3.20105@wwwdotorg.org> <CACRpkdZ7E7MGppbkTiObvTDHdmphnbysMKVc1OZjsPXKVuKttQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdZ7E7MGppbkTiObvTDHdmphnbysMKVc1OZjsPXKVuKttQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Lars Poeschel <poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars Poeschel <larsi-myOXECIRRCL4ajHJ1XSv27NAH6kLmebB@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Enric Balletbo i Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Balaji T K <balajitk-l0cyMroinI0@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Jon Hunter <jgchunter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, joelf-l0cyMroinI0@public.gmane.org, Laur
List-Id: devicetree@vger.kernel.org

On 09/24/2013 02:31 AM, Linus Walleij wrote:
> On Mon, Sep 23, 2013 at 10:21 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
...
>> Perhaps rather than having the gpio_chip/irq_chip drivers physically
>> implement a function which calls this common code, they could set some
>> flags/data/... in the struct gpio_chip/irq_chip indicating that they
>> desire the core code that implements the error-checking to be enabled.
> 
> I think it should more be like a function they can call to flag
> a GPIO as used for IRQ.

For the record, that's pretty much exactly what I meant by implementing
it in the drivers. The irq_chip driver knows when the IRQ has been
requested, and calls some gpiolib function to mark the GPIO as
in-use-as-an-IRQ.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
