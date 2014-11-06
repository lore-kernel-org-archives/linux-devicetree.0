From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v2] PCI: add missing DT binding for linux,pci-domain
 property
Date: Thu, 6 Nov 2014 15:40:50 +0000
Message-ID: <20141106154050.GW8916@e106497-lin.cambridge.arm.com>
References: <1415287400-30426-1-git-send-email-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1415287400-30426-1-git-send-email-l.stach@pengutronix.de>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 06, 2014 at 03:23:20PM +0000, Lucas Stach wrote:
> This property was added by 41e5c0f81d3e
> (of/pci: Add pci_get_new_domain_nr() and of_get_pci_domain_nr())
> without the required binding documentation. As this property
> will be supported by a number of host bridge drivers going forward,
> add it to the common PCI binding doc.
>=20
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
> This is a non-critical fix, but may still qualify for 3.18-rc as
> the property was added in this release cycle.
>=20
> v2:
> - emphasize that the property must be present and unique systemwide
>   if used
> ---
>  Documentation/devicetree/bindings/pci/pci.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pci/pci.txt b/Document=
ation/devicetree/bindings/pci/pci.txt
> index 41aeed38926d..68c364e2f5e5 100644
> --- a/Documentation/devicetree/bindings/pci/pci.txt
> +++ b/Documentation/devicetree/bindings/pci/pci.txt
> @@ -7,3 +7,14 @@ And for the interrupt mapping part:
> =20
>  Open Firmware Recommended Practice: Interrupt Mapping
>  http://www.openfirmware.org/1275/practice/imap/imap0_9d.pdf
> +
> +Additionally to the properties specified in the above standards a ho=
st bridge
> +driver implementation may support the following properties:
> +
> +- linux,pci-domain:
> +   If present this property assigns a fixed PCI domain number to a h=
ost bridge,
> +   otherwise an unstable (across boots) unique number will be assign=
ed.
> +   It is required to either not set this property at all or set it f=
or all
> +   host bridges in the system, otherwise potentially conflicting dom=
ain numbers
> +   may be assigned to root buses behind different host bridges. The =
domain
> +   number for each host bridge in the system must be unique.
> --=20
> 2.1.1
>=20
>=20

Acked-by: Liviu Dudau <Liviu.Dudau@arm.com>

Liviu

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
