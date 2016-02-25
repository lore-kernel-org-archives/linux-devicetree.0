From: Qiang Zhao <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH v2 2/7] QE: Add ucc hdlc document to bindings
Date: Thu, 25 Feb 2016 04:37:55 +0000
Message-ID: <AM3PR04MB11854D515522ECD59E53513891A60@AM3PR04MB1185.eurprd04.prod.outlook.com>
References: <1455757572-44955-1-git-send-email-qiang.zhao@nxp.com>
 <1455757572-44955-2-git-send-email-qiang.zhao@nxp.com>
 <20160223202151.GA5326@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160223202151.GA5326@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org" <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, Yang-Leo Li <leoyang.li-3arQi8VN3Tc@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wen, Feb 24, 2016 at 04:22AM, Rob Herring wrote:
> -----Original Message-----
> From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Wednesday, February 24, 2016 4:22 AM
> To: Qiang Zhao <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
> Cc: oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org; Yang-Leo Li <leoyang.li-3arQi8VN3Tc@public.gmane.org>; linux-
> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linuxppc-
> dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Subject: Re: [PATCH v2 2/7] QE: Add ucc hdlc document to bindings
> 
> On Thu, Feb 18, 2016 at 09:06:07AM +0800, Zhao Qiang wrote:
> > Add ucc hdlc document to
> > Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/network.txt
> 
> Not a very useful description.

Could you give a example for me?

> 
> > Signed-off-by: Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
> > ---
> > Changes for v2
> > 	- use ucc-hdlc instead of ucc_hdlc
> > 	- add more information to properties.
> >
> >  .../bindings/powerpc/fsl/cpm_qe/network.txt        | 93
> ++++++++++++++++++++++
> >  1 file changed, 93 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/network.txt
> > b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/network.txt
> > index 29b28b8..936158c 100644
> > --- a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/network.txt
> > +++
> b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/network.txt
> > @@ -41,3 +41,96 @@ Example:
> >  		fsl,mdio-pin = <12>;
> >  		fsl,mdc-pin = <13>;
> >  	};
> > +
> > +* HDLC
> > +
> > +Currently defined compatibles:
> > +- fsl,ucc-hdlc
> > +
> > +Properties for fsl,ucc-hdlc:
> > +- rx-clock-name
> > +- tx-clock-name
> > +	Usage: required
> > +	Value type: <string>
> > +	Definition : should be "brg1"-"brg16" for internal clock source,
> > +		     should be "clk1"-"clk28" for external clock source.
> > +
> > +- fsl,rx-sync-clock
> > +	Usage: required
> > +	Value type: <string>
> > +	Definition : should be "none" when using internal clock source,
> > +		     should be "rsync_pin" when using external clock source.
> 
> Why not a boolean property here?

fsl,rx-sync-clock should have other values.
But now we just use rsync_pin and none.

> > +
> > +- fsl,tx-timeslot
> > +- fsl,rx-timeslot
> 
> Perhaps append "-mask"

Agree, I will modify in next version.

> 
> > +	Usage: required
> > +	Value type: <u32>
> > +	Definition : time slot for TDM operation. Indicates which time slots
> > +		     used for transmitting and receiving.
> > +
> > +- fsl,tdm-framer-type
> > +	Usage: required
> > +	Value type: <string>
> > +	Definition : "e1" or "t1"
> 
> Boolean?

We just support e1 and t1, in fact, there are more TDM framer types.

> 
> > +
> > +- fsl,tdm-mode
> > +	Usage: required
> > +	Value type: <string>
> > +	Definition : "normal" or "internal-loopback"
> 
> Boolean?

It can be Boolean.

BR
-Zhao
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
