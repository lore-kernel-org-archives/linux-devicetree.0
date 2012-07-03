From: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/4] usb: chipidea: ci13xxx-imx: add "dr_mode" property
 to device tree bindings
Date: Tue, 3 Jul 2012 10:22:37 +0800
Message-ID: <CAL411-oeVCsRxxHHWM4VEtbXBTK_Poyxtp0AK7K_4jEg8U1fJA@mail.gmail.com>
References: <1340891629-13145-1-git-send-email-mkl@pengutronix.de>
 <1340891629-13145-4-git-send-email-mkl@pengutronix.de> <20120629014352.GA28923@b20223-02.ap.freescale.net>
 <4FED5D77.3050009@pengutronix.de> <20120629084509.GB28923@b20223-02.ap.freescale.net>
 <4FEDCF15.9040000@wwwdotorg.org> <20120630011906.GA2489@richard-laptop> <4FF1FEBC.3040107@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FF1FEBC.3040107-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Richard Zhao <linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, Devicetree Discussions <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Hmm. I think it'd be reasonable to use dr_mode like the other bindings,
> and have the default case be decided by the ID pin when dr_mode isn't
> specified. Having different defaults for different bindings seems pretty
> reasonable to me.

As far as I know, there is no USB Spec says the ID value should be
used at device or host mode. At USB device and host driver, there
should be NO ID related things, that is to say device or host driver
should not care ID is grounded or floated, as ID may be grounded
at device mode, and high at host mode for different board design.
ID interrupt should only be enabled when dr_mode = otg;

Board design and customized usage (user may want to use only device mode
for otg capable port) makes what USB role will be used
at driver, so dr_mode at dts (or pdata->dr_mode at non-dt solution) can make
the decision for driver how USB role will be used.

Marc's patch is almost OK, but better use below logic at core.c:
If there is no dr_mode, it is better to indicate an error message and
quit probe.

> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
