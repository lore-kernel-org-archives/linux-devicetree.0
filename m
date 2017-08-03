From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: arm: Add entry for Beckhoff CX9020
Date: Thu, 3 Aug 2017 11:06:56 -0500
Message-ID: <20170803160656.2l6nyvm7dglgaj34@rob-hp-laptop>
References: <20170726120534.5516-1-linux-kernel-dev@beckhoff.com>
 <20170726120534.5516-2-linux-kernel-dev@beckhoff.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170726120534.5516-2-linux-kernel-dev@beckhoff.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel-dev@beckhoff.com
Cc: shawnguo@kernel.org, mark.rutland@arm.com, kernel@pengutronix.de, fabio.estevam@nxp.com, linux@armlinux.org.uk, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, andrew@lunn.ch, Patrick Bruenn <p.bruenn@beckhoff.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 26, 2017 at 02:05:31PM +0200, linux-kernel-dev@beckhoff.com wrote:
> From: Patrick Bruenn <p.bruenn@beckhoff.com>
> 
> - add vendor prefix bhf for Beckhoff
> - add new board binding bhf,cx9020
> 
> Signed-off-by: Patrick Bruenn <p.bruenn@beckhoff.com>
> ---
>  Documentation/devicetree/bindings/arm/bhf.txt         | 6 ++++++
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  MAINTAINERS                                           | 5 +++++
>  3 files changed, 12 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/bhf.txt

Acked-by: Rob Herring <robh@kernel.org>
