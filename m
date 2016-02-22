From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 4/4] Documentation: atmel-pmc: add DT bindings for
 fast startup
Date: Sun, 21 Feb 2016 20:54:17 -0600
Message-ID: <20160222025417.GH15973@rob-hp-laptop>
References: <1455507630-29592-1-git-send-email-wenyou.yang@atmel.com>
 <1455507630-29592-5-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1455507630-29592-5-git-send-email-wenyou.yang@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wenyou Yang <wenyou.yang@atmel.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Russell King <linux@arm.linux.org.uk>, linux-clk@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Brown <broonie@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 15, 2016 at 11:40:30AM +0800, Wenyou Yang wrote:
> Add DT bindings to configurate the PMC_FSMR and PMC_FSPR registers
> to trigger a fast restart signal to PMC.
> 
> Signed-off-by: Wenyou Yang <wenyou.yang@atmel.com>
> Document: binding
> 
> ---
> 
> Changes in v3:
>  - update the property description.

This is not helpful. Assume I don't remember what I told you and you 
need to jog my memory what exactly changed so I don't have to go look it 
up.

> 
> Changes in v2:
>  - change the property name and property description.
> 
>  .../devicetree/bindings/arm/atmel-pmc.txt          |   63 ++++++++++++++++++++
>  1 file changed, 63 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
