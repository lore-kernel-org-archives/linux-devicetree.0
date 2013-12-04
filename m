From: Alex Elder <alex.elder@linaro.org>
Subject: Re: [PATCH 1/3] clk: bcm281xx: define kona clock binding
Date: Wed, 04 Dec 2013 10:24:00 -0600
Message-ID: <529F5720.5040601@linaro.org>
References: <529EA78E.7060904@linaro.org> <529EA80A.60801@linaro.org> <20131204093911.GE16025@e106331-lin.cambridge.arm.com> <529F23EC.20306@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <529F23EC.20306@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Christian Daudt <bcm@fixthebug.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <Pawel.Moll@arm.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Mike Turquette <mturquette@linaro.org>, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 12/04/2013 06:45 AM, Alex Elder wrote:
>>> +Device tree example:
>>> >> +
>>> >> +	clocks {
>>> >> +		slave_ccu: slave_ccu {
>>> >> +			compatible = "brcm,bcm11351-slave-ccu";
>>> >> +			reg = <0x3e011000 0x0f00>;
>>> >> +			#clock-cells = <1>;
>>> >> +			clock-output-names = "uartb",
>>> >> +					     "uartb2",
>>> >> +					     "uartb3",
>>> >> +					     "uartb4";
>>> >> +		};
>>> >> +		ref_crystal_clk: ref_crystal {
>>> >> +			#clock-cells = <0>;
>>> >> +			compatible = "fixed-clock";
>>> >> +			clock-frequency = <26000000>;
>>> >> +		};
>>> >> +	};
>> > 
>> > This is wrong, as the clocks container node us not defined as any type
>> > of bus, and does not have the requisite #address-cells and #size-cells.
> Sorry, I didn't realize it was wrong.  I intentionally used
> it simply for groiuping.

I should have looked at my actual dtsi file before responding.

It turns out that what was shown there was not complete.  The
dtsi file in fact does contain #address-cells and #size-cells
(and a direct-mapping "ranges" property).

I have removed the enclosing "clocks" node and its braces in
the document.  I have not removed the node from the dtsi file.

					-Alex
