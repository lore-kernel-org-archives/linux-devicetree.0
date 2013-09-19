From: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org>
Subject: Re: new cpu iteration code...
Date: Thu, 19 Sep 2013 10:21:24 +0100
Message-ID: <523AC214.4040601@arm.com>
References: <20130918.173726.1443745664398441126.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130918.173726.1443745664398441126.davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Cc: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi David,

On 18/09/13 22:37, David Miller wrote:
> 
> I'm getting a flood of kernel log warnings on bootup now with
> the generic of_get_cpu_node() code, it is wrong for sparc64
> on several levels.
> 
> There is never a root "/cpus" node, so this code always fails.
> Usually the "cpu" nodes are simply listed at the top-level.
> 

As per ePAPR:
3.6 CPUS Node Properties
A cpus node is required for all device trees. It does not represent a
real device in the system, but acts as a container for child cpu nodes
which represent the systems CPUs. #address-cells and #size-cells are
required property.

> The correct way to go about this is to use something like:
> 
> 	struct device_node *dp;
> 
> 	for_each_node_by_type(dp, "cpu") {
> 	}
> 
> and therefore be agnostic as to the layout of the device
> tree wrt. cpu nodes.
> 
> Secondly, the property to use to get the physical cpu number is not
> only different on sparc from what this code uses, but varies.  It can
> be either "upa-portid" or "portid".  The "reg" property represents
> various things and will be different for different cpu types and thus
> is not a good candidate for fetching this information.

The value of "reg" defines a unique CPU/thread id for the CPU/threads
represented by the CPU node. This is again a deviation from ePAPR.

I could not find any binding document or dts file with "upa-portid" or
"portid" to think about possible solution.

I am yet to understand definition of backward compatibility and
adherence to ePAPR from device tree perspective. Do we consider this as
broken DT as it doesn't adhere to ePAPR or do we need to have backward
compatibility here ?

Regards,
Sudeep

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
