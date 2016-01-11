From: Qiang Zhao <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH 3/6] QE: Add uqe_serial document to bindings
Date: Mon, 11 Jan 2016 08:19:10 +0000
Message-ID: <AM3PR04MB11854D17FFE6F43B19B4EDCE91C90@AM3PR04MB1185.eurprd04.prod.outlook.com>
References: <1452219494-31947-1-git-send-email-qiang.zhao@nxp.com>
 <1452219494-31947-3-git-send-email-qiang.zhao@nxp.com>
 <20160108201225.GA9813@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160108201225.GA9813@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org" <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 09, 2016 at 04:12AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> -----Original Message-----
> From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Saturday, January 09, 2016 4:12 AM
> To: Qiang Zhao <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linuxppc-
> dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org; oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org
> Subject: Re: [PATCH 3/6] QE: Add uqe_serial document to bindings
> 
> On Fri, Jan 08, 2016 at 10:18:11AM +0800, Zhao Qiang wrote:
> > Add uqe_serial document to
> > Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt
> >
> > Signed-off-by: Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
> > ---
> >  .../bindings/powerpc/fsl/cpm_qe/uqe_serial.txt       | 20
> ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt
> >
> > diff --git
> > a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt
> > b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt
> > new file mode 100644
> > index 0000000..e677599
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.
> > +++ txt
> > @@ -0,0 +1,20 @@
> > +* Serial
> > +
> > +Currently defined compatibles:
> > +- ucc_uart
> > +
> > +Properties for ucc_uart:
> > +device_type : which type the device is
> 
> Drop this please.

Yes, I will drop it in next version.

> 
> > +port-number : port number of UCC-UART
> 
> Use aliases instead.

I don't understand, can you explain more?

> 
> > +rx-clock-name : which clock QE use for RX tx-clock-name : which clock
> > +QE use for TX
> 
> These should use the clock binding.

This property means which clock source the UCC use, 
the QE just use this property to route UCC clock to clock source.
The clock source maybe either internal or outside(from clock input pin).
So clock binding is not apply in this case.

> 
> > +
> > +Example:
> > +
> > +	serial: ucc@2200 {
> > +		device_type = "serial";
> > +		compatible = "ucc_uart";
> > +		port-number = <1>;
> > +		rx-clock-name = "brg2";
> > +		tx-clock-name = "brg2";
> > +	};
> > --
> > 2.1.0.27.g96db324
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetree"
> > in the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org More majordomo
> > info at  http://vger.kernel.org/majordomo-info.html
Best Regards
Zhao Qiang
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
