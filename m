From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [RFC PATCH 11/11] arm/versatile: Add device tree support
Date: Fri, 17 Jun 2011 09:11:16 +0800
Message-ID: <20110617011115.GC10154@S2100-06.ap.freescale.net>
References: <20110616042653.29371.2052.stgit@ponder>
 <20110616044311.29371.49018.stgit@ponder>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110616044311.29371.49018.stgit@ponder>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 15, 2011 at 10:43:18PM -0600, Grant Likely wrote:
[...]
> diff --git a/arch/arm/boot/dts/versatile-ab.dts b/arch/arm/boot/dts/versatile-ab.dts
> new file mode 100644
> index 0000000..0e31dc9
> --- /dev/null
> +++ b/arch/arm/boot/dts/versatile-ab.dts
> @@ -0,0 +1,185 @@
> +/dts-v1/;
> +/include/ "skeleton.dtsi"
> +
> +/ {
> +	model = "ARM Versatile AB";
> +	compatible = "arm,versatile-ab";
> +	#address-cells = <1>;
> +	#size-cells = <1>;

We already have above two line in skeleton.dtsi.

> +	interrupt-parent = <&vic>;

-- 
Regards,
Shawn
