From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: pci-mvebu driver on km_kirkwood
Date: Mon, 26 Aug 2013 14:02:01 +0200
Message-ID: <20130826120200.GA15842@ulmo>
References: <51DD88A4.1030506@keymile.com> <20130731100359.3e789236@skate>
 <51F8CA44.4080802@keymile.com> <20130731110045.2dc84981@skate>
 <20130731205034.GA17615@obsidianresearch.com>
 <20130809140140.GA14990@ulmo> <521B1F6A.1090304@keymile.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3398670303689587771=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <521B1F6A.1090304@keymile.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gerlando Falauto <gerlando.falauto@keymile.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "Longchamp,
 Valentin" <Valentin.Longchamp@keymile.com>, Jason Cooper <jason@lakedaemon.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Andrew Lunn <andrew@lunn.ch>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org


--===============3398670303689587771==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2013 at 11:27:06AM +0200, Gerlando Falauto wrote:
> Hi guys [particularly Jason and Thierry],
>=20
> sorry for the prolonged silence, here I am back again...
>=20
> On 08/09/2013 04:01 PM, Thierry Reding wrote:
> >On Wed, Jul 31, 2013 at 02:50:34PM -0600, Jason Gunthorpe wrote:
> >>On Wed, Jul 31, 2013 at 11:00:45AM +0200, Thomas Petazzoni wrote:
> >>
> >>>>Actually, the main reason for trying to use this driver was because I
> >>>>wanted to model a PCIe *device* within the device tree, so to expose =
its
> >>>>GPIOs and IRQs to be referenced (through phandles) from other device
> >>>>tree nodes. The way I understand it, turns out this is not the way to
> >>>>go, as PCI/PCIe are essentially enumerated busses, so you're not
> >>>>supposed to -and it's not a trivial task to- put any information about
> >>>>real devices within the device tree.
> >>>>Do you have any suggestion about that?
> >>>
> >>>Indeed, PCI/PCIe devices are enumerated dynamically, so they are not
> >>>listed in the Device Tree, so there's no way to "attach" more
> >>>information to them.
> >>>
> >>>Device Tree people, any suggestion about the above question?
> >>
> >>No, that isn't true.
> >>
> >>Device tree can include the discovered PCI devices, you have to use
> >>the special reg encoding and all that weirdness, but it does work. The
> >>of_node will be attached to the struct pci device automatically.
>=20
> So you mean that, assuming I knew the topology, I could populate the
> device tree in advance (e.g. statically), so that it already
> includes *devices* which will be further discovered during probing?
> Or else you mean the {firmware,u-boot} can do that prior to starting the =
OS?
> If either of the above is true, could you please suggest some
> example (or some way to get one)?
> I assume the "reg" property (and the after-"@" node name) will need
> to encode (at least) the device number, is that right?
>=20
> I tried reading the "PCI Bus Binding to Open Firmware" but I could
> not make complete sense out of it...

You can find an example of this here:

	https://gitorious.org/thierryreding/linux/commit/b85c03d73288f6e376fc158ce=
ac30f29680b4192

It's been quite some time that I've actually tested that, but it used to
work properly. What you basically need to do is represent the whole bus
hierarchy within the DT. In the above example there's the top-level root
port (pci@1,0), which provides a bus (1) on which there's a switch named
pci@0,0. That switch provides another bus (2) on which more devices are
listed (pci@[012345],0). Those are all downstream ports providing
separate busses again and have a single device attached to them.

You can pretty much arbitrarily nest nodes that way to represent any
hierarchy you want. The tricky part is to get the node numbering right
but `lspci -t' helps quite a bit with that.

> >>It is useful for exactly the reason stated - you can describe GPIOs,
> >>I2C busses, etc, etc in DT and then upon load of the PCI driver engage
> >>the DT code to populate and connect all that downstream
> >>infrastructure.
>=20
> I'm not 100% sure I made myself clear though.
> What I would like to do is to have *other* parts of the device tree
> be able to reference (i.e., connect to, through phandles) a PCI
> device (because it provides a GPIO, for instance).
> Is that also what you mean?

Yes. In the example above you'll see that there's actually a GPIO
controller (pci@1,0/pci@0,0/pci@2,0/pci@0,0), so you could simply
associate a phandle with it, as in:

	gpioext: pci@0,0 {
		...
	};

And then hook up other devices to it using the regular notation:

	foo {
		...
		enable-gpios =3D <&gpioext 0 0>;
		...
	};

That's not done in this example but I've actually used something very
similar to that on an x86 platform to hook up the reset pin of an I2C
touchscreen controller to a GPIO controller, where both the I2C and
GPIO controllers were on the PCI bus.

I can't find that snippet right now, but I can look more thoroughly if
the above doesn't help you at all.

Thierry

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSG0O4AAoJEN0jrNd/PrOhEKMQAKWWQ+p6GLVaqeumVegGC/j9
vsy05gjNY5HkqZXO4tA65P7mfFZLzEGmk9xLPcuJGPsbFXzmioyYCqmWbybG+835
fSQI+uBB4fHrkbfPQ4Imdx8SA8xuxUslWIUs5jX/0Y6lAFylJK9a0ry6m+LkXEEO
WNiSPGlbAtf8p4DCjkOBDhLHlyNsq89VUHfs8wcfhm0wdh5az0G13hR1zi0AWvGy
iZVoddS5tsCmRPygbu2Z2iC4bPnkkwOoim+KhiYTVOBo2a5291UfG2BHugVn1XUS
RB6XOdiOjJ0fw0tPpp6WnpuwPKls6Vt4q2ietlGuYQUQz4f/02wZEXZeSsMKBqQf
EWUGTIeg0eaIKH+hJNjgP8OjQ/LaXVv5xquFoEG7/NBBFD8xPj6g+yoRb0bwmW8S
FNmsNCtizLZ5VwzkDlkjdRoUrCKi9rqm+aidmJApNT8NlEe0dr+NI7QJIS5GJxz1
l5SJeoOItkRBkOTylIqrSWcUPzRODl3Yko7TXx12e/A1WuvcgiKpUj6q98YqdLgV
+MDglMwEJZ3Ai5fbB5Tp6m9biuLeIuiRWhBD4THM2LXK7V0OFM5HYgwF65RV8S6J
4HzZtXMhQPcCokqDchsVbNo/8O1ULGFdPAJPKNpfLyt0fP9p5bJ9gRaxNc+UtUhq
vfcxs5RPHzcS0XZqRfW7
=TQ/o
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--


--===============3398670303689587771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3398670303689587771==--
