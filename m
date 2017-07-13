From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC v2 5/6] drivers: boot_constraint: Add initial DT bindings
Date: Thu, 13 Jul 2017 10:39:34 +0530
Message-ID: <20170713050934.GB352@vireshk-i7>
References: <cover.1499770771.git.viresh.kumar@linaro.org>
 <0610277aef9830cff53b7b53cf41cc54886fdc7f.1499770771.git.viresh.kumar@linaro.org>
 <CAL_Jsq+oAB3gejRMXuY0q9+Et4GrtvF3RwGzPNJ08TPooVyXJg@mail.gmail.com>
 <CAGb2v67XtUcqdjMt-Ln6zn3ShH4JFmjkK4bPSpUNZpJqnmwivw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v67XtUcqdjMt-Ln6zn3ShH4JFmjkK4bPSpUNZpJqnmwivw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rajendra Nayak <rnayak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Shiraz Hashim <shashim-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 13-07-17, 10:52, Chen-Yu Tsai wrote:
> I'm afraid the regulator case still doesn't make sense. The voltage
> constraints should be set within each supplies device node. This was
> explained in the discussion in v1 [1].

I thought we were discussing about something I mentioned in one of my example
but never to a point that the regulator problem doesn't exist at all. Perhaps I
misunderstood your concerns. Anyway, lemme try once more with a better example.

Regulator shared by: LCD and MMC (both can do DVFS) and the min/max constraint
that can be set by the consumers of the regulator (both LCD/MMC) are: 1.5 V to
3 V.

The bootloader has programmed the LCD to work at the highest pixel frequency,
which needs the voltage to be in range from 2.5 - 3 V.

Now MMC can get probed first and it can try to bring the voltages below 2.5 V.
Though, 1.5 - 2.5 is a valid range for the LCD, but not at the current pixel
frequency.

Does that sound like a valid problem?

-- 
viresh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
