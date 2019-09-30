From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 4/5] dt-bindings: Document brcm,int-fwd-mask property
 for bcm7038-l1-intc
Date: Mon, 30 Sep 2019 14:10:45 -0500
Message-ID: <20190930191045.GA8851@bogus>
References: <20190913191542.9908-1-f.fainelli@gmail.com>
 <20190913191542.9908-5-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190913191542.9908-5-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Cernekee <cernekee@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:BROADCOM BMIPS MIPS ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:BROADCOM BMIPS MIPS ARCHITECTURE" <linux-mips@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, 13 Sep 2019 12:15:41 -0700, Florian Fainelli wrote:
> Indicate that the brcm,int-fwd-mask property is optional and can be
> optionaly set on platforms which require to leave specific interrupts
> untouched from Linux and retain the firmware configuration.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  .../bindings/interrupt-controller/brcm,bcm7038-l1-intc.txt    | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
