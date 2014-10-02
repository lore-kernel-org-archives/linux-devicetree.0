From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/3] edac: altera: Add Altera L2 Cache and OCRAM EDAC
 Support
Date: Thu, 2 Oct 2014 11:58:28 +0100
Message-ID: <20141002105828.GG5788@leverpostej>
References: <1412181092-27162-1-git-send-email-tthayer@opensource.altera.com>
 <1412181092-27162-3-git-send-email-tthayer@opensource.altera.com>
 <20141001165353.GB28440@leverpostej>
 <542C51BC.5050004@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <542C51BC.5050004-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: "dinh-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org" <dinh-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org" <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, "bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org" <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, "m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "tthayer.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <tthayer.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> >> +++ b/Documentation/devicetree/bindings/arm/altera/socfpga-l2-edac.txt
> >> @@ -0,0 +1,15 @@
> >> +Altera SoCFPGA L2 cache Error Detection and Correction [EDAC]
> >> +
> >> +Required Properties:
> >> +- compatible : Should be "altr,l2-edac"
> > That string looks too generic.
> >
> > Given the EDAC seems to be a portion of the L2, is there not already an
> > L2 binding?
> >
> > Just because Linux expects two drivers doesn't mean we should partition
> > the HW description this way.
> Thank you for the quick feedback.
> What should the string look like? I was trying to keep it short with the 
> altr, prefix but I don't mind changing it to something better.
> We're using the ARM PL310 L2 cache controller. The ECC is separate from 
> the PL310 IP and is part of the System Manager. This is true of ECC for 
> both the L2 and OCRAM.

Ah, I see. Apologies, I assumed that this was part of the L2C.

[...]

> >> diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-ocram-edac.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-ocram-edac.txt
> >> new file mode 100644
> >> index 0000000..31ab205
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/arm/altera/socfpga-ocram-edac.txt
> >> @@ -0,0 +1,16 @@
> >> +Altera SoCFPGA On-Chip RAM Error Detection and Correction [EDAC]
> >> +
> >> +OCRAM ECC Required Properties:
> >> +- compatible : Should be "altr,ocram-edac"
> >> +- reg : Address and size for ECC error interrupt clear registers.
> >> +- iram : phandle to On-Chip RAM definition.
> > Why not just describe this in the OCRAM node? Surely the register is
> > within the OCRAM controller?
> The ECC registers not in the OCRAM controller but they are in the System 
> Manager.  Maybe both the L2 cache and OCRAM ECC bindings should live 
> there and the device tree node for System Manager would have OCRAM and 
> L2 cache sub-nodes.

It certainly sounds like the ECC registers should be described as a
portion of the system manager somehow.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
