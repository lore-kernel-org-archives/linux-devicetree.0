From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 01/10] dt-bindings: clock: Add syscon support to
 Actions Semi Owl SoCs
Date: Tue, 7 Aug 2018 11:48:35 -0600
Message-ID: <20180807174835.GA13777@rob-hp-laptop>
References: <20180801033915.15880-1-manivannan.sadhasivam@linaro.org>
 <20180801033915.15880-2-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180801033915.15880-2-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org, afaerber@suse.de, lee.jones@linaro.org, arnd@arndb.de, linux-clk@vger.kernel.org, liuwei@actions-semi.com, mp-cs@actions-semi.com, 96boards@ucrobotics.com, devicetree@vger.kernel.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hzhang@ucrobotics.com, bdong@ucrobotics.com, manivannanece23@gmail.com, thomas.liau@actions-semi.com, jeff.chen@actions-semi.com, pn@denx.de, edgar.righi@lsitec.org.br, sravanhome@gmail.com
List-Id: devicetree@vger.kernel.org

On Wed, Aug 01, 2018 at 09:09:06AM +0530, Manivannan Sadhasivam wrote:
> Since the clock and reset management units are sharing the same memory
> map, document the clock bindings to support System Controller.

This is no reason to add child nodes. The existing node can be both a 
clock and reset provider.

> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../bindings/clock/actions,owl-cmu.txt        | 21 +++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
