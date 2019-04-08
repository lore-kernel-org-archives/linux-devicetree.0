Return-Path: <SRS0=7idE=SK=gmail.com=kwizart@kernel.org>
MIME-Version: 1.0
References: <20190404112511.28118-1-thierry.reding@gmail.com> <20190404112511.28118-8-thierry.reding@gmail.com>
In-Reply-To: <20190404112511.28118-8-thierry.reding@gmail.com>
From: Nicolas Chauvet <kwizart@gmail.com>
Date: Mon, 8 Apr 2019 09:50:55 +0200
Message-ID: <CABr+WTnYrGGRUP8_mAtxfob+-fFhM8GeRka2VFyD+vf=zY7R9g@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] arm64: tegra: Add NVIDIA Jetson Nano Developer Kit support
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Le jeu. 4 avr. 2019 =C3=A0 13:25, Thierry Reding <thierry.reding@gmail.com>=
 a =C3=A9crit :
>
> From: Thierry Reding <treding@nvidia.com>
>
> The Jetson Nano Developer Kit is a Tegra X1 based development board. It
> is similar to Jetson TX1 but it is not pin compatible. It features 4 GB
> of LPDDR4, an SPI NOR flash for early boot firmware and an SD card slot
> used for storage.
>
> HDMI 2.0 or DP 1.2 are available for display, four USB ports (3 USB 2.0
> and 1 USB 3.0) can be used to attach a variety of peripherals and a PCI
> Ethernet controller provides onboard network connectivity.
>
> A 40-pin header on the board can be used to extend the capabilities and
> exposed interfaces of the Jetson Nano.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - add obsolete PCIe and XUSB power supplies for backwards compatibility
> - remove pinmux node
>
>  arch/arm64/boot/dts/nvidia/Makefile           |   1 +
>  .../boot/dts/nvidia/tegra210-p3450-0000.dts   | 648 ++++++++++++++++++
>  2 files changed, 649 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
>
> diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/nv=
idia/Makefile
> index 6b8ab5568481..bcd018c3162b 100644
> --- a/arch/arm64/boot/dts/nvidia/Makefile
> +++ b/arch/arm64/boot/dts/nvidia/Makefile
> @@ -3,6 +3,7 @@ dtb-$(CONFIG_ARCH_TEGRA_132_SOC) +=3D tegra132-norrin.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D tegra210-p2371-0000.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D tegra210-p2371-2180.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D tegra210-p2571.dtb
> +dtb-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D tegra210-p3450-0000.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D tegra210-smaug.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D tegra210-p2894-0050-a08.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_186_SOC) +=3D tegra186-p2771-0000.dtb
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/ar=
m64/boot/dts/nvidia/tegra210-p3450-0000.dts
> new file mode 100644
> index 000000000000..895c829183b2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> @@ -0,0 +1,648 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +
> +#include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include <dt-bindings/mfd/max77620.h>
> +
> +#include "tegra210.dtsi"
> +
> +/ {
> +       model =3D "NVIDIA Jetson Nano Developer Kit";
> +       compatible =3D "nvidia,p3450-0000", "nvidia,tegra210";
> +
> +       aliases {
> +               ethernet =3D "/pcie@1003000/pci@2,0/ethernet@0,0";
> +               rtc0 =3D "/i2c@7000d000/pmic@3c";
> +               rtc1 =3D "/rtc@7000e000";
> +               serial0 =3D &uarta;
> +       };
> +
> +       chosen {
> +               stdout-path =3D "serial0:115200n8";
> +       };
> +
> +       memory {
> +               device_type =3D "memory";
> +               reg =3D <0x0 0x80000000 0x1 0x0>;
> +       };
> +
> +       pcie@1003000 {
> +               status =3D "okay";
> +
> +               avdd-pll-uerefe-supply =3D <&avdd_pex_1v05>;
When trying to apply this serie on top of kernel 5.1-rc3, I have
ERROR (phandle_references): /pcie@1003000: Reference to non-existent
node or label "avdd_pex_1v05"
I haven't seen any reference of avdd_pex_1v05 in the tegra mailing
list, so I assume it should be changed to vdd_pex_1v05 instead
(without the leading "a").

Also the dt-binding from this serie doesn't apply, so I suspect a
missing change in-between ?

Thx




--
-

Nicolas (kwizart)
