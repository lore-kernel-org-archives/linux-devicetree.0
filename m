From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/6] phy: miphy365x: Use the generic phy type
 constants in dt-bindings/phy/phy.h
Date: Tue, 31 Mar 2015 09:47:41 +0100
Message-ID: <20150331084741.GM9447@x1>
References: <1427728632-10846-1-git-send-email-peter.griffin@linaro.org>
 <1427728632-10846-2-git-send-email-peter.griffin@linaro.org>
 <551A2D4D.1010601@ti.com>
 <20150331074027.GH9447@x1>
 <20150331080154.GA2029@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150331080154.GA2029@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 31 Mar 2015, Peter Griffin wrote:
> On Tue, 31 Mar 2015, Lee Jones wrote:
> > On Tue, 31 Mar 2015, Kishon Vijay Abraham I wrote:
> >=20
> > > Hi Patrice, Maxime,
> > >=20
> > > On Monday 30 March 2015 08:47 PM, Peter Griffin wrote:
> > > >Now there are generic phy type constants declared in phy.h, migr=
ate over to
> > > >using them rather than defining our own. This change has been do=
ne as one
> > > >atomic commit to be bisectable.
> > > >
> > > >Note: The values of the defines are the same, so there is no ABI=
 breakage
> > > >with this patch.
> > > >
> > > >Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > >Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > >Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > >=20
> > > Are you okay for this patch to go via PHY tree? It modifies arch/=
arm/boot/dts
> > > /stih416.dtsi.
> >=20
> > These files need to be changed simultaneously in order to prevent
> > breakage during bisection and the like.
>=20
> That is why it has been authored as one atomic commit. See commit mes=
sage above.

I already know you know why you did it.  The comment was for Kishon.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
