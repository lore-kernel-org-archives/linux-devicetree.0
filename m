From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ARM topic: Is DT on ARM the solution, or is there something
 better?
Date: Tue, 22 Oct 2013 12:25:27 +0200
Message-ID: <20131022102526.GE15640@ulmo.nvidia.com>
References: <52644A9E.3060007@wwwdotorg.org>
 <20131021085420.GA21518@ulmo.nvidia.com>
 <52658C49.80400@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KuLpqunXa7jZSBt+"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52658C49.80400-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--KuLpqunXa7jZSBt+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2013 at 09:19:21PM +0100, Stephen Warren wrote:
> On 10/21/2013 09:54 AM, Thierry Reding wrote:
> > On Sun, Oct 20, 2013 at 10:26:54PM +0100, Stephen Warren wrote:
> ...
> >> I wonder if DT is solving the problem at the right level of
> >> abstraction? The kernel still needs to be aware of all the
> >> nitty-gritty details of how each board is hooked up different,
> >> and have explicit code to deal the union of all the different
> >> board designs.
> >>=20
> >> For example, if some boards have a SW-controlled regulator for a
> >> device but others don't, the kernel still needs to have driver
> >> code to actively control that regulator, /plus/ the regulator
> >> subsystem needs to be able to substitute a dummy regulator if
> >> it's optional or simply missing from the DT.
> >>=20
> >> Another example: MMC drivers need to support some boards
> >> detecting SD card presence or write-protect via arbitrary GPIOs,
> >> and others via dedicated logic in the MMC controller.
> >>=20
> >> In general, the kernel still needs a complete driver to every
> >> last device on every strange board, and needs to support every
> >> strange way some random board hooks all the devices together.
> >=20
> > I have some difficulty understanding what you think should've been
> > moved out of the kernel. There's only so much you can put into data
> > structures and at some point you need to start writing device
> > specific code for the peripherals that you want to drive.
>=20
> My point was that (part of) the intent of adding DT support to the
> kernel was to get rid of all the board-specific code/churn in the
> kernel. That's not really possible, since DT is just representing the
> data about the HW (e.g. which GPIO/IRQ numbers) and not the behaviour.
> In order to really remove signifcant board-specific code from the
> kernel, you need to move behaviour out of the kernel too, i.e. hide it
> behind some kind of firmware or virtualization interface, and hence
> have simpler drivers that don't know all the details.

I think we've done a pretty good job at extracting board-specific code,
though. The majority of drivers has moved to appropriate subsystems and
therefore isn't board-specific at all anymore.

Doesn't anything beyond that involve abstracting away the differences
between SoCs? If I understand correctly what you envision is something
that would abstract the hardware differences of various SoCs and provide
a standard interface to access peripherals. For example, instead of
implementing a kernel driver for an MMC controller per SoC, the firmware
would instead implement a well-defined set of operations that can be
performed on an MMC controller and a generic "firmware" driver within
the Linux kernel would call into the firmware and register the services
with the kernel, so that it could be exposed to userspace in the usual
way.

But in that case we'd just be moving code from kernel to firmware. At
the same time we'd loose all the advantages that come with keeping code
in the kernel.

The kernel already provides a generic interface for devices to implement
by means of the subsystem APIs.

Even on x86 where standardization has been going on for decades I don't
think firmware actually abstracts away at that level. I think I've seen
something similar done for backlight devices that could be controlled
via ACPI, but anything beyond that level of complexity probably becomes
impractical to standardize without loosing much of the hardware
capabilities.

> ...
> >> * Would UEFI/ACPI/similar fulfill this role?
> >=20
> > If I recall correctly, the original OpenFirmware that introduced
> > the DT concept used to have something similar to UEFI/ACPI.
> > Essentially it was possible to not only pass the DT to the
> > operating system but also allow the operating system to call back
> > into the firmware to request service.
>=20
> Yes, OpenFirmware might be another possible firmware interface. I
> don't know anything about it...

I think it has about the same scope as the virtualization solution that
you propose. It will work fairly well with exposing things such as PCI
configuration space access for each PCI-type device. Where I don't see
it perform very well is for things such as GPUs where it isn't trivial
to find an exhaustive, yet unified, set of services that devices have to
provide.

> >> * Perhaps a standard virtualization interface could fulfil this
> >> role?
> ...
> > What will likely happen with such a solution is that we'll have to
> > come up with a standard interface that the guest OS expects.
>=20
> I think much of that is already defined for a paravirt KVM guest
> though, right?

Possibly. I have no complete understanding of how exactly KVM achieves
this.

> ...
> > Vendor kernels that implement the host OS will effectively become
> > forks of their own since there's no incentive to upstream code
> > anymore. Linux upstream becomes a single unified architecture
> > because all interfaces are now the same. Vendors are back to
> > brewing their own.
>=20
> True. Many/most(?) vendors work like that for most *products* though
> already...

I agree. But we're having this discussion because that's something we
want to change, right? Eventually I'd like for upstream Linux to become
what vendors use to develop on primarily, while downstream kernels are
merely the (hopefully small) delta of what's not considered good enough
quality for upstream.

> > ...
>=20
> (Yes, I fully acknowledge there are many issues with
> firmware/virtualization as a platform...)

Probably the most important issue wouldn't exist with such a solution.
The firmware/host OS would likely be open-source and therefore easy to
fix when broken. At the same time it adds another dependency that we
need to carefully manage, thereby further complicating matters.

Thierry

--KuLpqunXa7jZSBt+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSZlKWAAoJEN0jrNd/PrOhNDoQAKmHchDxEddyjYpSUb8uTtdS
oJK7OO4rjfvQTutAiYVYmQDbd9/+CjnGRZyJ37YrntvnATmXEC3qTZKMqaq7TZz5
buscDu7knMEcm6CMo/OMwflPf1fBs7xmZZ7MvABAtosGXaXnxqc5NILPYti16J8D
8h4vDqgsZ4bBvu84V9AIZs24fG8+TeKpOix9mnnF6DKASKAvAdNmowpw5/SZutzb
rPTlLMtwYdbicIn+Gq1XeerXBYbrlkNckOJKR/tXvcNQOEolyJ5VQjBm20eX0m8I
1tMVfJKZK8kqgZGc1x82wAIWKkLikJzCpmMZ3doSU+rhTj4tuTf+e0usR9B4FDfv
mN4QoGApz/6JB8B/Ri3OKpisUS2Pf7QALGgkKmoNx/LhdfZRCf4ba5OAlGfqx/om
3Eehw7SGrwMdx8U9gpAdRjFgNPnBmT9ntTFfJNLSHBJtBsqW72nXmaLDQWb1Zb+s
oZw+v+Dn9mvB5neFANrNKNMEJAhdobnhYeOmTeoYGUE5I09zRonyurqzOCY3xvNt
vV6sGceo0yWuXxw1urMjRS/2yMUlxazSqx/82ZTXOSgsEVdGOOrIQyFP0ly2i/7a
Kt5x88NGCztZBYuljh1n/eueaJjVulPEKuHoJAqzPhyOunfF3w9f2XffXjExMAkR
vurHxf6W85dacjLBeuFU
=6K5p
-----END PGP SIGNATURE-----

--KuLpqunXa7jZSBt+--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
