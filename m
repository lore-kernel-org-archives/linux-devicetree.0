From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 00/13] arm64: Allwinner A64 support based on sunxi-ng
Date: Mon, 1 Aug 2016 14:00:12 +0200
Message-ID: <20160801140012.41b8609b69faa1fe1d7d2a4a@free.fr>
References: <20160726203041.29366-1-maxime.ripard@free-electrons.com>
	<fb559224-561c-3476-1146-96f7aea427f0@arm.com>
	<20160801103024.cc74c093466d7fdfd91a2587@free.fr>
	<CAGb2v67+1rG1kj+7cGO=TMwSgpktP4xMAeZ9Zfy8PRWXyRLi+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGb2v67+1rG1kj+7cGO=TMwSgpktP4xMAeZ9Zfy8PRWXyRLi+g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: =?ISO-8859-1?Q?Andr=E9?= Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 1 Aug 2016 17:13:34 +0800
Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:

> > But I don't see why you are keeping the simple-gates. The bus gate may
> > be ungated/gated when the clock is enabled/disabled, and that's what
> > Allwinner's software does.
> 
> For peripherals that have a separate mod clock, having them separate
> is a good thing. One example might be the audio codecs. You could ungate
> the bus gate to access its registers to program it, but only enable
> the mod clock when you actually play something.

The roles of the bus gate and the clock gate are the same. I don't see
any reason to set one gate without setting the other one. More, the
spec says what the bus gate must be enabled before the clock gate (and
reverse order while disabling). So, setting both gates in one function
call seems safer.

Then, if you want to save some power while not playing anything, just do
clk_disable() of the (main and only) i2s clock.

-- 
Ken ar c'hentañ	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
