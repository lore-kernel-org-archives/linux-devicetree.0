From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 4/4] clk: mediatek: Add USB clock support in MT8173
 APMIXEDSYS
Date: Fri, 3 Jul 2015 13:38:47 +0800
Message-ID: <1435901927.3526.48.camel@mtksdaap41>
References: <1435633127-31952-1-git-send-email-jamesjj.liao@mediatek.com>
	 <1435633127-31952-5-git-send-email-jamesjj.liao@mediatek.com>
	 <CAGS+omBRAJVN3uPYn9YdKZ3VBj61c-rpY_cNgnK6x9U0uJBPYw@mail.gmail.com>
	 <CAGS+omBsu3zkBf0C_QECBP7NShFhkMih36z1vynvVQ5wCLfZ8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGS+omBsu3zkBf0C_QECBP7NShFhkMih36z1vynvVQ5wCLfZ8w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On Wed, 2015-07-01 at 23:22 +0800, Daniel Kurtz wrote:
> This looks like 3 separate gate clocks in a chain, with a timing
> constraint: USB_LPF must be enabled 100 us after USB_TX.
> 
>   26MHz--> [GATE] --USB_TX--> [LPF] --USB_LPF--> [GATE] --USB_OUT-->
>             ^                  ^                  ^
>             +--------------+   |                  |
> AP_PLL_CON2.REF2USB_TX_EN -+   |                  |
> AP_PLL_CON2.REF2USB_TX_LPF_EN -+                  |
> AP_PLL_CON2.REF2USB_TX_OUT_EN --------------------+
> 
> 
> I think we can model the gate parts using a proper clock tree model
> and the existing clock gate semantics.
> I'm not sure the best way to model the delay; but in theory that could
> be handled by the clock user (USB driver).

Do you mean to create 3 hierarchical clocks (may be clock gates) to
model these clocks as the following ?

EN -- LPF -- OUT_EN

(EN is the parent of LPF, and LPF is the parent of EN)

If we model these 3 clocks like above, we can't prevent clock users to
enable OUT_EN directly, and there will be no delay between EN and LPF.

Or you have other suggestions to model these 3 clcoks?


Best regards,

James

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
