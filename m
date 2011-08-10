From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [RFC PATCH 3/3] ARM: gic: add OF based initialization
Date: Wed, 10 Aug 2011 09:08:56 +0100
Message-ID: <4E423C98.3040305@arm.com>
References: <1312921020-6820-1-git-send-email-robherring2@gmail.com>
	<1312921020-6820-4-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1312921020-6820-4-git-send-email-robherring2@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Rob Herring <rob.herring@calxeda.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "thomas.abraham@linaro.org" <thomas.abraham@linaro.org>, "jamie@jamieiles.com" <jamie@jamieiles.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 09/08/11 21:17, Rob Herring wrote:
> From: Rob Herring <rob.herring@calxeda.com>
> 
> This adds gic initialization using device tree data. An example device tree
> binding looks like this:
> 
> intc: interrupt-controller@fff11000 {
>         compatible = "arm,cortex-a9-gic";
>         #interrupt-cells = <1>;
>         interrupt-controller;
>         reg = <0xfff11000 0x1000>,
>               <0xfff10100 0x100>;
> };

I'm afraid I still object to this. PPIs are an important part of the
GIC, and this binding totally ignores the per-cpu aspect.

How do you represent the connection between a CPU local timer and the
GIC? Even worse, how to represent a device connected to only *one* of
the CPUs? PPIs are difficult to represent on the Linux side. But we
shouldn't ignore them in the DT binding.

Cheers,

	M.
-- 
Jazz is not dead. It just smells funny...
