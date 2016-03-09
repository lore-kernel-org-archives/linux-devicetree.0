From: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v3 3/7] QE: Add uqe_serial document to bindings
Date: Tue, 08 Mar 2016 18:13:13 -0600
Message-ID: <1457482393.5360.115.camel@buserror.net>
References: <1456816183-22340-1-git-send-email-qiang.zhao@nxp.com>
	 <1456816183-22340-3-git-send-email-qiang.zhao@nxp.com>
	 <20160305042536.GD13525@rob-hp-laptop>
	 <AM3PR04MB11852B62A075A980A246D2D091B10@AM3PR04MB1185.eurprd04.prod.outlook.com>
	 <1457371686.5360.107.camel@buserror.net>
	 <AM3PR04MB1185D8F20D8D2763DB909B3791B20@AM3PR04MB1185.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AM3PR04MB1185D8F20D8D2763DB909B3791B20-f56W/S9L6NSBfqFqbnzQ1s9NdZoXdze2vxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Qiang Zhao <qiang.zhao-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Xiaobo Xie <xiaobo.xie-3arQi8VN3Tc@public.gmane.org>, Yang-Leo Li <leoyang.li-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2016-03-08 at 01:16 +0000, Qiang Zhao wrote:
> On Tue, Mar 08, 2016 at 1:28AM, Scott Wood wrote:
> > -----Original Message-----
> > From: Scott Wood [mailto:oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org]
> > Sent: Tuesday, March 08, 2016 1:28 AM
> > To: Qiang Zhao <qiang.zhao-3arQi8VN3Tc@public.gmane.org>; Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: Yang-Leo Li <leoyang.li-3arQi8VN3Tc@public.gmane.org>; Xiaobo Xie <xiaobo.xie-3arQi8VN3Tc@public.gmane.org>;
> > linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linuxppc-
> > dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> > Subject: Re: [PATCH v3 3/7] QE: Add uqe_serial document to bindings
> > 
> > On Mon, 2016-03-07 at 02:35 +0000, Qiang Zhao wrote:
> > > On Tue, Mar 05, 2016 at 12:26PM, Rob Herring wrote:
> > > > -----Original Message-----
> > > > From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> > > > Sent: Saturday, March 05, 2016 12:26 PM
> > > > To: Qiang Zhao <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
> > > > Cc: oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org; Yang-Leo Li <leoyang.li-3arQi8VN3Tc@public.gmane.org>; Xiaobo Xie
> > > > <xiaobo.xie-3arQi8VN3Tc@public.gmane.org>; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> > > > devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> > > > Subject: Re: [PATCH v3 3/7] QE: Add uqe_serial document to bindings
> > > > 
> > > > On Tue, Mar 01, 2016 at 03:09:39PM +0800, Zhao Qiang wrote:
> > > > > Add uqe_serial document to
> > > > > Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.tx
> > > > > t
> > > > > 
> > > > > Signed-off-by: Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
> > > > > ---
> > > > > Changes for v2
> > > > > 	- modify tx/rx-clock-name specification Changes for v2
> > > > > 	- NA
> > > > > 
> > > > >  .../bindings/powerpc/fsl/cpm_qe/uqe_serial.txt        | 19
> > > > +++++++++++++++++++
> > > > >  1 file changed, 19 insertions(+)
> > > > >  create mode 100644
> > > > > Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.tx
> > > > > t
> > > > > 
> > > > > diff --git
> > > > > a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.
> > > > > txt
> > > > > b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.
> > > > > txt
> > > > > new file mode 100644
> > > > > index 0000000..436c71c
> > > > > --- /dev/null
> > > > > +++
> > b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.
> > > > > +++ txt
> > > > > @@ -0,0 +1,19 @@
> > > > > +* Serial
> > > > > +
> > > > > +Currently defined compatibles:
> > > > > +- ucc_uart
> > > > 
> > > > I guess this is in use already and okay. However, looking at the
> > > > driver there really should be SoC specific compatible strings here
> > > > since the driver is looking up the SoC compatible string and
> > > > composing the firmware filename from that.
> > > 
> > > Ok, I will changed both driver and this compatible.
> > 
> > But don't break existing device trees while doing so.
> 
> Do I need to send driver patch in this patchset or a individual patch?

Doesn't matter.

-Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
