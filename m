From: Jerry Huang <jerry.huang-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH v4 3/3] USB3/DWC3: Enable undefined length INCR burst type
Date: Tue, 2 May 2017 06:13:33 +0000
Message-ID: <DB5PR0401MB181366E27C238DF8B2228B00FE170@DB5PR0401MB1813.eurprd04.prod.outlook.com>
References: <1484727138-3264-1-git-send-email-jerry.huang@nxp.com>
 <1484727138-3264-3-git-send-email-jerry.huang@nxp.com>
 <DB5PR0401MB1813965DDC8CC6CD0BD85980FE440@DB5PR0401MB1813.eurprd04.prod.outlook.com>
 <87y3xeqvsl.fsf@linux.intel.com>
 <DB5PR0401MB1813AAB5AA84B0B310ED1B10FE440@DB5PR0401MB1813.eurprd04.prod.outlook.com>
 <87tw71xthj.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87tw71xthj.fsf-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rajesh Bhagat <rajesh.bhagat-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org


> -----Original Message-----
> From: Felipe Balbi [mailto:balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Friday, March 10, 2017 7:27 PM
> To: Jerry Huang <jerry.huang-3arQi8VN3Tc@public.gmane.org>; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org;
> mark.rutland-5wv7dgnIgG8@public.gmane.org; catalin.marinas-5wv7dgnIgG8@public.gmane.org
> Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; Rajesh
> Bhagat <rajesh.bhagat-3arQi8VN3Tc@public.gmane.org>
> Subject: RE: [PATCH v4 3/3] USB3/DWC3: Enable undefined length INCR burst
> type
>=20
>=20
> Hi,
>=20
> Jerry Huang <jerry.huang-3arQi8VN3Tc@public.gmane.org> writes:
> >> >> --
> >> >> 1.7.9.5
> >> > Hi, Balbi and all guys,
> >> > Any comment for these patches? Can they be accepted?
> >>
> >> Rob had comments which you didn't reply yet. I cannot take this
> >> patchset yet ;-)
> >>
> > Balbi,
> >
> > I look into his mail again, which was based v3, and I replied it.
> >
> > He had different understanding for undefined length burst mode.
> >
> > It seems he think for this mode, just setting bit[0] (INCRBrstEna) and
> > don't need to set other field.
> >
> > However, according to the DWC USB3.0 controller databook, when it is
> > undefined length INCR burst mode, we still need to set one max burst
> > type, such as INCR8, which means controller will use any length less
> > than or equal to this INCR8.
>=20
> Rob, do you agree with the patch now?
>=20
> --
> balbi

Hi, Balbi,
Any comment for these patches? Or any chance to merge them?
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
