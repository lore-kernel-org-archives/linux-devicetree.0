From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 3/5] clk: add lpc18xx ccu clk driver
Date: Wed, 10 Jun 2015 16:02:59 +0200
Message-ID: <CAGhQ9VwONWTULGUbGuf_2HbLpfU4pp8S49xdtoCcKcm1p=n7hg@mail.gmail.com>
References: <1432845107-12458-1-git-send-email-manabian@gmail.com>
	<1432845107-12458-4-git-send-email-manabian@gmail.com>
	<20150610021315.6017.58085@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150610021315.6017.58085@quantum>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mike,


> Hi Joachim,
>
> If it were me, I would have broken this up into two tables, one for each
> CCU. In general I would structure the code to reflect the fact that two
> different IP blocks are being accessed. This isn't a deal breaker but I
> thought I would mention it in case you want to make the change.
>
> Otherwise this series looks good to me. Let me know if you plan a V5
> submission.

If there is still time for 4.2 and you don't have any more comments on
how the driver uses the DT bindings I would rather send a follow up
patch that splits the ccu table for 4.3.


> I can take patches #1-4 into the clk tree. Please add my Acked-by to
> patch #5. I will create an immutable branch to share with the arm-soc
> tree so that they can take #5 and have access to the dt-bindings
> headers.

Sounds good. I'll talk to arm-soc team about it. But it isn't critical
for me to get the DTS changes in for 4.2, but I would be very grateful
for getting the drivers and headers in for 4.2 so that 4.3 is ready
and doesn't have any header dependencies for all the driver DTS stuff.

Thanks, Mike.


regards,
Joachim Eastwood
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
