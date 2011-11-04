From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: USB support for device tree
Date: Fri, 4 Nov 2011 12:45:04 -0400
Message-ID: <CACxGe6vMCHdB+J8hX1EPW3m35UaKC-FAZULUA4G11J0FUK6tNQ@mail.gmail.com>
References: <4EB3A165.8060300@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4EB3A165.8060300-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavan Kondeti <pkondeti-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 4, 2011 at 4:25 AM, Pavan Kondeti <pkondeti-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>=
 wrote:
> Hi
>
> I am working on adding USB device tree support for MSM platform. =A0O=
ne of
> our chip set has 2 hsusb cores. The first core is configured as otg a=
nd
> the other core is configured in host only mode (EHCI compliant). Are =
the
> below device node names Okay? Please suggest.
>
> hsusb0-otg: usb@0xa6000000 {
> =A0 =A0 =A0 =A0compatible =3D "qcom,hsusb-otg";
> =A0 =A0 =A0 =A0---
> };
>
> hsusb0-device: usb@0xa6000000 {
> =A0 =A0 =A0 =A0compatible =3D "qcom,hsusb-device";
> =A0 =A0 =A0 =A0---
> };
>
> hsusb0-host: usb@0xa6000000 {
> =A0 =A0 =A0 =A0compatible =3D "qcom,hsusb-host", "usb-ehci";
> =A0 =A0 =A0 =A0---
> };
>
> hsusb1-host: usb@0xa6000000 {
> =A0 =A0 =A0 =A0compatible =3D "qcom,hsusb-host", "usb-ehci";
> =A0 =A0 =A0 =A0---
> };
>
> /* super speed support
>
> ssusb0-device: usb@0xa6000000 {
> =A0 =A0 =A0 =A0compatible =3D "qcom,ssusb-device";
> };


The host controller node names as "usb@<adddr>" as you have here is
exactly right.  The driver doesn't care and will only look at the
compatible list.  OTG controllers can also use "usb@" as the prefix.

Controllers that are only in device mode should probably be called
something like "usb-gadget@<addr>" or similar, because "usb@" is used
for host controllers.

The label names (hsusb*-host, hsusb*-device) are completely irrelevant
since Linux never sees them.  Use whatever you want for the label
names.

Also, the form of the node name is: "usb@a6000000" (without '0x' in
the address).

g.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
