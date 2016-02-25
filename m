From: Qiang Zhao <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH v2 3/7] QE: Add uqe_serial document to bindings
Date: Thu, 25 Feb 2016 04:44:44 +0000
Message-ID: <AM3PR04MB1185D43F4D2C5F9228DB99F591A60@AM3PR04MB1185.eurprd04.prod.outlook.com>
References: <1455757572-44955-1-git-send-email-qiang.zhao@nxp.com>
 <1455757572-44955-3-git-send-email-qiang.zhao@nxp.com>
 <20160223202342.GA9008@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160223202342.GA9008@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org" <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, Yang-Leo Li <leoyang.li-3arQi8VN3Tc@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Wed, Feb 24, 2016 at 04:24AM, Rob Herring wrote:
> -----Original Message-----
> From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Wednesday, February 24, 2016 4:24 AM
> To: Qiang Zhao <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
> Cc: oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org; Yang-Leo Li <leoyang.li-3arQi8VN3Tc@public.gmane.org>; linux-
> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linuxppc-
> dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Subject: Re: [PATCH v2 3/7] QE: Add uqe_serial document to bindings
> 
> On Thu, Feb 18, 2016 at 09:06:08AM +0800, Zhao Qiang wrote:
> > Add uqe_serial document to
> > Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt
> >
> > Signed-off-by: Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
> > ---
> > Changes for v2
> > 	- modify tx/rx-clock-name specification
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
> > +
> > +Properties for ucc_uart:
> > +port-number : port number of UCC-UART
> 
> How is this used?

It used for uart port index.

BR
-Zhao
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
