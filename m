From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v3 2/6] arm: dts: add Artpec-6 SoC dtsi file
Date: Wed, 24 Feb 2016 16:29:08 -0800
Message-ID: <20160225002908.GD10126@localhost>
References: <cover.1455205057.git.larper@axis.com>
 <9d3b8e80eeb56ca0808aae62eabd82af23ddb5c5.1455205057.git.larper@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9d3b8e80eeb56ca0808aae62eabd82af23ddb5c5.1455205057.git.larper@axis.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lars Persson <lars.persson@axis.com>
Cc: arm@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org, Lars Persson <larper@axis.com>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 11, 2016 at 05:06:17PM +0100, Lars Persson wrote:
> Initial device tree for the Artpec-6 SoC.
> 
> Signed-off-by: Lars Persson <larper@axis.com>
> ---
>  arch/arm/boot/dts/artpec6.dtsi | 236 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 236 insertions(+)
>  create mode 100644 arch/arm/boot/dts/artpec6.dtsi
> 
> diff --git a/arch/arm/boot/dts/artpec6.dtsi b/arch/arm/boot/dts/artpec6.dtsi
> new file mode 100644
> index 0000000..f2a7e4a
> --- /dev/null
> +++ b/arch/arm/boot/dts/artpec6.dtsi
> @@ -0,0 +1,236 @@
> +/*
> + * Device Tree Source for the Axis ARTPEC-6 SoC
> + *
> + * This file is licensed under the terms of the GNU General Public License
> + * version 2.  This program is licensed "as is" without any warranty of any
> + * kind, whether express or implied.
> + */

I just realized these are GPL-only. We try to get most DTS/DTSI files dual
licensed now so that they can be separated from the linux kernel and used in
other projects. You can see the boilerplate used by other platforms in the same
directory.

I'd appreciate a patch that changed the licensing (it can be done on top of
this, since I already applied the patches we might as well keep them and fix
incrementally).

(Let me know if your corporate lawyers are giving you a hard time over this,
I'd be happy to talk to them to explain if needed).


-Olof
