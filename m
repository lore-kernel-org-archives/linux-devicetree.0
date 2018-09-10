From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: net: dsa: Document B53 SRAB
 interrupts and registers
Date: Mon, 10 Sep 2018 14:57:13 -0500
Message-ID: <20180910195713.GA14119@bogus>
References: <20180831192039.11842-1-f.fainelli@gmail.com>
 <20180831192039.11842-3-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180831192039.11842-3-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, "maintainer:BROADCOM IPROC ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, andrew@lunn.ch, rmk+kernel@armlinux.org.uk
List-Id: devicetree@vger.kernel.org

On Fri, 31 Aug 2018 12:20:38 -0700, Florian Fainelli wrote:
> Document the Broadcom roboswitch Switch Register Access Block interrupt
> lines and additional register base addresses for port mux configuration
> and SGMII status/configuration registers.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  .../devicetree/bindings/net/dsa/b53.txt       | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
