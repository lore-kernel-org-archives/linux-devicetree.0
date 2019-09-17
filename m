From: Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH RFC 05/14] dt-bindings/interrupt-controller: pdc: add SPI
 config register
Date: Tue, 17 Sep 2019 15:50:20 -0600
Message-ID: <20190917215020.GA15853@codeaurora.org>
References: <20190829181203.2660-1-ilina@codeaurora.org>
 <20190829181203.2660-6-ilina@codeaurora.org>
 <5d6d1b72.1c69fb81.ee88.efcf@mx.google.com>
 <102c9268-c4ce-6133-3b0a-67c2fcba1e7a@arm.com>
 <20190903170722.GA31716@codeaurora.org>
 <5d71a247.1c69fb81.2146f.7ed2@mx.google.com>
 <20190913195326.GA3293@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190913195326.GA3293@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Rob Herring <robh@kernel.org>, evgreen@chromium.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, mkshah@codeaurora.org, linux-gpio@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, maz@kernel.org, sibis@codeaurora.org
List-Id: devicetree@vger.kernel.org

Adding Sibi

On Fri, Sep 13 2019 at 13:53 -0600, Lina Iyer wrote:
>Sorry, I couldn't get to this earlier.
>
>On Thu, Sep 05 2019 at 18:03 -0600, Stephen Boyd wrote:
>>Quoting Lina Iyer (2019-09-03 10:07:22)
>>>On Mon, Sep 02 2019 at 07:58 -0600, Marc Zyngier wrote:
>>>>On 02/09/2019 14:38, Rob Herring wrote:
>>>>> On Thu, Aug 29, 2019 at 12:11:54PM -0600, Lina Iyer wrote:
>>>These are not GIC registers but located on the PDC interface to the GIC.
>>>They may or may not be secure access controlled, depending on the SoC.
>>>
>>
>>It looks like it falls under this "mailbox" device which is really the
>>catch all bucket for bits with no home besides they're related to the
>>apps CPUs/subsystem.
>>
>Thanks for pointing to this.
>>	apss_shared: mailbox@17990000 {
>>		compatible = "qcom,sdm845-apss-shared";
>>		reg = <0 0x17990000 0 0x1000>;
>But this doesn't seem correct. The registers in this page are all not
>mailbox door bell registers. We should restrict the space allocated to
>the mbox to 0xC or something, definitely, not the whole page. They all
>cannot be treated as a mailbox registers.
>>		#mbox-cells = <1>;
>>	};
>>
>>Can you point to this node with a phandle and then parse the reg
>>property out of it to use in the scm readl/writel APIs? Maybe it can be
>>a two cell property with <&apps_shared 0xf0> to indicate the offset to
>>the registers to read/write? In non-secure mode presumably we need to
>>also write these registers? Good news is that there's a regmap for this
>>driver already, so maybe that can be acquired from the pdc driver.
>>
>The register space collection seems to be mix of different types of
>application processor registers that should probably not be grouped up
>under one subsystem. A single regmap doesn't seem correct either.
>
>-- Lina
