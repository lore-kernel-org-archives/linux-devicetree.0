From: Anurup M <anurupvasu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 03/11] dt-bindings: perf: hisi: Add Devicetree bindings
 for Hisilicon SoC PMU
Date: Fri, 24 Mar 2017 15:48:55 +0530
Message-ID: <58D4F28F.8080403@gmail.com>
References: <1489127248-112605-1-git-send-email-anurup.m@huawei.com>
 <20170321140741.GD22188@leverpostej> <20170321172819.GE29116@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170321172819.GE29116@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: dikshit.n-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, sanil.kumar-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, huangdaode-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, tanxiaojun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, john.garry-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, zhangshaokun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, anurup.m-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, shyju.pv-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, shiju.jose-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Tuesday 21 March 2017 10:58 PM, Mark Rutland wrote:
> On Tue, Mar 21, 2017 at 02:07:42PM +0000, Mark Rutland wrote:
>> On Fri, Mar 10, 2017 at 01:27:27AM -0500, Anurup M wrote:
>>> +HiSilicon SoC chip is encapsulated by multiple CPU and IO dies. The CPU die
>>> +is called as Super CPU cluster (SCCL) which includes 16 cpu-cores. Every SCCL
>>> +in HiP05/06/07 chips are further grouped as CPU clusters (CCL) which includes
>>> +4 cpu-cores each.
>>> +e.g. In the case of HiP05/06/07, each SCCL has 1 L3 cache and 1 MN PMU device.
>>> +The L3 cache is further grouped as 4 L3 cache banks in a SCCL.
>>> +
>>> +The Hisilicon SoC PMU DT node bindings for uncore PMU devices are as below.
>>> +For PMU devices like L3 cache. MN etc. which are accessed using the djtag,
>>> +the parent node will be the djtag node of the corresponding CPU die (SCCL).
>>> +
>>> +L3 cache
>>> +---------
>>> +The L3 cache is dedicated for each SCCL. Each SCCL in HiP05/06/07 chips have 4
>>> +L3 cache banks. Each L3 cache bank have separate DT nodes.
>>> +
>>> +Required properties:
>>> +
>>> +	- compatible : This value should be as follows
>>> +		(a) "hisilicon,hip05-pmu-l3c-v1" for v1 hw in HiP05 chipset
>>> +		(b) "hisilicon,hip06-pmu-l3c-v1" for v1 hw in HiP06 chipset
>>> +		(c) "hisilicon,hip07-pmu-l3c-v2" for v2 hw in HiP07 chipset
>>> +
>>> +	- hisilicon,module-id : This property is a combination of two values
>>> +	    in the below order.
>>> +		a) Module ID: The module identifier for djtag.
>>> +		b) Instance or Bank ID: This will identify the L3 cache bank
>>> +		 or instance.
>> I take it this is intended two mean this property is two cells in
>> length, with one cell for each of the below.
>>
>> This is a somewhat confusing proeprty given that the name only applies
>> to the first half of the value...
> Please split this itno two properties, and have a hisilicon,instance-id
> for the L3 nodes.

Sure. Shall add hisilicon,instance-id for L3 nodes.

Thanks,
Anurup

> Thanks,
> Mark.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
