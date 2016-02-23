From: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2 1/7] QE: Add IC, SI and SIRAM document to device tree
 bindings.
Date: Tue, 23 Feb 2016 14:20:12 -0600
Message-ID: <1456258812.5360.22.camel@buserror.net>
References: <1455757572-44955-1-git-send-email-qiang.zhao@nxp.com>
	 <20160223201520.GA3354@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160223201520.GA3354@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
Cc: leoyang.li-3arQi8VN3Tc@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2016-02-23 at 14:15 -0600, Rob Herring wrote:
> On Thu, Feb 18, 2016 at 09:06:06AM +0800, Zhao Qiang wrote:
> > Add IC, SI and SIRAM document of QE to
> > Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe.txt
> > 
> > Signed-off-by: Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
> > ---
> > Changes for v2
> > 	- Add interrupt-controller in Required properties
> > 	- delete address-cells and size-cells for qe-si and qe-siram
> > 
> >  .../devicetree/bindings/powerpc/fsl/cpm_qe/qe.txt  | 50
> > ++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe.txt
> > b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe.txt
> > index 4f89302..84052a7 100644
> > --- a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe.txt
> > +++ b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe.txt
> > @@ -69,6 +69,56 @@ Example:
> >  	};
> >       };
> >  
> > +* Interrupt Controller (IC)
> > +
> > +Required properties:
> > +- compatible : should be "fsl,qe-ic".
> 
> > +- compatible : should be "fsl,qe-si".
> 
> > +- compatible : should be "fsl,qe-siram".
> 
> These compatible strings are all a bit generic and should have SoC 
> specific compatible strings.

I don't know about si/siram, but "fsl,qe-ic" has been around since 2008, so it
should be documented even if a more specific compatible is also added.

-Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
