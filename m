From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: mvebu: add ethernet to the cm-a510 board
Date: Fri, 30 Jan 2015 12:41:44 +0100
Message-ID: <20150130124144.501cf81d@armhf>
References: <E1YH5bU-0005mG-3L@bombadil.infradead.org>
	<54CB5267.5060004@gmail.com>
	<20150130113118.5523ed68@armhf>
	<54CB6440.1010002@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54CB6440.1010002-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gabriel Dobato <dobatog-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 30 Jan 2015 12:00:16 +0100
Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Adapting the .config and removing drivers is actually not an option.
> IMHO, introducing DT was meant for a single multi-arch kernel that
> can be shipped with common Linux distros. Therefore, DT is the place
> you enable/disable available resources. You leave most of the SoC (an=
d
> SoM) nodes disabled as long as you cannot tell if there is a
> corresponding connector available.

Well, I don't know too much about the hardware, and less about the
hardware modules (SoM?).

As seen in the Compulab documents, there are a lot of hardware modules.
=46or the DT, do you mean that there would be as many .dts's as the who=
le
number of connection possibilities?

I'd have better seen the inverted case as the actual empty cm-board dts=
:
enable every option in the (generic) .dts and let the vendor/user creat=
e
a specific .dts from this one for the board according to the installed
modules.

In any case, any real cm-a510 board should work with the
generic/full .dts even if some hardware modules are lacking. No?

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
