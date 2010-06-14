From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: Request review of device tree documentation
Date: Mon, 14 Jun 2010 12:23:38 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.1006141206110.13427@xanadu.home>
References: <4C13430B.5000907@firmworks.com>
	<1276339529.1962.184.camel@pasglop> <1276339684.1962.186.camel@pasglop>
	<4C13B618.1030006@firmworks.com> <1276383132.1962.195.camel@pasglop>
	<AANLkTimRV8u3gDNCAIlROJoPcKs7jFwj2na3ZDFOg3O0@mail.gmail.com>
	<4C146F18.9030008@firmworks.com>
	<AANLkTikls3hjXOmKFqG2D_9GaJSjOXNuuRXPlanAjo5E@mail.gmail.com>
	<20100614124438.GF9323@yookeroo>
	<alpine.LFD.2.00.1006141044510.13427@xanadu.home>
	<20100614160201.GD9550@shareable.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Boundary_(ID_Jieu1vixw3uCkMJRR0q6Qw)"
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-reply-to: <20100614160201.GD9550@shareable.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Jamie Lokier <jamie@shareable.org>
Cc: microblaze-uclinux@itee.uq.edu.au, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>, Mitch Bradley <wmb@firmworks.com>, Dan Malek <ppc6dev@digitaldans.com>, Jeremy Kerr <jeremy.kerr@canonical.com>, linux-arm-kernel@lists.infradead.org, David Gibson <david@gibson.dropbear.id.au>
List-Id: devicetree@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--Boundary_(ID_Jieu1vixw3uCkMJRR0q6Qw)
Content-type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, 14 Jun 2010, Jamie Lokier wrote:

> Nicolas Pitre wrote:
> > On Mon, 14 Jun 2010, David Gibson wrote:
> >=20
> > > On Sun, Jun 13, 2010 at 11:02:15PM -0600, Grant Likely wrote:
> > > [sni]
> > > > > That's sort of a self-fulfilling prophecy. =A0If the OS doesn't=
 trust the
> > > > > firmware, there is no pressure for the firmware to "get it righ=
t".
> > > >=20
> > > > Firmware will not get it right.  Period.  There will always be
> > > > something wrong.  It is never right on PCs.  It will never be rig=
ht on
> > > > the other architectures.
> > >=20
> > > Yes, yes, yes.  And there is a great deal of empirical evidence to
> > > back that assertion.
> > >=20
> > > >  That goes for OSes too, but upgrading an OS
> > > > isn't as risky as upgrading firmware.  That isn't to say that it =
can't
> > > > be close, but every firmware feature that the OS depends on is a
> > > > feature that could force a risky firmware upgrade when the bug in=
 it
> > > > is discovered.
> > >=20
> > > Indeed.  In fact, the general rule of thumb is really "put as much =
as
> > > possible into the most easily replaced layer of the stack".  This i=
s,
> > > incidentally, why I've always been dubious about simple firmwares
> > > supplying a flattened device tree rather than including the device
> > > tree template in the kernel, cuboot style.
> >=20
> > The biggest advantage, IMHO, for adding DT to ARM, is actually to=20
> > decouple the hardware config information and the kernel.  If in the e=
nd=20
> > the DT has to be shipped in the kernel then we're losing all this=20
> > advantage over the current state of things on ARM which still works=20
> > pretty well otherwise.
> >=20
> > In the best case, the simple firmware simply has to retrieve the=20
> > flattened device tree from flash, and pass it to the kernel just like=
=20
> > some anonymous blob.  And the simple firmware only needs to provide a=
=20
> > way for that DT blob to be updatable, like through an upload of a=20
> > replacement blob that was prepared offline.  Just like a ramdisk imag=
e=20
> > or the like.
> >=20
> > That doesn't need to be fancier than that, and the goal of having the=
 DT=20
> > data tied to the hardware instead of the kernel is achieved.
>=20
> Imho that puts the DT in a similar category as initrd/initramfs, from
> the bootloader's point of view.  It's another blob whose address is
> passed to the kernel, just like initrd.

Exact.

> Some bootloaders can't update blobs independently for technical
> reasons, or to be minimal.
>=20
> A device I'm using does kernel updates by updating the whole romfs
> boot image, which contains the kernel and other auxiliary blobs used
> for booting (splash screen, early irq handlers etc.) as well as the
> root filesystem.
>=20
> It is done that way to pack everything together in the small flash,
> and because the NOR flash eraseblocks are too large relative to the
> whole flash size to use separate partitions for kernel, boot
> filesystem and other blobs for booting.

If you already have to update everything at once already anyway, then=20
the DT blob just has to be in that update.  No need to do otherwise if=20
you can't do better than that for the kernel alone.

> Dedicating a 64kiB eraseblock out of 2MB just for a small DT would be
> quite wasteful.  Dedicating two to make it powerfail-safe would be
> even worse.

I hardly see how you can be power fail safe with your=20
update-everything-at-once condition above anyway.

Furthermore, if the DT is updated by the bootloader, then that means=20
you're not running a live system at that point.  If power fails during=20
the DT update, then you simply have to re-update it when power is back=20
to allow a successful boot of the kernel afterwards.

> So requiring that a bootloader can update the DT _independently_ of
> everything else is a bit much for some devices.

In my opinion, this use case you're illustrating above simply could=20
continue to _not_ use DT at all.  If your NOR flash is so small that you=20
cannot spare some extra erase blocks, then this is a deeply embedded=20
profile the current DT-on-ARM push is not really meant for.  You would=20
be much better with a minimally configured kernel with all the hardware=20
info statically compiled into the kernel and get away without all the DT=20
parsing code altogether, like you're already doing today.

While I think DT for ARM has advantages, I don't see us dropping the=20
legacy ARM methods anytime soon, especially for existing or extremely=20
constrained targets.


Nicolas

--Boundary_(ID_Jieu1vixw3uCkMJRR0q6Qw)
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linuxppc-dev mailing list
Linuxppc-dev@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/linuxppc-dev
--Boundary_(ID_Jieu1vixw3uCkMJRR0q6Qw)--
