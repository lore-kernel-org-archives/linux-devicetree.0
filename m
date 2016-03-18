From: Qiang Zhao <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH v5 3/7] QE: Add uqe_serial document to bindings
Date: Fri, 18 Mar 2016 00:48:57 +0000
Message-ID: <AM3PR04MB118502C29D83E6251367E4E8918C0@AM3PR04MB1185.eurprd04.prod.outlook.com>
References: <1457486494-11377-1-git-send-email-qiang.zhao@nxp.com>
 <1457486494-11377-3-git-send-email-qiang.zhao@nxp.com>
 <20160317162749.GA7872@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160317162749.GA7872@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org" <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, Yang-Leo Li <leoyang.li-3arQi8VN3Tc@public.gmane.org>, Xiaobo Xie <xiaobo.xie-3arQi8VN3Tc@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Fri, Mar 18, 2016 at 12:28AM, Rob Herring wrote:
> -----Original Message-----
> From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Friday, March 18, 2016 12:28 AM
> To: Qiang Zhao <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
> Cc: oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org; Yang-Leo Li <leoyang.li-3arQi8VN3Tc@public.gmane.org>; Xiaobo Xie
> <xiaobo.xie-3arQi8VN3Tc@public.gmane.org>; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Subject: Re: [PATCH v5 3/7] QE: Add uqe_serial document to bindings
> 
> On Wed, Mar 09, 2016 at 09:21:30AM +0800, Zhao Qiang wrote:
> > Add uqe_serial document to
> > Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt
> >
> > Signed-off-by: Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
> > ---
> > Changes for v2
> > 	- modify tx/rx-clock-name specification Changes for v3
> > 	- NA
> > Changes for v4
> > 	- drop device_type
> > 	- modify to SoC specific compatible
> > Changes for v5
> > 	- add fsl to compatible as prefix
> >
> >  .../bindings/powerpc/fsl/cpm_qe/uqe_serial.txt         | 18
> ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Thank you for reviewing!

BR
-Zhao Qiang
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
