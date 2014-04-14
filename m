From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/6] ARM: dts: zynq: drop address cells from GIC node
Date: Mon, 14 Apr 2014 09:31:05 -0700
Message-ID: <f5f52b9f-54df-49f4-badf-f7588de37675@CO9EHSMHS012.ehs.local>
References: <1397228380-7352-1-git-send-email-l.stach@pengutronix.de>
 <1397228380-7352-3-git-send-email-l.stach@pengutronix.de>
 <f0de762f-56b3-4894-aa78-7ca3c88b9e28@AM1EHSMHS004.ehs.local>
 <1397479989.4548.26.camel@weser.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1397479989.4548.26.camel-WzVe3FnzCwFR6QfukMTsflXZhhPuCNm+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2014-04-14 at 02:53PM +0200, Lucas Stach wrote:
> Hi S=C3=B6ren,
>=20
> Am Freitag, den 11.04.2014, 08:54 -0700 schrieb S=C3=B6ren Brinkmann:
> > On Fri, 2014-04-11 at 04:59PM +0200, Lucas Stach wrote:
> > > This is likely a copy-and-paste error from the
> > > ARM GIC documentation, that has already been fixed.
> > >=20
> > > address-cells should have been set to 0, as with the size
> > > cells. As having those properties set to 0 is the
> > > same thing as not specifying them, drop them completely.
> >=20
> > Isn't this property inherited from the parent node, requiring to
> > actually set them to 0 to comply with the docs?
> >=20
>=20
> No, it isn't. From ePAPR v1.1 section 2.3.5:
> "The #address-cells and #size-cells properties are not inherited from
> ancestors in the device tree. They shall be explicitly defined."

Thanks, you're right. I didn't know that document yet. I have some
reading to do.

	S=C3=B6ren


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
