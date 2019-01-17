From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-mtp: Add WCN3990 BT node
Date: Thu, 17 Jan 2019 13:53:24 -0800
Message-ID: <20190117215323.GB12955@builder>
References: <20190117044006.12463-1-bjorn.andersson@linaro.org>
 <aebd3bbb4bb3faac2570244af610b43d@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <aebd3bbb4bb3faac2570244af610b43d@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Balakrishna Godavarthi <bgodavar@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

On Wed 16 Jan 22:10 PST 2019, Balakrishna Godavarthi wrote:

> Hi Anderson,
> 
> On 2019-01-17 10:10, Bjorn Andersson wrote:
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
> > +		bias-no-pull;
> > +	};
> > +
> > +	rts {
> > +		pins = "gpio46";
> > +		drive-strength = <2>;
> > +		bias-pull-down;
> > +	};
> > +
> > +	tx {
> > +		pins = "gpio47";
> > +		drive-strength = <2>;
> > +		bias-pull-up;
> > +	};
> > +};
> > +
> >  &qup_uart9_default {
> >  	pinconf-tx {
> >  		pins = "gpio4";
> 
> 
> [Bala]:
>        GPIO 45 is CTS
>        GPIO 46 is RTS
>        GPIO 47 is Tx
>        GPIO 48 is Rx.
> 
>        Tx & RTS are inputs to APPS processor, bias should be disable as the
> source i.e. BT chip will pull them up.
>        CTS & RX are outputs from APPS processor, where as CTS is GPIO which
> need to toggled, so the default state should be pull down.
>              RX is should be pulled up.
>        when TX & RX are pulled high it indicates that the lines are ideal
> i.e. no data.
> 
> Above is just my assumption, not sure whether they work on MTP.
> 

I will update and verify.

Thanks,
Bjorn
