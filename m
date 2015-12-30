From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 1/1] powerpc: legacy serial port use device tree cell-index property
Date: Wed, 30 Dec 2015 16:34:34 -0600
Message-ID: <CAL_JsqJW+D0AEOfYxObMoDYY3kobvwh93kcLrsW65u2Jr3ctLQ@mail.gmail.com>
References: <1448477209-22340-2-git-send-email-curt@cumulusnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448477209-22340-2-git-send-email-curt-qUQiAmfTcIp+XZJcv9eMoEEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Curt Brune <curt-qUQiAmfTcIp+XZJcv9eMoEEOCMrvLtNR@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 25, 2015 at 12:46 PM, Curt Brune <curt-qUQiAmfTcIp+XZJcv9eMoEEOCMrvLtNR@public.gmane.org> wrote:
> Currently for PowerPC systems using device tree, the legacy serial
> ports are allocated in the order by which they are found in the device
> tree structure.
>
> This can cause problems in cases where the device tree nodes are
> sysnthesized by an external program (kexec for example), which may not
> preserve the original order of the device tree nodes.  This in turn
> can result in the serial console changing from ttyS0 to ttyS1
> unexpectedly.
>
> This patch uses the 'cell-index' property (if present) to map UART
> device tree nodes to legacy serial port number.  The cell-index
> property is widely used in all the Freescale .dts files for PowerPC.

If cell-index is already present in the dtbs, then this is okay.
Otherwise use aliases. cell-index is pretty much deprecated.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
