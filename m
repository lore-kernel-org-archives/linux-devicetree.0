From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: arm: fsl: Add PHYTEC i.MX6
 devicetree  bindings
Date: Tue, 1 Oct 2019 17:18:48 -0500
Message-ID: <20191001221848.GA25201@bogus>
References: <1568980346-385840-1-git-send-email-s.riedmueller@phytec.de>
 <1568980346-385840-2-git-send-email-s.riedmueller@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1568980346-385840-2-git-send-email-s.riedmueller@phytec.de>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Stefan Riedmueller <s.riedmueller@phytec.de>, Andrew Smirnov <andrew.smirnov@gmail.com>, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 20 Sep 2019 13:52:26 +0200, Stefan Riedmueller wrote:
> Add devicetree bindings for i.MX6 based phyCORE-i.MX6, phyBOARD-Mira and
> phyFLEX-i.MX6.
> 
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
> Changes in v2:
>  - Use seperate description for each board instead of squashing them into
>    the standard board.
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 37 ++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
