From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/2] dt: Document general interrupt controller bindings
Date: Wed, 19 Sep 2012 09:25:19 -0600
Message-ID: <5059E3DF.6020906@wwwdotorg.org>
References: <1348045056-29769-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1348045056-29769-1-git-send-email-thierry.reding@avionic-design.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, Linus Walleij <linus.walleij@stericsson.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/19/2012 02:57 AM, Thierry Reding wrote:
> In order to use a device as interrupt controller, it needs to be marked
> with the DT interrupt-controller property. This commit adds rudimentary
> documentation about the required standard properties and describes the
> most commonly used interrupt specifiers.

> +++ b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> @@ -0,0 +1,94 @@
> +Specifying interrupt information for devices
> +============================================
> +
> +1) Interrupt user nodes
> +-----------------------

s/user/client/? Bike-shedding a little I suppose.

> +
> +A device that generates interrupts can specify the interrupt controller to
> +which the interrupts are routed by passing the controller's phandle in the
> +"interrupt-parent" property.
> +
> +The "interrupts" property is a list of specifiers that describe each of the
> +interrupts. See section 2 below for details.

This should probably mention that interrupt-parent cascades from parent
nodes. How about the following instead:

Nodes that describe devices which generate interrupts must contain an
"interrupts" property. This property must contain a list of interrupt
specifiers, one per output interrupt. The format of the interrupt
specifier is determined by the interrupt controller to which the
interrupts are routed; see section 2 below for details.

The interrupt-parent property is used to define the controller to which
interrupts are routed; it contains a single phandle referring to the
interrupt controller node. This property may be specified in any
interrupt client node, or in any parent node of the device.
