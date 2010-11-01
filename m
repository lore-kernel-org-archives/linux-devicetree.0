From: Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] of: of_mdio: Fix some endianness problems.
Date: Mon, 01 Nov 2010 14:44:00 +0300
Message-ID: <4CCEA800.9040500@mvista.com>
References: <1288227827-5447-1-git-send-email-ddaney@caviumnetworks.com>
	<20101030063237.GC2456@angua.secretlab.ca>
	<AANLkTi=24H4RNonXu=i3CHhYqbLniDya+BKnj_evw_p6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTi=24H4RNonXu=i3CHhYqbLniDya+BKnj_evw_p6-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 31-10-2010 5:54, Grant Likely wrote:

>>> In of_mdiobus_register(), the __be32 *addr variable is dereferenced.
>>> This will not work on little-endian targets.  Also since it is
>>> unsigned, checking for less than zero is redundant.

>>> Fix these two issues.

>>> Signed-off-by: David Daney<ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
>>> Cc: Grant Likely<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>>> Cc: Jeremy Kerr<jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
>>> Cc: Benjamin Herrenschmidt<benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
>>> Cc: Dan Carpenter<error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> Cc: Greg Kroah-Hartman<gregkh-l3A5Bk7waGM@public.gmane.org>
>>> ---
>>>   drivers/of/of_mdio.c |   23 ++++++++++++++---------
>>>   1 files changed, 14 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
>>> index 1fce00e..b370306 100644
>>> --- a/drivers/of/of_mdio.c
>>> +++ b/drivers/of/of_mdio.c
>>> @@ -52,27 +52,32 @@ int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np)
>>>
>>>        /* Loop over the child nodes and register a phy_device for each one */
>>>        for_each_child_of_node(np, child) {
>>> -             const __be32 *addr;
>>> +             const __be32 *paddr;
>>> +             u32 addr;
>>>                int len;
>>>
>>>                /* A PHY must have a reg property in the range [0-31] */
>>> -             addr = of_get_property(child, "reg",&len);
>>> -             if (!addr || len<  sizeof(*addr) || *addr>= 32 || *addr<  0) {
>>> +             paddr = of_get_property(child, "reg",&len);
>>> +             if (!paddr || len<  sizeof(*paddr)) {
>>> +addr_err:
>>>                        dev_err(&mdio->dev, "%s has invalid PHY address\n",
>>>                                child->full_name);
>>>                        continue;
>>>                }
>>> +             addr = be32_to_cpup(paddr);
>>> +             if (addr>= 32)
>>> +                     goto addr_err;

>> goto's are fine for jumping to the end of a function to unwind
>> allocations, but please don't use it in this manner.  The original
>> structure will actually work just fine if you do it thusly:

>>                 if (!paddr || len<  sizeof(*paddr) ||
>>                     *(addr = be32_to_cpup(paddr))>= 32) {
>>                         dev_err(&mdio->dev, "%s has invalid PHY address\n",
>>                                 child->full_name);
>>                         continue;
>>                 }

>> Otherwise this patch looks good. After you've reworked and retested
>> I'll pick it up for 2.6.37 (or dave will).

> Actually, I mistyped this.  I think it should be:
>
>                 if (!paddr || len<  sizeof(*paddr) ||
>                     (addr = be32_to_cpup(paddr))>= 32) {

   This assignment would probably cause checkpatch.pl to complain...

WBR, Sergei
