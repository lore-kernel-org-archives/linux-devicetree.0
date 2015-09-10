From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 1/2] fsl: Add binding for RCPM
Date: Thu, 10 Sep 2015 11:46:55 -0500
Message-ID: <1441903615.2909.0.camel@freescale.com>
References: <1441780967-30879-1-git-send-email-dongsheng.wang@freescale.com>
	 <1441828599.29081.36.camel@freescale.com>
	 <SN1PR0301MB16165F9EE9B7CE08A3BA68299D510@SN1PR0301MB1616.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <SN1PR0301MB16165F9EE9B7CE08A3BA68299D510-VLIetriUNobRRq1t3zq48ZwN6zqB+hSMnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wang Dongsheng-B40534 <Dongsheng.Wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jin Zhengxiong-R64188 <Jason.Jin-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Zhao Chenhui-B35336 <chenhui.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Tang Yuantian-B29983 <Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Wang Huan-B18965 <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2015-09-09 at 21:03 -0500, Wang Dongsheng-B40534 wrote:
> Hi Scott,
> 
> Thanks for your review.
> 
> > -----Original Message-----
> > From: Wood Scott-B07421
> > Sent: Thursday, September 10, 2015 3:57 AM
> > To: Wang Dongsheng-B40534
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; Jin 
> > Zhengxiong-
> > R64188; Zhao Chenhui-B35336; Tang Yuantian-B29983; Wang Huan-B18965;
> > robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > Subject: Re: [PATCH 1/2] fsl: Add binding for RCPM
> > 
> > On Wed, 2015-09-09 at 14:42 +0800, Dongsheng Wang wrote:
> > > From: Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > 
> > > RCPM is the Run Control and Power Management module performs all
> > > device-level tasks associated with device run control and power
> > > management.
> > > 
> > > Add this for freescale powerpc platform and layerscape platform.
> > > 
> > > Signed-off-by: Chenhui Zhao <chenhui.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > Signed-off-by: Tang Yuantian <Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > Signed-off-by: Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > 
> > > diff --git a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > new file mode 100644
> > > index 0000000..284070c
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > @@ -0,0 +1,64 @@
> > > +* Run Control and Power Management
> > > +-------------------------------------------
> > > +The RCPM performs all device-level tasks associated with device run 
> > > control
> > > +and power management.
> > > +
> > > +Required properites:
> > > +  - reg : Offset and length of the register set of RCPM block.
> > > +  - compatible : Sould contain a chip-specific RCPM block compatible 
> > > string
> > > +     and (if applicable) may contain a chassis-version RCPM compatible 
> > > string.
> > > +     Chip-specific strings are of the form "fsl,<chip>-rcpm", such as:
> > > +     * "fsl,p2041-rcpm"
> > > +     * "fsl,p3041-rcpm"
> > > +     * "fsl,p4080-rcpm"
> > > +     * "fsl,p5020-rcpm"
> > > +     * "fsl,p5040-rcpm"
> > > +     * "fsl,t4240-rcpm"
> > > +     * "fsl,b4420-rcpm"
> > > +     * "fsl,b4860-rcpm"
> > > +
> > > +     Chassis-version strings are of the form "fsl,qoriq-rcpm-
> > > <version>",
> > > +     such as:
> > > +     * "fsl,qoriq-rcpm-1.0": for chassis 1.0 rcpm
> > > +     * "fsl,qoriq-rcpm-2.0": for chassis 2.0 rcpm
> > > +     * "fsl,qoriq-rcpm-2.1": for chassis 2.1 rcpm
> > > +
> > > +All references to "1.0" and "2.0" refer to the QorIQ chassis version to
> > > +which the chip complies.
> > > +Chassis Version              Example Chips
> > > +---------------              -------------------------------
> > > +1.0                          p4080, p5020, p5040, p2041, p3041
> > > +2.0                          t4240, b4860, b4420
> > > +2.1                          t1040, ls1021
> > > +
> > > +Example:
> > > +The RCPM node for T4240:
> > > +     rcpm:  global-utilities@e2000{
> > > +             compatible = "fsl,t4240-rcpm", "fsl,qoriq-rcpm-2.0";
> > > +             reg = <0xe2000 0x1000>;
> > > +     };
> > > +
> > > +The RCPM node for P4080:
> > > +     rcpm:  global-utilities@e2000{
> > > +             compatible = "fsl,qoriq-rcpm-1.0";
> > > +             reg = <0xe2000 0x1000>;
> > > +     };
> > 
> > I would avoid putting the p4080 example in the binding, as we don't want 
> > to
> > make it look like it's OK to leave out the specific chip compatible.
> > 
> 
> Fine, I will add the specific chip compatible in this example.
> compatible = "fsl,p4080-rcpm", "fsl,qoriq-rcpm-1.0";

Just drop that example.

> > > +* Freescale RCPM Wakeup Source Device Tree Bindings
> > > +-------------------------------------------
> > > +Required rcpm-wakeup property should be added to a device node if the
> > > device
> > > +can be used as a wakeup source.
> > > +
> > > +  - rcpm-wakeup: should contain a pointer to the rcpm node and the
> > > +     corresponding bit of device in the register.
> > 
> > The corresponding bit in *what* register?
> > 
> 
> RCPM_IPPDEXPCRx register, I will add a explain to this.

How do you encode which "x" it is?

-Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
