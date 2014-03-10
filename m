From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v6 6/6] pci: Add support for creating a generic
 host_bridge from device tree
Date: Mon, 10 Mar 2014 14:44:14 +0000
Message-ID: <20140310144414.GT6457@e106497-lin.cambridge.arm.com>
References: <1394020137-1830-1-git-send-email-Liviu.Dudau@arm.com>
 <1394020137-1830-7-git-send-email-Liviu.Dudau@arm.com>
 <201403081815.08829.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <201403081815.08829.arnd@arndb.de>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, linaro-kernel <linaro-kernel@lists.linaro.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, Tanmay Inamdar <tinamdar@apm.com>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 08, 2014 at 05:15:08PM +0000, Arnd Bergmann wrote:
> On Wednesday 05 March 2014, Liviu Dudau wrote:
> > +
> > +	pr_debug("Parsing ranges property...\n");
> > +	for_each_of_pci_range(&parser, &range) {
> > +		/* Read next ranges element */
> > +		pr_debug("pci_space: 0x%08x pci_addr:0x%016llx ",
> > +				range.pci_space, range.pci_addr);
> > +		pr_debug("cpu_addr:0x%016llx size:0x%016llx\n",
> > +					range.cpu_addr, range.size);
> > +
> > +		/*
> > +		 * If we failed translation or got a zero-sized region
> > +		 * then skip this range
> > +		 */
> > +		if (range.cpu_addr =3D=3D OF_BAD_ADDR || range.size =3D=3D 0)
> > +			continue;
> > +
> > +		res =3D kzalloc(sizeof(struct resource), GFP_KERNEL);
> > +		if (!res)
> > +			return -ENOMEM;
> > +
> > +		of_pci_range_to_resource(&range, dev, res);
> > +
> > +		if (resource_type(res) =3D=3D IORESOURCE_IO)
> > +			*io_base =3D range.cpu_addr;
> > +
> > +		pci_add_resource_offset(resources, res,
> > +				res->start - range.pci_addr);
> > +	}
>=20
> As mentioned regarding the pci_register_io_range() helper, x86
> would not enter the 'resource_type(res) =3D=3D IORESOURCE_IO' code pa=
th,
> which on the one hand is fine so we can return an error from
> pci_register_io_range() there, but I think it will lead to
> io_base getting an uninitialized content.
>=20
> There could also be other reasons why pci_register_io_range() fails,
> e.g. because the space is exhausted, and I think we should try to
> catch that here and skip the pci_add_resource_offset() and io_base
> assignment then.

Hi Arnd,

I will try to improve the error handling in the next patchset version.
However I am still confused about the earlier discussion on
pci_register_io_range(). Your suggestion initially was to return an
error in the default weak implementation, but in your last email you
are talking about returning 'port'. My idea when I've introduced the
helper function was that it would return an error if it fails to
register the IO range and zero otherwise. I agree that we can treat
the default 'do nothing with the IO range' case as an error, with
the caveat that will force architectures that use this code to
provide their own implementation of pci_register_io_range() in order
to avoid failure, even for the cases where the architecture has a 1:1
mapping between IO and CPU addresses.

I've just noticed that my home server has silently dropped my reply
to you from the 7th of March, so I'm going to resend it using ARM's
setup.

Best regards,
Liviu


>=20
> 	Arnd
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
