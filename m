From: Qiang Zhao <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH v3 3/7] QE: Add uqe_serial document to bindings
Date: Mon, 7 Mar 2016 02:35:28 +0000
Message-ID: <AM3PR04MB11852B62A075A980A246D2D091B10@AM3PR04MB1185.eurprd04.prod.outlook.com>
References: <1456816183-22340-1-git-send-email-qiang.zhao@nxp.com>
 <1456816183-22340-3-git-send-email-qiang.zhao@nxp.com>
 <20160305042536.GD13525@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160305042536.GD13525@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org" <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, Yang-Leo Li <leoyang.li-3arQi8VN3Tc@public.gmane.org>, Xiaobo Xie <xiaobo.xie-3arQi8VN3Tc@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 05, 2016 at 12:26PM, Rob Herring wrote:
> -----Original Message-----
> From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Saturday, March 05, 2016 12:26 PM
> To: Qiang Zhao <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
> Cc: oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org; Yang-Leo Li <leoyang.li-3arQi8VN3Tc@public.gmane.org>; Xiaobo Xie
> <xiaobo.xie-3arQi8VN3Tc@public.gmane.org>; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Subject: Re: [PATCH v3 3/7] QE: Add uqe_serial document to bindings
> 
> On Tue, Mar 01, 2016 at 03:09:39PM +0800, Zhao Qiang wrote:
> > Add uqe_serial document to
> > Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt
> >
> > Signed-off-by: Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
> > ---
> > Changes for v2
> > 	- modify tx/rx-clock-name specification Changes for v2
> > 	- NA
> >
> >  .../bindings/powerpc/fsl/cpm_qe/uqe_serial.txt        | 19
> +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt
> >
> > diff --git
> > a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt
> > b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt
> > new file mode 100644
> > index 0000000..436c71c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.
> > +++ txt
> > @@ -0,0 +1,19 @@
> > +* Serial
> > +
> > +Currently defined compatibles:
> > +- ucc_uart
> 
> I guess this is in use already and okay. However, looking at the driver there
> really should be SoC specific compatible strings here since the driver is looking
> up the SoC compatible string and composing the firmware filename from that.

Ok, I will changed both driver and this compatible.

> 
> > +
> > +Properties for ucc_uart:
> > +port-number : port number of UCC-UART tx/rx-clock-name : should be
> > +"brg1"-"brg16" for internal clock source,
> > +		   should be "clk1"-"clk28" for external clock source.
> > +
> > +Example:
> > +
> > +	ucc_serial: ucc@2200 {
> > +		device_type = "serial";
> 
> Drop device_type. It should only be used in a few legacy cases.
> 
> Looks like the driver is matching on this. Please drop it from the driver too. I'd
> leave dts files for now, but they should be updated too later.

Ok, Thank you for your Reviewing, I will drop it

> 
> > +		compatible = "ucc_uart";
> > +		port-number = <1>;
> > +		rx-clock-name = "brg2";
> > +		tx-clock-name = "brg2";
> > +	};
> > --
> > 2.1.0.27.g96db324
> >
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
