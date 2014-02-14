From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] clk: fixed-rate: use full DT node name
Date: Fri, 14 Feb 2014 09:43:04 -0700
Message-ID: <52FE4798.3010605@wwwdotorg.org>
References: <1392358613-19962-1-git-send-email-swarren@wwwdotorg.org> <20140214103556.GC9907@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140214103556.GC9907-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/14/2014 03:35 AM, Mark Rutland wrote:
> On Fri, Feb 14, 2014 at 06:16:52AM +0000, Stephen Warren wrote:
>> clk-fixed-rate currently names clocks according to a node's name without
>> the unit address. When faced with the legal and technically correct DT
>> structure below, this causes rgistration attempts for 3 clocks with the
>> same name, 2 of which fail.
>>
>> 	clocks {
>> 		compatible = "simple-bus";
>> 		#address-cells = <1>;
>> 		#size-cells = <0>;
>>
>> 		clk_mmc: clock@0 {
>> 			compatible = "fixed-clock";
>> 			reg = <0>;
>> ...
>> 		clk_i2c: clock@1 {
>> 			compatible = "fixed-clock";
>> 			reg = <1>;
>> ...
>> 		clk_spi: clock@2 {
>> 			compatible = "fixed-clock";
>> 			reg = <2>;
>> ...
> 
> I'd argue that this case isn't valid.

Well, it's very widely used, and was the result of numerous discussions
of how this kind of thing should be represented:-/

> The fixed-clock binding doesn't define a reg, yet simple bus binding
> implies that the reg property of child nodes should be interpretted as
> the same address space as their parent (MMIO in this case?). The
> fixed-clock nodes reg proeprties clearly aren't MMIO addresses.
> 
> Additionally, the _requred_ ranges property is missing.

Perhaps we need to invent a simple-container instead then?

> It's just nonsensical; rename them to clock_{0,1,..} instead and get rid
> of the reg properties. Then they're named uniquely.

That's not legal either. DT node names are supposed to represent the
type of device/object (i.e. just "clock"), not the identity of the
device/object (i.e. not include IDs etc.). Hence, the node name needs to
be "clock" for all of them, and the unit address must be used to
differentiate them.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
