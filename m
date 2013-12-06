From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] mfd: cros ec: spi: Add delay for raising CS
Date: Fri, 6 Dec 2013 13:12:41 -0800
Message-ID: <CAL1qeaHGNUGCNRUa7GGMnpbkJG9rrD-2V_X7Mi664i8NPssKqQ@mail.gmail.com>
References: <1385143550-31901-1-git-send-email-treding@nvidia.com>
	<20131125094503.GD17722@lee--X1>
	<20131125100428.GG22043@ulmo.nvidia.com>
	<20131125104532.GF17722@lee--X1>
	<20131125112852.GK22043@ulmo.nvidia.com>
	<20131125121035.GG17722@lee--X1>
	<20131206210244.GA1280@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131206210244.GA1280@mithrandir>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Bernie Thompson <bhthompson-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> Bernie, Andrew, Rhyland, can anyone of you comment. Are you aware of
> this driver being used with a non-DT setup? I suspect maybe on Intel
> Chromebooks it might be, but I couldn't find any evidence of that in
> the upstream kernel.

I'm not aware of any non-DT Chromebooks that use this driver.  The
Intel ones are non-DT, but they don't use SPI.

> Are there any objections to removing non-DT support from the driver?

Seems fine to me.

Thanks,
Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
