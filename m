From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH] of/pci: add pci_pio_to_address dummy for !CONFIG_OF
Date: Tue, 30 Sep 2014 16:42:02 +0100
Message-ID: <20140930154201.GR841@e106497-lin.cambridge.arm.com>
References: <706416181.hbVGLDA3o6@wuerfel>
 <20140930144506.GQ841@e106497-lin.cambridge.arm.com>
 <2033939.5UfzeSiRKs@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <2033939.5UfzeSiRKs@wuerfel>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Rob Herring <robh@kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 30, 2014 at 04:15:19PM +0100, Arnd Bergmann wrote:
> On Tuesday 30 September 2014 15:45:06 Liviu Dudau wrote:
> >=20
> > Acked-by: Liviu Dudau <Liviu.Dudau@arm.com>
> >=20
> > Is that triggered by shmobile_defconfig?
> >=20
> >=20
>=20
> No, I only found it using randconfig testing, shmobile enables CONFIG=
_OF by
> default.

Hmm, I was looking at who defines CONFIG_PCI_RCAR_GEN2_PCIE and it's on=
ly
present in shmobile_defconfig, but that one does not select any OF opti=
ons (other
than CONFIG_ARM_APPENDED_DTB). So there is no way of triggering this ot=
her
than by randconfig?

Best regards,
Liviu

>=20
> 	Arnd
>=20
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
