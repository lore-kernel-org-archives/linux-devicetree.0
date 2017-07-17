From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 01/14] qcom: mtd: nand: Add driver data for QPIC DMA
Date: Mon, 17 Jul 2017 09:22:34 +0200
Message-ID: <20170717092234.001fb765@bbrezillon>
References: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
        <1498720566-20782-2-git-send-email-absahu@codeaurora.org>
        <bd6add74-4f42-5036-3513-2e672ef97b15@codeaurora.org>
        <20170703214150.6a7b3f38@bbrezillon>
        <bfb3d3c466e60fa08f969ea485870ba4@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bfb3d3c466e60fa08f969ea485870ba4-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 17 Jul 2017 11:41:01 +0530
Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:

> >> > +
> >> > +nand@79b0000 {  
> > 
> > nand-controller@xxxx {
> > 
> > BTW, glad to see another driver moving to the new DT representation 
> > :-).
> >   
> >> > +	compatible = "qcom,qpic-nandc-v1.4.0";
> >> > +	reg = <0x79b0000 0x1000>;
> >> > +
> >> > +	clocks = <&gcc GCC_QPIC_CLK>,
> >> > +		<&gcc GCC_QPIC_AHB_CLK>;
> >> > +	clock-names = "core", "aon";
> >> > +
> >> > +	#address-cells = <1>;
> >> > +	#size-cells = <0>;
> >> > +
> >> > +	nandcs@0 {  
> > 
> > 	nand@0 {
> >   
> >> > +		compatible = "qcom,nandcs";  
> > 
> > Why do you need a compatible here?  
> It is the part of original driver. We can connect multiple
> NAND devices in the same bus and qcom,nandcs is being used
> for each connected NAND device. Each NAND device can use
> different  chip select, ecc strength etc which we can specify
> under this sub node.


Still don't understand why you need a compatible? Is this a memory bus
where you can connect other kind of memories (parallel NORs,
SRAMs, ...)?

If that's not the case, then considering all subnodes of the
nand-controller node containing a reg property as NAND devices is fine,
you don't need this compatible = "nand,cs" (see sunxi-nand bindings
[1]).

If the bus is generic and can be attached non-NAND devices, I'd
recommend looking at atmel's binding [2], because you're likely to
have one instance of the NAND controller logic for all NAND devices
connected on this bus.
And more importantly, if the bus a generic, the node should not be
named nand or nand-controller, and the compatible should not contain
'nandc' in it.

[1]http://elixir.free-electrons.com/linux/latest/source/Documentation/devicetree/bindings/mtd/sunxi-nand.txt#L34
[2]http://elixir.free-electrons.com/linux/latest/source/Documentation/devicetree/bindings/mtd/atmel-nand.txt#L70
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
