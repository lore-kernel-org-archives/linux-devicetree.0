From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH v2] ARM: mvebu: fix ordering in Armada 370 .dtsi
Date: Fri, 14 Nov 2014 21:50:16 +0100
Message-ID: <20141114205016.GJ2001@lunn.ch>
References: <1415993776-3469-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20141114204333.GS27002@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141114204333.GS27002-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 14, 2014 at 09:43:33PM +0100, Uwe Kleine-K=F6nig wrote:
> Commit a095b1c78a35 ("ARM: mvebu: sort DT nodes by address")
> missed placing the system-controller in the correct order.           =
                                                                       =
                            =20
>=20
> Fixes: a095b1c78a35 ("ARM: mvebu: sort DT nodes by address")
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
> Hello Andrew,
>=20
> I guess your question concerning overlapping ranges doesn't stop this
> patch from being useful, does it?

Not at all.

Acked-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>

	  Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
