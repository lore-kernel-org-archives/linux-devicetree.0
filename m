From: Peter Chen <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH v2 1/3] usb: chipidea: msm: Add device tree binding
 information
Date: Tue, 25 Feb 2014 01:57:24 +0000
Message-ID: <2d4d3fed4d9e405fb4c0b7a8a34e9222@BL2PR03MB226.namprd03.prod.outlook.com>
References: <1392729681-21022-1-git-send-email-iivanov@mm-sol.com>
	 <1392729681-21022-2-git-send-email-iivanov@mm-sol.com>
	 <20140218212659.GL1706@sonymobile.com>
	 <1392824602.17130.68.camel@iivanov-dev>
	 <20140219174655.GN1706@sonymobile.com>
 <1393237096.6481.12.camel@iivanov-dev>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393237096.6481.12.camel@iivanov-dev>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Cc: "richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

 
> 
> Hi,
> 
> On Wed, 2014-02-19 at 09:46 -0800, Courtney Cavin wrote:
> > On Wed, Feb 19, 2014 at 04:43:22PM +0100, Ivan T. Ivanov wrote:
> > >
> > > Hi,
> > >
> > > On Tue, 2014-02-18 at 13:26 -0800, Courtney Cavin wrote:
> > > > On Tue, Feb 18, 2014 at 02:21:19PM +0100, Ivan T. Ivanov wrote:
> > > > > From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
> > > > >
> > > > > Document device tree binding information as required by the
> > > > > Qualcomm USB controller.
> > > > >
> > > > > Signed-off-by: Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
> > > > > ---
> > > > >  .../devicetree/bindings/usb/msm-hsusb.txt          |   17
> +++++++++++++++++
> > > >
> > > > Although you mentioned to Josh that this is intended for "non-
> standard"
> > > > Chipidea properties, I don't see any other than requiring that
> 'dr_mode'
> > > > must be "peripheral".  It would seem that this should all be
> > > > integrated into a ci3xxx.txt.
> > >
> > > Hm, there is no ci3xxx.txt. The closest match is ci-hdrc-imx.txt.
> > > So it could be ci-hdrc-qcom.txt or my preferred name qcom,ci-hdrc.txt?
> >
> > Sorry, I was referring to ci13xxx-imx.txt, which was apparently moved
> > to ci-hdrc-imx.txt.  I was recommending to merge the two into one
> > 'ci13xxx.txt', as this binding seems to be a new compatible for the
> > same basic chip.  Now perhaps 'ci-hdrc.txt'.
> >
> > Although I agree with Josh that this name should be changed, and I
> > think either of your two suggestions would be acceptable, I would like
> > to at least discuss the possibility of actually merging the two in
> > this series.
> >
> > Comments?
> 
> 
> iMX version have required and recommender properties which are not
> meaningful for QCOM variant. I will prefer separate file. It depends on
> Freescale engineers (now in Cc:)
> 
> 

Unlike dwc3, there is no common dts entry for chipidea core, every platform
uses its own dts to cover both common and platform-specific properties.

I also have plan to use dwc3 style way for dts, but msm platform has still
not used dts, I don't know how many msm platforms need to change, once
you finish transferring msm to dts, I will split common and platform specific
entry.

Peter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
