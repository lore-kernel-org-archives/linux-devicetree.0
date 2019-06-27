From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: Update DWC3 modules on RK3399 SoCs
Date: Thu, 27 Jun 2019 14:42:46 +0200
Message-ID: <1960228.jn0vabPeDx@phil>
References: <20190613162745.12195-1-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613162745.12195-1-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: devicetree@vger.kernel.org, Collabora Kernel ML <kernel@collabora.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, Vicente Bergas <vicencb@gmail.com>, Klaus Goger <klaus.goger@theobroma-systems.com>, Christoph Muellner <christoph.muellner@theobroma-systems.com>, Randy Li <ayaka@soulik.info>, Tony Xie <tony.xie@rock-chips.com>, Viresh Kumar <viresh.kumar@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 13. Juni 2019, 18:27:45 CEST schrieb Enric Balletbo i Serra:
> As per binding documentation [1], the DWC3 core should have the "ref",
> "bus_early" and "suspend" clocks. As explained in the binding, those
> clocks are required for new platforms but not for existing platforms
> before commit fe8abf332b8f ("usb: dwc3: support clocks and resets for
> DWC3 core").
> 
> However, as those clocks are really treated as required, this ends with
> having some annoying messages when the "rockchip,rk3399-dwc3" is used:
> 
> [    1.724107] dwc3 fe800000.dwc3: Failed to get clk 'ref': -2
> [    1.731893] dwc3 fe900000.dwc3: Failed to get clk 'ref': -2
> [    2.495937] dwc3 fe800000.dwc3: Failed to get clk 'ref': -2
> [    2.647239] dwc3 fe900000.dwc3: Failed to get clk 'ref': -2
> 
> In order to remove those annoying messages, update the DWC3 hardware
> module node and add all the required clocks. With this change, both, the
> glue node and the DWC3 core node, have the clocks defined, but that's
> not really a problem and there isn't a side effect on do this. So, we
> can get rid of the annoying get clk error messages.
> 
> [1] Documentation/devicetree/bindings/usb/dwc3.txt
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

applied for 5.3

Thanks
Heiko
