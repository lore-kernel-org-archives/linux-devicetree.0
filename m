From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v3 2/5] ARM: dts: pxa: add clocks
Date: Mon, 09 Feb 2015 20:56:12 +0100
Message-ID: <87egpy7tb7.fsf@free.fr>
References: <1423312760-15871-1-git-send-email-robert.jarzmik@free.fr>
	<1423312760-15871-2-git-send-email-robert.jarzmik@free.fr>
	<54D60B79.5060206@cogentembedded.com> <87a90p9815.fsf@free.fr>
	<54D64BBE.9080704@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54D64BBE.9080704@cogentembedded.com> (Sergei Shtylyov's message
	of "Sat, 07 Feb 2015 20:30:38 +0300")
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> +		ffuart: uart@40100000 {
> +			clocks = <&pxa2xx_clks CLK_FFUART>;
> +		};
> +

After another thought about your "one line" node, I think this can be even
improved, so that :
 - uart clocks are put into pxa2xx.dtsi instead of pxa27x.dtsi
 - replace all pxa2xx_clks by clks
 - let pxa27x.dtsi, pxa3xx.dtsi declare the clks label

This way we'll have :
 - pxa2xx.dtsi
		ffuart: uart@40100000 {
                        compatible = ...
                        ...
			clocks = <&clks CLK_FFUART>;
		};
 - pxa27x.dtsi
                clks: pxa2xx_clks@41300004 {
                        compatible = "marvell,pxa270-clocks";
                        #clock-cells = <1>;
                        status = "okay";
                };
 - pxa3xx.dtsi
                clks: pxa3xx_clks@41300004 {
                        compatible = "marvell,pxa300-clocks";
                        #clock-cells = <1>;
                        status = "okay";
                };

Cheers.

-- 
Robert
