From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: Document the Synopsys GPIO via CREG
 bindings
Date: Wed, 26 Sep 2018 15:26:52 -0500
Message-ID: <20180926202652.GA19379@bogus>
References: <20180911150925.19460-1-Eugeniy.Paltsev@synopsys.com>
 <20180911150925.19460-3-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180911150925.19460-3-Eugeniy.Paltsev@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-snps-arc@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

On Tue, 11 Sep 2018 18:09:25 +0300, Eugeniy Paltsev wrote:
> This patch adds documentation of device tree bindings for the Synopsys
> GPIO via CREG driver.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
>  .../devicetree/bindings/gpio/snps,creg-gpio.txt        | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
