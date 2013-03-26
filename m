From: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v4 0/6] support other fsl SoCs with usbmisc + small fixes
Date: Tue, 26 Mar 2013 14:53:06 +0200
Message-ID: <87r4j2jpal.fsf@ashishki-desk.ger.corp.intel.com>
References: <1354033021-10585-1-git-send-email-m.grzeschik@pengutronix.de> <20121128025217.GC18593@nchen-desktop> <87ip6mor1e.fsf@ashishki-desk.ger.corp.intel.com> <CAOMZO5ArDLKDLEzhYc7EP2CNQGcT=vO7ctbiEsjzsGs+EaT7Dw@mail.gmail.com> <20130325162931.GB22810@pengutronix.de> <20130325173019.GA1992@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130325173019.GA1992-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> writes:

> Ugh, this is getting to be a horrible mess.
>
> Alexander, what is going on here?  You can't just constantly ignore
> patches, that's reserved for kernel developers with more experience :)

Long story short, I'm waiting for a coherent set of patches to arrive to
my inbox (I guess that's a fair expectation) for them to be included in
what I am going to send you on friday, if that's reasonable. I'll also
post my current stack of chipidea patches later today to sync with
everybody.

This email did bring to my attention 6 patches that I could have missed
otherwise. And these are the *only* patches from the abovementioned ones
that don't have unaddressed comments or obscure dependencies on other
patchsets and/or trees.

> If I don't hear back from you by Wednesday this week, with a specific
> plan for how to get all of these fixes to me by the end of this week,
> I'm going to assume that you are missing, and will just start taking
> chipidea patches directly myself, sorry.

For a long story, see my other email [1].

[1] http://marc.info/?l=linux-arm-kernel&m=136429960606655&w=2

Regards,
--
Alex
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
