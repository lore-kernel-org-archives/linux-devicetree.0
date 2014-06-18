From: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Subject: Re: [PATCH v3 1/3] soc: devicetree: bindings: Add Qualcomm RPM DT binding
Date: Tue, 17 Jun 2014 22:19:58 -0700
Message-ID: <CAJAp7Oi6gqbrVOBnB8YvpR7YtQ_DDdWOAYeEU2j2Mt_=FboNoA@mail.gmail.com>
References: <1402944372-31901-1-git-send-email-bjorn.andersson@sonymobile.com>
	<1402944372-31901-2-git-send-email-bjorn.andersson@sonymobile.com>
	<53A0D651.20605@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53A0D651.20605-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 17, 2014 at 4:59 PM, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
[...]
>
> because ipc is actually a register inside the Krait complex's global
> clock control/distribution hardware block (it's located at 0x2011000).
> From what I can tell, this is the only non-clock/power register inside
> there. I plan to send out a driver for this hardware block so that I can
> switch the L2 aux source mux over to PLL8 instead of PXO (done with a
> single register write to 0x2011028) and this mapping/use here is going
> to conflict with that unless I only map the single register like is done
> here.
>
> I wonder if we'd be better off making this region a separate node and
> having some phandle to it here in the RPM node? That way we have a
> driver that provides a clock and some IPC handle the RPM driver can get.
> The SMD driver also uses the same register to kick other processors so
> having some generic IPC handle may be useful there too.

Thanks Stephen,

I never connected the dots here but now that I found the right pieces of
documentation I can only agree with you. This would better be some sort of
reverse interrupt chip.

Another such use case would be the smsm and smp2p, which in the codeaurora tree
are modelled with a custom "state change" api and as gpios respectively. Both
of these seems like they should better just be modelled as incoming virtual
interrupts and then some sort of outgoing "interrupts" or "signals".

Maybe I'm over optimistic regarding the reusability here, but I definitely
agree with you that having a "ipc = <&apcs 0>;" does look like a better
solution.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
