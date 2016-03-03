From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] usb: dwc2: Add support for Lantiq ARX and XRX SoCs
Date: Thu, 3 Mar 2016 16:05:10 -0600
Message-ID: <20160303220510.GA28842@rob-hp-laptop>
References: <1456569084-31292-1-git-send-email-a.seppala@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456569084-31292-1-git-send-email-a.seppala-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antti =?iso-8859-1?Q?Sepp=E4l=E4?= <a.seppala-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Feb 27, 2016 at 12:31:24PM +0200, Antti Sepp=E4l=E4 wrote:
> Add support for Lantiq ARX and XRX SoC families to the dwc2 driver.
>=20
> Signed-off-by: Antti Sepp=E4l=E4 <a.seppala-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.txt |  2 ++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/usb/dwc2/platform.c                    | 34 ++++++++++++++++=
++++++++++
>  2 files changed, 36 insertions(+)
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
