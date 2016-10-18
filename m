From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/3] arm64: dts: Update Broadcom NS2 to generic IOMMU
 binding
Date: Tue, 18 Oct 2016 11:26:48 +0100
Message-ID: <8773998a-79f8-509a-3019-9f3022929c10@arm.com>
References: <acf4f770eab43fec8c5b6e9cddb6dd0defc52138.1476706244.git.robin.murphy@arm.com>
 <f2de1b15adb2f57529734a4769ef04d9cde3cc5d.1476706244.git.robin.murphy@arm.com>
 <77abd968-f412-a118-5b19-5faf539f33be@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <77abd968-f412-a118-5b19-5faf539f33be-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 18/10/16 01:58, Florian Fainelli wrote:
> On 10/17/2016 05:13 AM, Robin Murphy wrote:
>> With the "mmu-masters" property now deprecated and optional, the
>> generic binding offers a more efficient way to specify no masters.
>>
>> CC: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> CC: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> CC: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
> 
> Applied, did you use get_maintainers.pl for this file? It did not land
> in bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org and as such did not get picked
> by the patchwork instance behind..

Oops, sorry! I somehow managed to overlook that - I'll try paying closer
attention in future :)

Thanks,
Robin.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
