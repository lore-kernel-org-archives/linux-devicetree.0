From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 1/3] powerpc/dts: Factorize the clock control node
Date: Thu, 30 Oct 2014 18:21:37 -0500
Message-ID: <1414711297.23458.173.camel@snotra.buserror.net>
References: <1413988937-27885-1-git-send-email-Emilian.Medve@Freescale.com>
	 <1414538500.23458.125.camel@snotra.buserror.net>
	 <54524405.5090509@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54524405.5090509-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Cc: yuantian.tang-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2014-10-30 at 08:58 -0500, Emil Medve wrote:
> Hello Scott,
> 
> 
> On 10/28/2014 06:21 PM, Scott Wood wrote:
> > On Wed, 2014-10-22 at 09:42 -0500, Emil Medve wrote:
> >> Signed-off-by: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
> >> Change-Id: I25ce24a25862b4ca460164159867abefe00ccdd1
> > 
> > Please remove gerrit stuff prior to submitting.
> 
> I did remove the bulk of it. I wanted to keep the Change-Id so I can
> easily correlate the upstream patches with the sordid internal history.
> Seems the upstream history has enough instances of 'Change-Id' for this
> not to be an issue

OK...

> > I don't think the mux stuff belongs here, given that clockgen2.dtsi
> > doesn't have it, and I saw at least one clockgen1 user needing to
> > supplement this with more muxes.
> 
> The intent was to put here devices/nodes that are common per chassis
> from the low to high end. Specific SoC would change/augment this as
> appropriate. I could have put each node in its own file as we've done
> elsewhere, but I thought it would be too much
> 
> Yes, chassis v1 and v2 have differences, but that's not unexpected

It just strikes me as being an awkward split of where each mux node
goes.  Is it guaranteed by the chassis that all v1 will have at least
the first two muxes?

> >> @@ -1068,7 +1043,6 @@
> >>  			clocks = <&sysclk>;
> >>  			clock-output-names = "pll2", "pll2-div2", "pll2-div4";
> >>  		};
> >> -
> >>  		pll3: pll3@860 {
> >>  			#clock-cells = <1>;
> >>  			reg = <0x860 0x4>;
> >> @@ -1076,7 +1050,6 @@
> >>  			clocks = <&sysclk>;
> >>  			clock-output-names = "pll3", "pll3-div2", "pll3-div4";
> >>  		};
> >> -
> >>  		pll4: pll4@880 {
> >>  			#clock-cells = <1>;
> >>  			reg = <0x880 0x4>;
> > 
> > Why?
> 
> Why what?

Why are you removing all these blank lines?

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
