From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/2] drivercore: Fix unregistration path of platform
 devices
Date: Tue, 16 Jun 2015 00:58:10 -0700
Message-ID: <20150616075809.GD2740@atomide.com>
References: <1433686811-12303-1-git-send-email-grant.likely@linaro.org>
 <1433686811-12303-3-git-send-email-grant.likely@linaro.org>
 <CAPybu_30jTDuwEW_WTGuu6pWwv86p6OqV0eRE1GbCwUVtBm7KA@mail.gmail.com>
 <20150608184713.446B7C406AA@trevor.secretlab.ca>
 <CAPybu_0FfD9dv55SLmy7905yMCV6Kqrr-v2aPUCx6sSikrF7gQ@mail.gmail.com>
 <20150609110044.61031C40580@trevor.secretlab.ca>
 <CAMAWPa_CURGm5YTc0OgBD_T3fwaBDskfUKEn+awxW8P6oQYceA@mail.gmail.com>
 <CAPybu_24X0zZJv6D9i4YM_r7azdnjYrRH=V+p_ong2cFKNrF1w@mail.gmail.com>
 <CAL_Jsq+RyuiYszWSGF-XSL_fqKNWpR0VjFkJMdnW2QuaKNT-AA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+RyuiYszWSGF-XSL_fqKNWpR0VjFkJMdnW2QuaKNT-AA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

* Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> [150610 07:06]:
> 
> I've looked at some of the failures. Armada 370 looks normal AFAICT,
> but the network device evidently does not probe. i.MX6 has no log, but
> IIRC it is what failed previously on Grant's last attempt. For OMAP4,
> I found the overlapping region here:
> 
>                         omap4_padconf_core: scm@100000 {
>                                 compatible = "ti,omap4-scm-padconf-core",
>                                              "simple-bus";
>                                 #address-cells = <1>;
>                                 #size-cells = <1>;
>                                 ranges = <0 0x100000 0x1000>;
> 
>                                 omap4_pmx_core: pinmux@40 {
>                                         compatible = "ti,omap4-padconf",
>                                                      "pinctrl-single";
>                                         reg = <0x40 0x0196>;
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
>                                         #interrupt-cells = <1>;
>                                         interrupt-controller;
>                                         pinctrl-single,register-width = <16>;
>                                         pinctrl-single,function-mask = <0x7fff>;
>                                 };
> 
>                                 omap4_padconf_global: omap4_padconf_global@5a0 {
>                                         compatible = "syscon";
>                                         reg = <0x5a0 0x170>;
>                                         #address-cells = <1>;
>                                         #size-cells = <1>;
> 
>                                         pbias_regulator: pbias_regulator {
>                                                 compatible = "ti,pbias-omap";
>                                                 reg = <0x60 0x4>;
> 
> 0x60 is within the pinmux range of 0x40-0x1d6.
> 
> But why is the regulator a sub node here instead of omap4_pmx_core?

I don't think the reg entry is in use here as the pbias_regulator uses
syscon_regmap_lookup_by_phandle via syscon.
 
>                                                 syscon =
> <&omap4_padconf_global>;
> 
> This seems to indicate that 0x60 is supposed to be an offset from
> 0x5a0. That would require a ranges property in the parent. Is this an
> error?

Yeah we should add ranges to padconf_global so drivers not using syscon
can just do of_ioremap for a dedicated range of registers within the
padconf_global. That area has things like PHYs, regulators and clocks.

Regards,

Tony
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
