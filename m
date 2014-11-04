From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH] PCI: add missing DT binding for linux,pci-domain property
Date: Tue, 4 Nov 2014 12:00:52 +0000
Message-ID: <20141104120052.GE11102@e106497-lin.cambridge.arm.com>
References: <1415101660-26450-1-git-send-email-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1415101660-26450-1-git-send-email-l.stach@pengutronix.de>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 04, 2014 at 11:47:40AM +0000, Lucas Stach wrote:
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

Hi Lucas,

Thanks for taking care of this, sorry it slipped through the cracks
of last minute changes in this area.

> ---
>  Documentation/devicetree/bindings/pci/pci.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pci/pci.txt b/Document=
ation/devicetree/bindings/pci/pci.txt
> index 41aeed38926d..b754f786ed5e 100644
> --- a/Documentation/devicetree/bindings/pci/pci.txt
> +++ b/Documentation/devicetree/bindings/pci/pci.txt
> @@ -7,3 +7,13 @@ And for the interrupt mapping part:
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
> +   It is recommended to either not set this property at all or set i=
t for all
> +   host bridges in the system, otherwise potentially conflicting dom=
ain numbers
> +   may be assigned to root buses behind different host bridges.
> --=20
> 2.1.1
>=20

While the description is potentially correct, what it fails to explain =
is that the
choice of using the property or generating an unstable (across boots) u=
nique
number is actually the choice of the host bridge driver at the moment. =
I know that
my earlier implementations were defaulting to the automatic numbering, =
but that has
been dropped from the final series as Rob Herring was objecting to it.

There is still scope to adopt a wide policy here, but for now it should=
 say something
to the tune:

   If present this property assigns a fixed PCI domain number to a host=
 bridge,
   otherwise an unstable (across boots) unique number will be assigned.
   If you decide to use the property to assign a fixed PCI domain numbe=
r to a host
   bridge you have to ensure that all the host bridge drivers present i=
n the system
   follow the same policy. Otherwise, potentially conflicting domain nu=
mbers
   may be assigned to root busses behind different host bridges.

Best regards,
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
