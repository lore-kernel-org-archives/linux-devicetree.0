From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: arm: Convert Alpine board/soc bindings
 to json-schema
Date: Thu, 13 Jun 2019 16:46:04 -0600
Message-ID: <20190613224604.GA5119@bogus>
References: <20190517153510.13647-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190517153510.13647-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Antoine Tenart <antoine.tenart@bootlin.com>
Cc: linux-kernel@vger.kernel.org, Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, May 17, 2019 at 10:35:10AM -0500, Rob Herring wrote:
> Convert Alpine SoC bindings to DT schema format using json-schema.
> 
> Cc: Tsahee Zidenberg <tsahee@annapurnalabs.com>
> Cc: Antoine Tenart <antoine.tenart@free-electrons.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/arm/al,alpine.txt     | 16 --------------
>  .../devicetree/bindings/arm/al,alpine.yaml    | 21 +++++++++++++++++++
>  2 files changed, 21 insertions(+), 16 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/al,alpine.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/al,alpine.yaml

Ping. Please apply or modify this how you'd prefer. I'm not going to    
keep respinning this.

Rob
