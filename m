From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [RFC] (early draft) dt: Linux dt usage model documentation
Date: Fri, 17 Jun 2011 00:26:01 +0800
Message-ID: <20110616162600.GA9611@S2100-06.ap.freescale.net>
References: <20110613132935.16600.94753.stgit@ponder>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110613132935.16600.94753.stgit@ponder>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 13, 2011 at 07:32:15AM -0600, Grant Likely wrote:
[...]
> +About now is a good time to lay out an example.  Here is part of the
> +device tree for the NVIDIA Tegra board.
> +
> +/{
> +	compatible = "nvidia,harmony", "nvidia,tegra250";
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	interrupt-parent = <&intc>;
> +
> +	chosen { };
> +	aliases { };
> +
> +	memory {
> +		device_type = "memory";
> +		reg = <0x00000000 0x40000000>;
> +	};
> +
> +	soc {
> +		compatible = "nvidia,tegra250-soc", "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		intc: interrupt-controller@50041000 {
> +			compatible = "nvidia,tegra250-gic";
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +			reg = <0x50041000 0x1000>, < 0x50040100 0x0100 >;
> +		};
> +
> +		serial@70006300 {
> +			compatible = "nvidia,tegra250-uart";
> +			reg = <0x70006300 0x100>;
> +			interrupts = <122>;
> +		};
> +
> +		i2s-1: i2s@70002800 {

It seem dtc does not compile the label name "i2s-1".  Instead,
"i2s_1" seems good.

> +			compatible = "nvidia,tegra250-i2s";
> +			reg = <0x70002800 0x100>;
> +			interrupts = <77>;
> +			codec = <&wm8903>;
> +		};
> +
> +		i2c@7000c000 {
> +			compatible = "nvidia,tegra250-i2c";
> +			#address-cells = <1>;
> +			#size-cells = <1>;

#size-cells should be 0 ...

> +			reg = <0x7000c000 0x100>;
> +			interrupts = <70>;
> +
> +			wm8903: codec@1a {
> +				compatible = "wlf,wm8903";
> +				reg = <0x1a>;

... Otherwise, reg needs a size here.

> +				interrupts = <347>;
> +			};
> +		};
> +	};
> +
> +	sound {
> +		compatible = "nvidia,harmony-sound";
> +		i2s-controller = <&i2s-1>;
> +		i2s-codec = <&wm8903>;
> +	};
> +};
> +

-- 
Regards,
Shawn
