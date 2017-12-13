From: Dhaval Rajeshbhai Shah <DSHAH-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2 1/2] Documentation: devicetree: Add DT bindings to
 xlnx_vcu driver
Date: Wed, 13 Dec 2017 05:12:23 +0000
Message-ID: <BY2PR0201MB1879663CDB18630B31A00F2AC1350@BY2PR0201MB1879.namprd02.prod.outlook.com>
References: <20171207104757.GA27343@kroah.com>
 <1512682276-6082-1-git-send-email-dshah@xilinx.com>
 <1512682276-6082-2-git-send-email-dshah@xilinx.com>
 <20171212200703.nxabyfcjbswwbp4v@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171212200703.nxabyfcjbswwbp4v@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Rob Herring' <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "pombredanne-od1rfyK75/E@public.gmane.org" <pombredanne-od1rfyK75/E@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Hyun Kwon <hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thanks a lot for the review.

> -----Original Message-----
> From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Tuesday, December 12, 2017 12:07 PM
> To: Dhaval Rajeshbhai Shah <DSHAH-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Cc: arnd-r2nGTMty4D4@public.gmane.org; gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org;
> pombredanne-od1rfyK75/E@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org; Hyun Kwon <hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; Dhaval
> Rajeshbhai Shah <DSHAH-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Subject: Re: [PATCH v2 1/2] Documentation: devicetree: Add DT bindings to
> xlnx_vcu driver
>=20
> On Thu, Dec 07, 2017 at 01:31:15PM -0800, Dhaval Shah wrote:
> > Add Device Tree binding document for logicoreIP. This logicoreIP
> > provides the isolation between the processing system and programmable
> > logic. Also provides the clock related information.
> >
> > Signed-off-by: Dhaval Shah <dshah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > ---
> > Changes since v2:
> >  * Describe the h/w
> >  * compatible string is updated to make it more specific
> >    based on the logicoreIP version.
> >  * Removed that encoder and decoder child nodes and relatd properties a=
s
> that
> >    will be a separate driver and dts nodes. other team is working on th=
at.
> >  * Updated to use as a single driver.
> >
> >  .../devicetree/bindings/misc/xlnx,vcu.txt          | 31
> ++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/misc/xlnx,vcu.txt
>=20
> Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>=20
> One nit. Use "dt-bindings: misc: ..." for the subject.
I will update subject line and send you v3 patch set.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
