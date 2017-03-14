From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/6] bus: add driver for the Technologic Systems NBUS
Date: Tue, 14 Mar 2017 14:23:57 +0100
Message-ID: <CACRpkdbjANV+kiO_W9+=OL=fzPtTVwH2CpWDmNa50t3JaHTFkQ@mail.gmail.com>
References: <20170203194729.20995-1-sebastien.bourdelin@savoirfairelinux.com>
 <20170203194729.20995-5-sebastien.bourdelin@savoirfairelinux.com>
 <CACRpkdYfGmVBYgAc4KZGN6634WM_EyzNj_SBbALEs4WYipXRQA@mail.gmail.com> <82dfdbb8-58fc-45b4-685c-98be11341e45@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <82dfdbb8-58fc-45b4-685c-98be11341e45-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastien Bourdelin <sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel <kernel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Mark Featherston <mark-L1vi/lXTdtvnC/t2CciAbw@public.gmane.org>, kris-L1vi/lXTdtvnC/t2CciAbw@public.gmane.org, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>Mark
List-Id: devicetree@vger.kernel.org

On Wed, Feb 22, 2017 at 5:56 PM, Sebastien Bourdelin
<sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org> wrote:
> On 02/04/2017 05:14 AM, Linus Walleij wrote:

>>> +       gpiod_set_array_value_cansleep(gpios->ndescs, gpios->desc, values);
>>
>> This can also fail and you should check the return code and print an error
>> message if it does.
>>
> As far as i understood, the "gpiod_set_array_value_cansleep(...)"
> function doesn't return
> anything, it will return immediately if gpios->desc is null but nothing
> else.
> Did i miss something?

No I did, sorry about that.

We *should* make these functions return errors but currently they do not.

>> Error codes?
>>
> Same question here, these functions only make call to
> "gpiod_set_value_cansleep(...)",
> which as far as i understood doesn't return any error code.

Yeah, forget that.

>>> +               gpiod_set_value_cansleep(ts_nbus->csn, 1);
>>
>> Here too.
>>
> Same question, doesn't seem to have an error code.

That too.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
