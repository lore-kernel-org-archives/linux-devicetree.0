From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH 05/13] clk: qcom: apcs-msm8916: get parent clock names
 from DT
Date: Tue, 18 Dec 2018 15:35:03 +0100
Message-ID: <20181218143503.GA32562@centauri.ideon.se>
References: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1545039990-19984-6-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <154508986359.19322.1555129141976726505@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <154508986359.19322.1555129141976726505@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, jassisinghbrar@gmail.com, jorge.ramirez-ortiz@linaro.org, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, will.deacon@arm.com, bjorn.andersson@linaro.org, vkoul@kernel.org, sibis@codeaurora.org, georgi.djakov@linaro.org, arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de, enric.balletbo@collabora.com, jagan@amarulasolutions.com, olof@lixom.net, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 17, 2018 at 03:37:43PM -0800, Stephen Boyd wrote:
> Quoting Jorge Ramirez-Ortiz (2018-12-17 01:46:22)
> > Allow accessing the parent clock names required for the driver
> > operation by using the device tree node.
> > 
> > This permits extending the driver to other platforms without having to
> > modify its source code.
> > 
> > For backwards compatibility leave previous values as default.
> 
> Why do we need to maintain backwards compatibility? Isn't is required
> that the nodes have clocks properties?
> 

Hello Stephen,


This is the existing DT nodes for msm8916:

               a53pll: clock@b016000 {
                        compatible = "qcom,msm8916-a53pll";
                        reg = <0xb016000 0x40>;
                        #clock-cells = <0>;
                };

                apcs: mailbox@b011000 {
                        compatible = "qcom,msm8916-apcs-kpss-global", "syscon";
                        reg = <0xb011000 0x1000>;
                        #mbox-cells = <1>;
                        clocks = <&a53pll>;
                        #clock-cells = <0>;
                };


This is the (suggested) DT nodes for qcs404:

                apcs_hfpll: clock-controller@0b016000 {
                        compatible = "qcom,hfpll";
                        reg = <0x0b016000 0x30>;
                        #clock-cells = <0>;
                        clock-output-names = "apcs_hfpll";
                        clocks = <&xo_board>;
                        clock-names = "xo";
                };

                apcs_glb: mailbox@b011000 {
                        compatible = "qcom,qcs404-apcs-apps-global", "syscon";
                        reg = <0x0b011000 0x1000>;
                        #mbox-cells = <1>;
                        clocks = <&gcc GCC_GPLL0_AO_OUT_MAIN>, <&apcs_hfpll>;
                        clock-names = "aux", "pll";
                        #clock-cells = <0>;
                };

qcs404 specifies two clocks, with an accompanied clock-name for each clock.

msm8916 specifies a single clock, without an accompanied clock-name.

It is possible to append clock-names = "pll" for the existing clock,
as well as to define the aux clock in the apcs node in the msm8916 DT:
clocks = <&gcc GPLL0_VOTE>;
clock-names = "aux";

However, since the DT is treated as an ABI, the existing DT for msm8916 must
still work, so I don't think that it is possible to ignore having backwards
compability in the apcs clock driver.


Kind regards,
Niklas
