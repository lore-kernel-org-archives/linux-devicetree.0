From: Sebastien Bourdelin <sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH 4/6] bus: add driver for the Technologic Systems NBUS
Date: Wed, 1 Feb 2017 14:56:11 -0500
Message-ID: <7bc0871f-ac0a-e8a0-0c84-a0e61b3991a8@savoirfairelinux.com>
References: <20161214231237.17496-1-sebastien.bourdelin@savoirfairelinux.com>
 <20161214231237.17496-5-sebastien.bourdelin@savoirfairelinux.com>
 <CACRpkdYHHrYY-fAPnNmV94ejFJ36rhSF0SqSVHkTNq+YCRNNZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYHHrYY-fAPnNmV94ejFJ36rhSF0SqSVHkTNq+YCRNNZw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel <kernel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, mark-L1vi/lXTdtvnC/t2CciAbw@public.gmane.org, kris-L1vi/lXTdtvnC/t2CciAbw@public.gmane.org, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Thanks for your feedback.
I have a question regarding your recommendation, see below.

On 12/30/2016 02:58 AM, Linus Walleij wrote:

>> +
>> +static DEFINE_MUTEX(ts_nbus_lock);
>> +static bool ts_nbus_ready;
> 
> Why not move this to the struct ts_nbus state container?
> 
> It seems to be per-bus not per-system.
> 
>> +#define TS_NBUS_READ_MODE  0
>> +#define TS_NBUS_WRITE_MODE 1
>> +#define TS_NBUS_DIRECTION_IN  0
>> +#define TS_NBUS_DIRECTION_OUT 1
>> +#define TS_NBUS_WRITE_ADR 0
>> +#define TS_NBUS_WRITE_VAL 1
>> +
>> +struct ts_nbus {
>> +       struct pwm_device *pwm;
>> +       int num_data;
>> +       int *data;
>> +       int csn;
>> +       int txrx;
>> +       int strobe;
>> +       int ale;
>> +       int rdy;
>> +};
>> +
>> +static struct ts_nbus *ts_nbus;
> 
> Nopes. No singletons please.
> 
> Use the state container pattern:
> Documentation/driver-model/design-patterns.txt
> 

I understand the idea but have problem to find a good way to implement it.

Other drivers using the NBUS which are child nodes in the device tree
will use the ts_nbus_write() and ts_nbus_read() functions, it means these
drivers should have a pointer to the allocated ts_nbus and pass it to
the write() and read() functions as an argument if i'm not using a
singleton here.
But i'm lacking knowledge on how to properly share this pointer when
initializing the NBUS driver with the child nodes.

Perhaps my design is not appropriate for what i'm doing, if someone can
point me on a similar problematic it will be really helpful.

Best Regards,
Sebastien.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
