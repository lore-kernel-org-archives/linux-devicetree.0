From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: reset: Add document for Broadcom STB
 reset controller
Date: Mon, 21 Jan 2019 09:50:37 -0600
Message-ID: <20190121155037.GA5115@bogus>
References: <20190115184406.3164-1-f.fainelli@gmail.com>
 <20190115184406.3164-2-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190115184406.3164-2-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, 15 Jan 2019 10:44:05 -0800, Florian Fainelli wrote:
> Add a binding document for the Broadcom STB reset controller, also known
> as SW_INIT-style reset controller.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  .../bindings/reset/brcm,brcmstb-reset.txt     | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/brcm,brcmstb-reset.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
