From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH v3 4/4] MIPS: lantiq: update the clock alias' for the
 mainline  PCIe PHY driver
Date: Sat, 24 Aug 2019 14:13:54 +0000
Message-ID: <CY4PR2201MB1272F47798E4002689E89D01C1A70@CY4PR2201MB1272.namprd22.prod.outlook.com>
References: <20190727120415.15859-5-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190727120415.15859-5-martin.blumenstingl@googlemail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "john@phrozen.org" <john@phrozen.org>, "kishon@ti.com" <kishon@ti.com>, Paul Burton <pburton@wavecomp.com>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "hauke@hauke-m.de" <hauke@hauke-m.de>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ms@dev.tdt.de" <ms@dev.tdt.de>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello,

Martin Blumenstingl wrote:
> The mainline PCIe PHY driver has it's own devicetree node. Update the
> clock alias so the mainline driver finds the clocks.
>=20
> The first PCIe PHY is located at 0x1f106800 and exists on VRX200, ARX300
> and GRX390.
> The second PCIe PHY is located at 0x1f700400 and exists on ARX300 and
> GRX390.
> The third PCIe PHY is located at 0x1f106a00 and exists onl on GRX390.
> Lantiq's board support package (called "UGW") names these registers
> "PDI".

Applied to mips-next.

> commit ed90302be64a
> https://git.kernel.org/mips/c/ed90302be64a
>=20
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
