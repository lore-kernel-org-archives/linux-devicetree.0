From: "Simon Arlott" <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
Subject: Re: [PATCH (v2) 1/2] reset: Add brcm,bcm6345-reset device tree
 binding
Date: Fri, 4 Dec 2015 21:12:10 -0000
Message-ID: <6a3790afc811ac4ed732371f2eb33a7c194b996d@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
References: <565F5C96.5090700@simon.arlott.org.uk>
    <1449131943.3339.8.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449131943.3339.8.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, December 3, 2015 08:39, Philipp Zabel wrote:
> Am Mittwoch, den 02.12.2015, 21:03 +0000 schrieb Simon Arlott:
>> +periph_soft_rst: reset-controller {
>> +	compatible = "brcm,bcm63168-reset", "brcm,bcm6345-reset";
>> +	regmap = <&periph_cntl>;
>> +	offset = <0x10>;
>> +
>> +	#reset-cells = <1>;
>> +};
>
> I would have written it something like this:
>
> periph_cntl: ... {
> 	compatible = "syscon", "simple-mfd";
> 	#address-cells = <1>;
> 	#size-cells = <1>;
>
> 	periph_soft_rst: reset-controller {
> 		compatible = "brcm,bcm6345-reset";
> 		reg = <0x10 0x4>;
> 		#reset-cells = <1>;
> 	};
> };
>
> for a device that is only controlled through a syscon.

Rob, do you want me to change this or is my version ok?

> The driver itself looks good to me.
>
> best regards
> Philipp
>
>

-- 
Simon Arlott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
