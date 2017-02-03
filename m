From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/6] bus: add driver for the Technologic Systems NBUS
Date: Fri, 3 Feb 2017 14:51:15 +0100
Message-ID: <CACRpkdbAYyxTOq_ZAwjSJAhCbrzTaUMSG9N7t8Wq1ifTDFBLrQ@mail.gmail.com>
References: <20161214231237.17496-1-sebastien.bourdelin@savoirfairelinux.com>
 <20161214231237.17496-5-sebastien.bourdelin@savoirfairelinux.com>
 <CACRpkdYHHrYY-fAPnNmV94ejFJ36rhSF0SqSVHkTNq+YCRNNZw@mail.gmail.com> <7bc0871f-ac0a-e8a0-0c84-a0e61b3991a8@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7bc0871f-ac0a-e8a0-0c84-a0e61b3991a8-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastien Bourdelin <sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel <kernel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, Mark Featherston <mark-L1vi/lXTdtvnC/t2CciAbw@public.gmane.org>, kris-L1vi/lXTdtvnC/t2CciAbw@public.gmane.org, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob
List-Id: devicetree@vger.kernel.org

On Wed, Feb 1, 2017 at 8:56 PM, Sebastien Bourdelin
<sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org> wrote:
> On 12/30/2016 02:58 AM, Linus Walleij wrote:

>>> +static struct ts_nbus *ts_nbus;
>>
>> Nopes. No singletons please.
>>
>> Use the state container pattern:
>> Documentation/driver-model/design-patterns.txt
>
> I understand the idea but have problem to find a good way to implement it.
>
> Other drivers using the NBUS which are child nodes in the device tree
> will use the ts_nbus_write() and ts_nbus_read() functions, it means these
> drivers should have a pointer to the allocated ts_nbus and pass it to
> the write() and read() functions as an argument if i'm not using a
> singleton here.
> But i'm lacking knowledge on how to properly share this pointer when
> initializing the NBUS driver with the child nodes.

Your child nodes I guess will be instatiated as devices as well.

These devices will have the NBUS driver as .parent in their
struct device I guess. Else the design of this bus is tilted.

If the NBUS driver use dev_set_drvdata(dev, state_container_cookie)
the children can use dev_get_drvdata(dev->parent); to get a pointer to
the same cookie.

The subdrivers don't even need to know the members of the state
container as long as you're just passing a pointer to it. It's
enough if you forward-declare it as a "pointer to some struct":

struct foo;

{
   struct foo *fooptr = dev_get_drvdata(dev->parent);
   write(fooptr, 0x10);

etc

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
