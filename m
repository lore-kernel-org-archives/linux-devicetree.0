From: Lina Iyer <lina.iyer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: How-to: Uniquely identify a DT node in the driver?
Date: Wed, 29 Jul 2015 10:01:20 -0600
Message-ID: <20150729160120.GH51847@linaro.org>
References: <20150728193833.GC51847@linaro.org>
 <55B8A061.6060306@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55B8A061.6060306-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 29 2015 at 03:44 -0600, Sudeep Holla wrote:
>
>
>On 28/07/15 20:38, Lina Iyer wrote:
>>Hello,
>>
>>I am looking to find a way to uniquely identify a device in the driver.
>>Here is an example -
>>
>>	big: power-controller@1 {
>>		compatible = "soc,foo";
>>		...
>>	};
>>
>>	little: power-controller@2 {
>>		compatible = "soc,foo";
>>		...
>>	};
>>
>>
>>In the driver for the power-controller foo.c, would like to do -
>>
>>	struct xyz {
>>		const char *name;
>>		...
>>	};
>>
>>	static struct xyz a = {
>>		.name = "big"; // To be associated with big device
>>		...
>>	};
>>
>>	static struct xyz b = {
>>		.name = "little"; // To be associated with little device
>>		...
>>	};
>>
>>What would be the best way to associate the power-controller devices 'big'
>>and 'little' with 'a' and 'b' respectively? A string comparison would be
>>ideal but possibly can work with other ways.
>>
>
>Why do you want to distinguish them within the driver ? IIUC each of
>these power controller will get instantiated as separate devices with
>unique properties.
>
>Assuming the big and little above are related to CPUs, if each of the
>CPUs have phandles to their respective power controller, IMO you need
>not distinguish between the big and the little power controllers.
>
>I may be missing something here, one possible reason I can think of for
>distinguishing them is both power controllers have same set of
>properties in DT, but they differ in the way you access them or program
>them(e.g. sequence). In that case have different compatible makes sense.
>
You are right. My reason for distinguishing between these devices is
something of a device specific action.

>>I could think of adding compatibles to achieve this, but was hoping to
>>find something more elegant and appropriate. Or, is compatible the
>>recommended way to uniquely identify devices by the driver?
>>
>
>If you provide the exact reason for distinguishing them within the
>driver, that would help to come up with the solution.
>
I thought the context would be confusing, so just sent the gist of the
problem. Well anyways, here it is -

I am trying to instantiate generic PM domains for different CPU clusters
commonly. Individual platform code may have different actions for
powering down/up the CPU domain. It could be different set of bucks that
they need to talk to or bunch of devices. The common code would like to
provide the opportunity for the platform code to perform their
activities.

CPUs may be organized into 'n' clusters, the common code would create
genpd for each of these clusters. In a multi machine image, to identify
the right platform driver for the cluster, is a challenge. I am trying
to solve it the same way as CPUidle - using __init section tables.  To
uniquely identify a cluster in a SoC, I need a way to match the domain
provider's DT node, with a callback in the driver. Like the 'method'
attribute of the CPUIdle macros. The CPU compatibles are too generic and
could duplicate across SoCs to be used for comparison. For e.g, you
could have two clusters of A53 cores that could use the same compatible
string. Distinguishing the domains for each of these clusters is a pain
(but doable using phandles to the domain referenced by the CPU).

To make it easy for the driver, I could only think of adding an unique
compatible string to the domain node and the platform driver would then
be able to same compatible string to distinguish between domains for the
different clusters.

Alternately, I was exploring a way to use phandles for the device nodes
as unique comparison attributes, but that is more complex and doesnt
provide any better benefit than the compatible.

My RFC post for CPU PM domains is here [1].

Thanks,
Lina

[1].
http://lists.infradead.org/pipermail/linux-arm-kernel/2015-June/352787.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
