From: Lina Iyer <lina.iyer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: How-to: Uniquely identify a DT node in the driver?
Date: Fri, 31 Jul 2015 09:57:09 -0600
Message-ID: <20150731155709.GJ51847@linaro.org>
References: <20150728193833.GC51847@linaro.org>
 <55B8A061.6060306@arm.com>
 <20150729160120.GH51847@linaro.org>
 <20150730185110.GA9328@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150730185110.GA9328@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 30 2015 at 12:53 -0600, Mark Rutland wrote:
>Hi,
>
>Sorry for the corss-talk on my previous reply.
>
>> I am trying to instantiate generic PM domains for different CPU clusters
>> commonly. Individual platform code may have different actions for
>> powering down/up the CPU domain. It could be different set of bucks that
>> they need to talk to or bunch of devices. The common code would like to
>> provide the opportunity for the platform code to perform their
>> activities.
>>
>> CPUs may be organized into 'n' clusters, the common code would create
>> genpd for each of these clusters. In a multi machine image, to identify
>> the right platform driver for the cluster, is a challenge. I am trying
>> to solve it the same way as CPUidle - using __init section tables.  To
>> uniquely identify a cluster in a SoC, I need a way to match the domain
>> provider's DT node, with a callback in the driver. Like the 'method'
>> attribute of the CPUIdle macros. The CPU compatibles are too generic and
>> could duplicate across SoCs to be used for comparison. For e.g, you
>> could have two clusters of A53 cores that could use the same compatible
>> string. Distinguishing the domains for each of these clusters is a pain
>> (but doable using phandles to the domain referenced by the CPU).
>>
>> To make it easy for the driver, I could only think of adding an unique
>> compatible string to the domain node and the platform driver would then
>> be able to same compatible string to distinguish between domains for the
>> different clusters.
>>
>> Alternately, I was exploring a way to use phandles for the device nodes
>> as unique comparison attributes, but that is more complex and doesnt
>> provide any better benefit than the compatible.
>
>I don't believe using compatible strings is the right thing to do. The
>thing which varies per-domain is the relationships of various
>components, which should be described with phandles. At the level of the
>domain, the interface is identical, and thus they should have the same
>compatible string.
>
>Using different compatible strings implies that we have to add new
>compatible strings for each new variation that appears, leaving us with
>a completely arbitrary set of compatible strings with (likely)
>ill-defined semantics. That makes it really difficult to reuse code, and
>necessitates adding far more.
>
Okay.

>The inter-device relationships (and the attibutes of those devices)
>should be explicit in the DT.
>
Alright. That makes sense. My example does not violate this.

I have an established relationship between device nodes in the device
tree - CPUs reference their power-controller handles. I have two
clusters of CPUs. Would compatible strings still be an incorrect use (as
an alternate to property attributes) to distinguish these devices for
the driver?

I am doing something like this (the patches are not on any ML yet) - 

static struct of_arm_pd_ops pd_ops_big __initdata = {
        .init = pd_init_big,
        .power_on = pd_power_on,
        .power_off = pd_power_off,
};
ARM_PD_METHOD_OF_DECLARE(big, "foo,big" , &pd_ops_big);

static struct of_arm_pd_ops pd_ops_little __initdata = {
        .init = pd_init_little,
        .power_on = pd_power_on,
        .power_off = pd_power_off,
};
ARM_PD_METHOD_OF_DECLARE(little, "foo,little" , &pd_ops_little);

The ARM_PD_METHOD_OF_DECLARE is a macro that adds pd_ops_xxx to the
__init section tables, just like cpuidle does. ARM common code issues a
callback to the .init() of the ops at _initcall allowing the platform
code to update the controller properties specific to the platform.
Comparing the compatible read from the device node with that of the ops,
ARM common code knows which platform ops to call. This also allows,
driver to register multiple ops based on different compatibles.

Having these compatibles, eases the driver's work of identifying the
power controller without having to parse through the CPU, to figure out
which power-controller device the .init() callback is referring to.

What do you think? Sorry, if I went into too much specifics. Couldnt
think of a better way to explain.

Thanks,
Lina
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
