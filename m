From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5] mtd: support BB SRAM on ICP DAS LP-8x4x
Date: Wed, 6 Jan 2016 15:25:31 -0800
Message-ID: <20160106232531.GP109450@google.com>
References: <1397668667-27328-4-git-send-email-ynvich@gmail.com>
 <1450205941-15593-1-git-send-email-ynvich@gmail.com>
 <20151220033807.GC9883@rob-hp-laptop>
 <1450608238.15911.24.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1450608238.15911.24.camel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Ianovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Neelesh Gupta <neelegup-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:MEMORY TECHNOLOGY DEVICES (MTD)" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Dec 20, 2015 at 01:43:58PM +0300, Sergei Ianovich wrote:
> On Sat, 2015-12-19 at 21:38 -0600, Rob Herring wrote:
> > On Tue, Dec 15, 2015 at 09:58:53PM +0300, Sergei Ianovich wrote:
> > > +Required properties:
> > > +- compatible : should be "icpdas,sram-lp8x4x"
> >=20
> > No wildcards please. Otherwise looks fine.
>=20
> There is a similar review comment from Arnd Bergmann in the discussio=
n
> of `[PATCH v5] serial: support for 16550A serial ports on LP-8x4x`.
>=20
> I'll quote my latest clarification:
> > ... This driver will support ports on LP-8081,=A0

^^ So 8081 doesn't even match the wildcard scheme you give in the
compatible string, proving the point of the Conventional Wisdom
suggestion Rob gave...

> > LP-8141, LP-8441, LP-8841. Last time I checked the vendor was annou=
ncing
> > a series with 3 as the last digit. They use lp8x4x name, eg. in
> > documentation like `LP-8x4x_ChangeLog.txt`. They ship their proprie=
tary
> > SDK in `lp8x4x_sdk_for_linux.tar`. All of this implies that it is a
> > single board.
>=20
> I think the solution should be the same for all LP-8x4x drivers (IRQ,
> SRAM, SERIAL, IIO).

The rationale is described here:

http://devicetree.org/Device_Tree_Usage#Understanding_the_compatible_Pr=
operty

Quote:
> Warning: Don't use wildcard compatible values, like "fsl,mpc83xx-uart=
"
> or similar. Silicon vendors will invariably make a change that breaks
> your wildcard assumptions the moment it is too late to change it.
> Instead, choose a specific silicon implementations and make all
> subsequent silicon compatible with it.

I don't think your circumstance is anything unique.

Regards,
Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
