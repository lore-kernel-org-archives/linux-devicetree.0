From: Mohit KUMAR DCG <Mohit.KUMAR-qxv4g6HH51o@public.gmane.org>
Subject: RE: [PATCH V6 03/12] phy: st-miphy40lp: Add binding information
Date: Thu, 13 Feb 2014 13:19:11 +0800
Message-ID: <2CC2A0A4A178534D93D5159BF3BCB66189FD2CAFB1@EAPEX1MAIL1.st.com>
References: <cover.1392109054.git.mohit.kumar@st.com>
 <af50da74226a244dfc05aed3dc9d28b896d166a4.1392109054.git.mohit.kumar@st.com>
 <20140212182012.GC23630@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140212182012.GC23630-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, Pratyush ANAND <pratyush.anand-qxv4g6HH51o@public.gmane.org>, Viresh Kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Mark,

> -----Original Message-----
> From: Mark Rutland [mailto:mark.rutland-5wv7dgnIgG8@public.gmane.org]
> Sent: Wednesday, February 12, 2014 11:50 PM
> To: Mohit KUMAR DCG
> Cc: arnd-r2nGTMty4D4@public.gmane.org; Pratyush ANAND; Viresh Kumar; Kishon Vijay Abraham I;
> spear-devel; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [PATCH V6 03/12] phy: st-miphy40lp: Add binding information
> 
> On Tue, Feb 11, 2014 at 09:29:59AM +0000, Mohit Kumar wrote:
> > From: Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>
> >
> > ST miphy40lp can be used with PCIe, SATA and Super Speed USB
> > controllers. SPEAr13XX SoCs use this phy for PCIe and SATA.
> >
> > Signed-off-by: Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>
> > Cc: Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>
> > Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > Cc: Viresh Kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
> > Cc: spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > ---
> >  .../devicetree/bindings/phy/st-miphy40lp.txt       |   18
> ++++++++++++++++++
> >  1 files changed, 18 insertions(+), 0 deletions(-)  create mode 100644
> > Documentation/devicetree/bindings/phy/st-miphy40lp.txt
> >
> > diff --git a/Documentation/devicetree/bindings/phy/st-miphy40lp.txt
> > b/Documentation/devicetree/bindings/phy/st-miphy40lp.txt
> > new file mode 100644
> > index 0000000..1c8d04c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/st-miphy40lp.txt
> > @@ -0,0 +1,18 @@
> > +ST miphy40lp DT detail
> > +===================================
> > +
> > +miphy40lp is a phy controller from ST Microelectronics which supports
> > +PCIe, SATA and Super Speed USB host and devices. It has been used in
> SPEAr13xx SOCs.
> > +
> > +Required properties:
> > +- compatible : should be "st,miphy40lp-phy"
> > +	Other supported soc specific compatible:
> > +		"st,spear1310-miphy"
> > +		"st,spear1340-miphy"
> > +- reg : offset and length of the PHY register set.
> > +- misc: phandle for the syscon node to access misc registers
> 
> This is very vague. What is this used for?

- These are Spear SoC specific miscellaneous registers. Here these are used for
to configure sata/pcie  aux clock.
> 
> > +- phy-id: Instance id of the phy.
> > +- #phy-cells : from the generic PHY bindings, must be 1.
> > +	- 1st cell: phandle to the phy node.
> > +	- 2nd cell: 0 if phy (in 1st cell) is to be used for SATA, 1 for PCIe
> > +	  and 2 for Super Speed USB.
> 
> One cell or two?

- No of cells are two, is this the question?

Thanks
Mohit
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
