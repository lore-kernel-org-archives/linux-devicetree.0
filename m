From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-mtp: Add WCN3990 BT node
Date: Thu, 17 Jan 2019 13:55:59 -0800
Message-ID: <20190117215559.GC12955@builder>
References: <20190117044006.12463-1-bjorn.andersson@linaro.org>
 <20190117192812.GV261387@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190117192812.GV261387@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Balakrishna Godavarthi <bgodavar@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Thu 17 Jan 11:28 PST 2019, Matthias Kaehlcke wrote:

> On Wed, Jan 16, 2019 at 08:40:06PM -0800, Bjorn Andersson wrote:
[..]
> > +&qup_uart6_default {
> > +	pinmux {
> > +		pins = "gpio45", "gpio46", "gpio47", "gpio48";
> > +		function = "qup6";
> > +	};
> > +
> > +	ctsrx {
> > +		pins = "gpio45", "gpio48";
> > +		drive-strength = <2>;
> 
> CTS and RX are input signals, no need to configure drive strength in
> this case IIUC.
> 

Right, didn't think that far when I hacked this up.

> > +		bias-no-pull;
> 
> On another SDM845 based device we observe garbage on RX at
> initialization time, unless we enable a pull-up.
> 
> > +	};
> > +
> > +	rts {
> > +		pins = "gpio46";
> > +		drive-strength = <2>;
> > +		bias-pull-down;
> > +	};
> 
> On our device we don't configure a pull on the lines driven by the
> AP. I think a pull-down on RTS should be fine though since it matches
> the pull (during reset) on CTS of the BT module.
> 
> > +	tx {
> > +		pins = "gpio47";
> > +		drive-strength = <2>;
> > +		bias-pull-up;
> > +	};
> > +};
> 
> Similar to RTS, the pull matches the one on RXD of the BT module.
> 
> For reference, this is what we currently use on our device:
> 
> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1391888/3/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> 

Thanks, I will update the patch.

Regards,
Bjorn
