From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-am654-base-board: Add MMC/SD
 support
Date: Sat, 8 Dec 2018 09:54:27 -0600
Message-ID: <20181208155427.jmidz4vsw4k4qj36@akan>
References: <20181207084233.13700-1-faiz_abbas@ti.com>
 <20181207084233.13700-3-faiz_abbas@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20181207084233.13700-3-faiz_abbas@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Faiz Abbas <faiz_abbas@ti.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, ulf.hansson@linaro.org, linux-kernel@vger.kernel.org, kishon@ti.com, t-kristo@ti.com, robh+dt@kernel.org, adrian.hunter@intel.com, michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 14:12-20181207, Faiz Abbas wrote:

> +
> +&sdhci0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_mmc0_pins_default>;
> +	bus-width = <8>;
> +	non-removable;
> +	ti,driver-strength-ohm = <50>;

^^

> +};
> +
> +&sdhci1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_mmc1_pins_default>;
> +	ti,driver-strength-ohm = <50>;

NAK.

$ git checkout next-20181207
$ git grep ti,driver-strength-ohm Documentation
$

Nada.. And.. I think "new phy binding" probably introduces this.
[1] https://patchwork.kernel.org/project/linux-mmc/list/?series=53185

If your patches are'nt really ready, please send them as RFC, I am not
really in a mood to track the status of every single driver subsystem.

If your binding is not in linux next at the baremin, as far as I am
concerned, this is not ready, and should be RFC.

-- 
Regards,
Nishanth Menon
