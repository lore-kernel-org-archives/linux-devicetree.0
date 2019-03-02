From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v2] dts: arm64: add CoreSight trace support for hi3660
Date: Sat, 2 Mar 2019 20:59:55 +0800
Message-ID: <20190302125955.GA11385@leoy-ThinkPad-X240s>
References: <6496F4728C09F6479CFF21A8E67D33D568F32660@dggema525-mbx.china.huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <6496F4728C09F6479CFF21A8E67D33D568F32660@dggema525-mbx.china.huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shiwanglai <shiwanglai@hisilicon.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "coresight@lists.linaro.org" <coresight@lists.linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "john.stultz@linaro.org" <john.stultz@linaro.org>, "xuwei (O)" <xuwei5@huawei.com>, Suzhuangluan <suzhuangluan@hisilicon.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 02, 2019 at 09:45:22AM +0000, Shiwanglai wrote:

[...]

> > +		/* Top internals */
> > +		funnel@ec031000 {
> > +			compatible = "arm,coresight-funnel", "arm,primecell";
> > +			reg = <0 0xec031000 0 0x1000>;
> > +			clocks = <&crg_ctrl HI3660_PCLK>;
> > +			clock-names = "apb_pclk";
> > +
> > +			out-ports {
> > +				port {
> > +					top_funnel_out: endpoint {
> > +						remote-endpoint =
> > +							<&top_etf_in>;
> > +					};
> > +				};
> > +			};
> > +
> > +			in-ports {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +
> > +				port@0 {
> > +					reg = <0>;
> > +					top_funnel_in0: endpoint {
> > +						remote-endpoint =
> > +							<&cluster0_etf_out>;
> > +					};
> > +				};
> > +
> > +				port@1 {
> > +					reg = <0>;
> 
> Here should s/<0>/<1>; otherwise DTC will complain warning for mismatching between 'port@1' and 'reg = <0>'.

> -- if reg set to 1, then there's no data output from cluster 1 to top.

Thanks for the info, Wanglai.  Now I see why write as it is.

I can confirm if directly use your patch with perf with mainline
kernel I can capture CoreSight trace data successfully on Hikey960
board.

But since this DT binding will introduce DTC warning, I personally
think we can improve for this with below method:

We can create a funnel node named "funnel_combo", and we don't need to
specify register address range for it; and cluster 0 and cluster 1 will
output to "funnel_combo" and "funnel_combo" will output to the top
funnel.  Thus the DT binding will write as below.

To support for a funnel without any register address range (we have
support replicator like this mode), we also need to extend the driver
drivers/hwtracing/coresight/coresight-funnel.c.

Mathieu, Mike, Suzuki, could you help confirm this is the right
direction we should move forward to?

---8<---
	/* An invisible combo funnel between clusters and top funnel */
	funnel_combo {
		compatible = "arm,coresight-funnel";
		clocks = <&crg_ctrl HI3660_PCLK>;
		clock-names = "apb_pclk";

		out-ports {
			port {
				combo_funnel_out: endpoint {
					remote-endpoint =
						<&top_funnel_in>;
				};
			};
		};

		in-ports {
			#address-cells = <1>;
			#size-cells = <0>;

			port@0 {
				reg = <0>;
				combo_funnel_in0: endpoint {
					remote-endpoint =
						<&cluster0_etf_out>;
				};
			};

			port@1 {
				reg = <1>;
				combo_funnel_in1: endpoint {
					remote-endpoint =
						<&cluster1_etf_out>;
				};
			};
		};
	};

	/* Top internals */
	funnel@ec031000 {
		compatible = "arm,coresight-funnel", "arm,primecell";
		reg = <0 0xec031000 0 0x1000>;
		clocks = <&crg_ctrl HI3660_PCLK>;
		clock-names = "apb_pclk";

		out-ports {
			port {
				top_funnel_out: endpoint {
					remote-endpoint =
						<&top_etf_in>;
				};
			};
		};

		in-ports {
			#address-cells = <1>;
			#size-cells = <0>;

			port@0 {
				reg = <0>;
				top_funnel_in: endpoint {
					remote-endpoint =
						<&combo_funnel_out>;
				};
			};
		};
	};

--->8---

[...]

Thanks,
Leo Yan
