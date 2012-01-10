From: Dong Aisheng-B29396 <B29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [RFC PATCH v3 2/5] pinctrl: add dt binding support for pinmux
 mappings
Date: Tue, 10 Jan 2012 07:02:24 +0000
Message-ID: <7FE21149F4667147B645348EC605788508AB04@039-SN2MPN1-013.039d.mgd.msft.net>
References: <1324402840-32451-1-git-send-email-b29396@freescale.com>
 <1324402840-32451-3-git-send-email-b29396@freescale.com>
 <74CDBE0F657A3D45AFBB94109FB122FF176BE92F00@HQMAIL01.nvidia.com>
 <7FE21149F4667147B645348EC6057885075542@039-SN2MPN1-013.039d.mgd.msft.net>
 <74CDBE0F657A3D45AFBB94109FB122FF176CC743EF@HQMAIL01.nvidia.com>
 <7FE21149F4667147B645348EC6057885077F82@039-SN2MPN1-013.039d.mgd.msft.net>
 <74CDBE0F657A3D45AFBB94109FB122FF17761F1887@HQMAIL01.nvidia.com>
 <7FE21149F4667147B645348EC605788507F615@039-SN2MPN1-013.039d.mgd.msft.net>
 <74CDBE0F657A3D45AFBB94109FB122FF177EE39E40@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF177EE39E40-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org" <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org" <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Stephen Warren [mailto:swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org]
> Sent: Saturday, January 07, 2012 1:24 AM
> To: Dong Aisheng-B29396; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org; s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org;
> rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org;
> kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org; cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Subject: RE: [RFC PATCH v3 2/5] pinctrl: add dt binding support for pinmux
> mappings
> Importance: High
> 
> Dong Aisheng-B29396 wrote at Friday, January 06, 2012 3:51 AM:
> > Stephen Warren wrote at Friday, January 06, 2012 7:38 AM:
> > > Dong Aisheng-B29396 wrote at Tuesday, December 27, 2011 7:41 AM:
> ...
> > > > But what about the pin maps without device associated?
> > >
> > > Indeed; that's why I'd tend towards defining a table of pinmux usage
> > > in the pinmux node, and having other devices refer to that table.
> >
> > Currently we still prefer to use device node relationship to reflect
> > the pinmux map if we can since as you said pinmux map is little
> > depending on the pinctrl subsystem implementation.
> > And I'm trying to do it now.
> >
> > > Still, if the pinmux definitions are in the device nodes, we could
> > > simply make the pinmux controller have such a definition itself too, for the
> "system hog"
> > > case.
> >
> > Yes, that way I think is like:
> > iomuxc@020e0000 {
> >         pinctrl_uart4: uart4 {
> >                 grp-pins = <107 108>;
> >                 grp-mux = <4 4>;
> > 		   hog_on_boot;
> >         };
> > }
> 
> If pinmux usage is defined in each individual device node,
Per my understanding a phandle to the pinmux usage defined in iomuxc node
Is also ok.
The next, you also pointed out before, we need to find a at least semi-standardized
per-device "pinmux" property which is suitable for all platforms.

> and the "hog"
> setup is included in the pinmux controller's own device node, then there's no
> need for a "hog_on_boot" property; any pinmux setup node that's inside the
> pinmux controller node would automatically be a "hog" entry, and could be
> activated as soon as the pinmux controller was probed and registered with the
> pinctrl subsystem.
> 
+1
I think this is a right solution for dt without a pinmux map.

> (as a minor nit, DT usually uses - not _ in property names, so that would be
> "hog-on-boot").
> 
> --
> nvpublic
> 
