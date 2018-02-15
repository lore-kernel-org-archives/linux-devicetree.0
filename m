From: Amelie DELAUNAY <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
Subject: RE: [[INTERNAL] PATCH 0/2] Fix STM32F7 DWC2 OTG HS binding
Date: Thu, 15 Feb 2018 15:48:04 +0000
Message-ID: <0d93c90528ca408eac19e4648f09156a@SFHDAG3NODE2.st.com>
References: <1518709601-17232-1-git-send-email-amelie.delaunay@st.com>
 <1518709601-17232-2-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518709601-17232-2-git-send-email-amelie.delaunay-qxv4g6HH51o@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Forget this one! Sorry for the inconvenience.

> -----Original Message-----
> From: Amelie DELAUNAY
> Sent: jeudi 15 février 2018 16:47
> To: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>; Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>;
> Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>; Rob Herring
> <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-
> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Amelie DELAUNAY <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
> Subject: [[INTERNAL] PATCH 0/2] Fix STM32F7 DWC2 OTG HS binding
> 
> This patchset fixes STM32F7 DWC2 OTG HS binding. It actually re-applies the
> v2 former patches adding STM32F7 DWC2 OTG HS support.
> 
> Amelie Delaunay (2):
>   dt-bindings: usb: fix the STM32F7 DWC2 OTG HS core binding
>   usb: dwc2: fix STM32F7 USB OTG HS compatible
> 
>  Documentation/devicetree/bindings/usb/dwc2.txt | 2 +-
>  drivers/usb/dwc2/params.c                      | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> --
> 2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
