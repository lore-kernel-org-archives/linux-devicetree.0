From: Mohit KUMAR DCG <Mohit.KUMAR-qxv4g6HH51o@public.gmane.org>
Subject: RE: [PATCH V6 05/12] SPEAr: misc: Add binding information
Date: Thu, 13 Feb 2014 13:25:22 +0800
Message-ID: <2CC2A0A4A178534D93D5159BF3BCB66189FD2CAFB7@EAPEX1MAIL1.st.com>
References: <cover.1392109054.git.mohit.kumar@st.com>
 <bfddafffd103bef179fef717793bf94652742b85.1392109054.git.mohit.kumar@st.com>
 <20140212182101.GD23630@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140212182101.GD23630-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, Pratyush ANAND <pratyush.anand-qxv4g6HH51o@public.gmane.org>, Viresh Kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Mark,

> -----Original Message-----
> From: Mark Rutland [mailto:mark.rutland-5wv7dgnIgG8@public.gmane.org]
> Sent: Wednesday, February 12, 2014 11:51 PM
> To: Mohit KUMAR DCG
> Cc: arnd-r2nGTMty4D4@public.gmane.org; Pratyush ANAND; Viresh Kumar; spear-devel;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [PATCH V6 05/12] SPEAr: misc: Add binding information
> 
> On Tue, Feb 11, 2014 at 09:30:01AM +0000, Mohit Kumar wrote:
> > From: Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>
> >
> > SPEAr SOCs have some miscellaneous registers which are used to
> > configure few properties of different peripheral controllers.
> >
> > Signed-off-by: Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>
> > Cc: Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>
> > Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > Cc: Viresh Kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Cc: spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > ---
> >  .../devicetree/bindings/arm/spear-misc.txt         |    9 +++++++++
> >  1 files changed, 9 insertions(+), 0 deletions(-)  create mode 100644
> > Documentation/devicetree/bindings/arm/spear-misc.txt
> >
> > diff --git a/Documentation/devicetree/bindings/arm/spear-misc.txt
> > b/Documentation/devicetree/bindings/arm/spear-misc.txt
> > new file mode 100644
> > index 0000000..ab324e1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/spear-misc.txt
> > @@ -0,0 +1,9 @@
> > +SPEAr Misc configuration
> > +===========================
> > +SPEAr SOCs have some miscellaneous registers which are used to
> > +configure few properties of different peripheral controllers.
> > +
> > +misc node required properties:
> > +
> > +- compatible Should be	"st,spear1340-misc", "syscon".
> > +- reg: Address range of misc space
> 
> Is there no better name than misc?

- We followed the convention used in SoC for these Miscellaneous (system
 configuration) registers.

> How big is this expected to be?

- 8K, we will mention it in reg property also.

Thanks
Mohit
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
