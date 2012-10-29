From: viresh kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 09/15] SPEAr13xx: dts: Fix PCIe core address ranges
Date: Mon, 29 Oct 2012 18:53:17 +0530
Message-ID: <CAOh2x==TQ=6-9M7p8DD0qZepQzSZAdv-mNPu-pOUynb99ODWDw@mail.gmail.com>
References: <cover.1351492562.git.pratyush.anand@st.com>
	<6ed9683e3149a640b4333cf3039ae31063b23e3b.1351492562.git.pratyush.anand@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <6ed9683e3149a640b4333cf3039ae31063b23e3b.1351492562.git.pratyush.anand@st.com>
Sender: linux-pci-owner@vger.kernel.org
To: Pratyush Anand <pratyush.anand@st.com>
Cc: arnd@arndb.de, shiraz.hashim@st.com, spear-devel@list.st.com, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, olof@lixom.net
List-Id: devicetree@vger.kernel.org

On Mon, Oct 29, 2012 at 12:31 PM, Pratyush Anand <pratyush.anand@st.com> wrote:
> Each PCIe controller has 256 MB of address space whcih is accessible by
> AHB and used to communicate with PCIe devices connected with the host
> controller.

you haven't said what you have done here in this patch. i.e. extend AHB range
to include pcie space.

> Signed-off-by: Pratyush Anand <pratyush.anand@st.com>
> ---
>  arch/arm/boot/dts/spear13xx.dtsi |    9 +++++----
>  1 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/spear13xx.dtsi b/arch/arm/boot/dts/spear13xx.dtsi
> index 9ff4f5f..b7990754 100644
> --- a/arch/arm/boot/dts/spear13xx.dtsi
> +++ b/arch/arm/boot/dts/spear13xx.dtsi
> @@ -76,7 +76,8 @@
>                 #size-cells = <1>;
>                 compatible = "simple-bus";
>                 ranges = <0x50000000 0x50000000 0x10000000
> -                         0xb0000000 0xb0000000 0x10000000
> +                         0x80000000 0x80000000 0x20000000
> +                         0xb0000000 0xb0000000 0x20000000
>                           0xd0000000 0xd0000000 0x02000000
>                           0xd8000000 0xd8000000 0x01000000
>                           0xe0000000 0xe0000000 0x10000000>;
> @@ -194,7 +195,7 @@
>                 pcie0@b1000000 {
>                         compatible = "st,pcie-gadget", "st,pcie-host" ;
>                         reg = < 0xb1000000 0x4000
> -                               0x80000000 0x2000
> +                               0x80000000 0x10000000
>                                 0xeb800000 0x1000 >;
>                         interrupts = <0 68 0x4>;
>                         status = "disabled";

That's a blunder. I am damn sure, you haven't rebased it
on any rc. And you have rebased it on your local next.

There is no pci support in upstream kernel.

--
viresh
