From: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] arm64/dts: Add missing DMA Abort interrupt to Juno
Date: Mon, 11 Jan 2016 10:47:07 +0000
Message-ID: <20160111104707.GB13633@e106497-lin.cambridge.arm.com>
References: <6a66d2ac442925e066fe9b67ee2883de5894b0d3.1452168063.git.robin.murphy@arm.com>
 <2736927.0LiVxGZzgm@wuerfel>
 <568E7EF4.1020403@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <568E7EF4.1020403-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 07, 2016 at 03:06:28PM +0000, Sudeep Holla wrote:
>=20
>=20
> On 07/01/16 14:36, Arnd Bergmann wrote:
> >On Thursday 07 January 2016 12:01:59 Robin Murphy wrote:
> >>The DMA-330 has an "irq_abort" interrupt line on which it signals f=
aults
> >>separately from the "irq[n:0]" channel interrupts. On Juno, this is
> >>wired up to SPI 92; add it to the DT so that DMAC faults are correc=
tly
> >>reported for the driver to reset the thing, rather than leaving it
> >>locked up and waiting to time out.
> >>
> >>CC: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
> >>CC: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> >>CC: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> >>Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
> >>
> >
> >Nothing wrong with the patch, but could you please come up with
> >a more structured way to get patches for Juno into the kernel?
> >
>=20
> Sorry for that. Liviu is on holidays, he usually reviews Juno DTS cha=
nge
> and provides ack. But missed to check with him before he disappeared.
>=20
> >You have addressed the patch "to:" the arm-soc maintainers, but
> >you are not listed in the maintainers file for the directory, so
> >it's not clear what you expect to happen here.
> >
> >Ideally, we'd get patches from just one of the people listed
> >in the MAINTAINERS file normally, and let us know if the
> >primary maintainer changes, or if one of the others sends a
> >patch because that person is unavailable.
> >
>=20
> We(me along with Liviu and Lorenzo) will try to group them together a=
nd
> one of us can send you pull request.
>=20
> I don't think there's any other fixes on the list though there are fe=
w
> feature additions which I assume is too late for v4.5 now. But still =
I
> prefer to wait till next week so that I can check with Liviu to see i=
f
> there are any other Juno fixes that can be grouped.

Hi all,

The only other changes queued for v4.5 are the HDLCD patches which touc=
h
on the .dts. Arnd, Olof: how do you prefer to handle this? Can you take
Robin's patch in arm-soc and I'll queue the rest of the changes via Dav=
id
Airlie?

Best regards,
Liviu

>=20
> --=20
> Regards,
> Sudeep
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
