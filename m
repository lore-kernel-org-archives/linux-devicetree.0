From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v4 5/8] arm64: dts: rockchip: Clean up gpio-keys nodes
Date: Mon, 28 Mar 2016 22:24:12 +0200
Message-ID: <5487279.12FUefa44Q@diego>
References: <1458136727-32075-1-git-send-email-afaerber@suse.de> <1458136727-32075-6-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458136727-32075-6-git-send-email-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julien Chauveau <chauveau.julien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 16. M=E4rz 2016, 14:58:43 schrieb Andreas F=E4rber:
> Drop superfluous #address-cells and #size-cells.
> Use KEY_POWER define for 116.
> Rename sub-nodes to avoid new dtc warnings.
>=20
> Reported-by: Julien Chauveau <chauveau.julien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Julien Chauveau <chauveau.julien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Andreas F=E4rber <afaerber-l3A5Bk7waGM@public.gmane.org>

applied to my dts64 branch for 4.6


Thanks
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
