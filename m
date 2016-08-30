From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/1] arm64: Add DTS support for FSL's LS1012A SoC
Date: Tue, 30 Aug 2016 20:02:20 +0800
Message-ID: <20160830120220.GC8363@tiger>
References: <1472207241-18461-1-git-send-email-Bhaskar.Upadhaya@nxp.com>
 <20160829095239.GM30790@tiger>
 <1472493061.13245.39.camel@buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472493061.13245.39.camel-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Cc: Bhaskar Upadhaya <Bhaskar.Upadhaya-3arQi8VN3Tc@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pratiyush Mohan Srivastava <pratiyush.srivastava-3arQi8VN3Tc@public.gmane.org>, stuart.yoder-3arQi8VN3Tc@public.gmane.org, Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>, linux-devel-XDVM779Km55Y1YpKYGMr2+TW4wlIGRCZ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 29, 2016 at 12:51:01PM -0500, Scott Wood wrote:
> On Mon, 2016-08-29 at 17:52 +0800, Shawn Guo wrote:
> > On Fri, Aug 26, 2016 at 03:57:21PM +0530, Bhaskar Upadhaya wrote:
> > > 
> > > +		clockgen: clocking@1ee1000 {
> > > +			compatible = "fsl,ls1012a-clockgen";
> > The compatible cannot be found in binding docs.
> 
> From Documentation/devicetree/bindings/clock/qoriq-clock.txt:
> 
> - compatible: Should contain a chip-specific clock block compatible
>         string and (if applicable) may contain a chassis-version clock
>         compatible string.
> 
>         Chip-specific strings are of the form "fsl,<chip>-clockgen", such as:
>         * "fsl,p2041-clockgen"
>         * "fsl,p3041-clockgen"
>         * "fsl,p4080-clockgen"
>         * "fsl,p5020-clockgen"
>         * "fsl,p5040-clockgen"
>         * "fsl,t4240-clockgen"
>         * "fsl,b4420-clockgen"
>         * "fsl,b4860-clockgen"
>         * "fsl,ls1021a-clockgen"
>         Chassis-version clock strings include:
>         * "fsl,qoriq-clockgen-1.0": for chassis 1.0 clocks
>         * "fsl,qoriq-clockgen-2.0": for chassis 2.0 clocks
> 
> I really hope we don't have to update every single fsl,<chip>-whatever binding
> every time a new chip comes out.  There are already other chips not listed,
> FWIW (e.g. t1040, t2080, ls1043a, and ls2080a).  That's why it says "such as".

If I remember correctly, DT maintainers want every supported compatible
string explicitly listed in bindings doc.  And they even added a check
into checkpatch.pl with commit bff5da433525 ("checkpatch: add DT
compatible string documentation checks").

> 
> > > +		scfg: scfg@1570000 {
> > > +			compatible = "fsl,ls1012a-scfg", "syscon";
> > Ditto
> > 
> > > 
> > > +			reg = <0x0 0x1570000 0x0 0x10000>;
> > > +			big-endian;
> > > +		};
> > > +
> > > +		dcfg: dcfg@1ee0000 {
> > > +			compatible = "fsl,ls1012a-dcfg",
> > > +				     "fsl,ls1043a-dcfg",
> > If these compatibles are not documented or used, we can drop them?  I
> > guess we only need "syscon" to get it work?
> 
> If you only have "syscon" then how to do the users of the node properly know
> what register set they're dealing with?  "syscon" should not be the only
> compatible on a node.

Okay, I assumed that a single user only need to deal with one particular
version of "dcfg" block, and the register set should be fixed.  It seems
that's not always the case.  But at least, "fsl,ls1043a-dcfg" can be
dropped here?

> > > +
> > > +		rcpm: rcpm@1ee2000 {
> > > +			compatible = "fsl,ls1012a-rcpm";
> > Undocumented/unsupported bindings?
> 
> Documentation/devicetree/bindings/soc/fsl/rcpm.txt

I failed to grep the string in both bindings and drivers folder, so
thought this is an undocumented/unsupported compatible.

> 
> > > +		tmu: tmu@1f00000 {
> > > +			compatible = "fsl,ls1012a-tmu", "fsl,qoriq-tmu";
> > > +			reg = <0x0 0x1f00000 0x0 0x10000>;
> > > +			interrupts = <0 33 0x4>;
> > > +			fsl,tmu-range = <0xb0000 0x9002a 0x6004c
> > > 0x30062>;
> > > +			fsl,tmu-calibration = <0x00000000 0x00000026
> > > +					       0x00000001 0x0000002d
> > > +					       0x00000002 0x00000032
> > > +					       0x00000003 0x00000039
> > > +					       0x00000004 0x0000003f
> > > +					       0x00000005 0x00000046
> > > +					       0x00000006 0x0000004d
> > > +					       0x00000007 0x00000054
> > > +					       0x00000008 0x0000005a
> > > +					       0x00000009 0x00000061
> > > +					       0x0000000a 0x0000006a
> > > +					       0x0000000b 0x00000071
> > > +
> > Drop the newline.
> > 
> > > 
> > > +					       0x00010000 0x00000025
> > > +					       0x00010001 0x0000002c
> > > +					       0x00010002 0x00000035
> > > +					       0x00010003 0x0000003d
> > > +					       0x00010004 0x00000045
> > > +					       0x00010005 0x0000004e
> > > +					       0x00010006 0x00000057
> > > +					       0x00010007 0x00000061
> > > +					       0x00010008 0x0000006b
> > > +					       0x00010009 0x00000076
> > > +
> > Ditto
> 
> This is how other instances of this property are formatted -- is it so wrong
> to provide visual grouping?

Can we replace the newline with a single line comment to tell how they
are grouped?

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
