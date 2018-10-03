From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: Re: [PATCH v2 08/22] soc/fsl/qbman_portals: add APIs to retrieve the
 probing status
Date: Wed, 3 Oct 2018 10:50:46 +0000
Message-ID: <c4ff9977-c730-be48-8046-97da663c5a23@nxp.com>
References: <20180926132247.10971-1-laurentiu.tudor@nxp.com>
 <20180926132247.10971-9-laurentiu.tudor@nxp.com>
 <CADRPPNTD=SNpSqz=zoLyGP1tvh_xDr5E1NDHF_P0bcSPyx9X1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CADRPPNTD=SNpSqz=zoLyGP1tvh_xDr5E1NDHF_P0bcSPyx9X1A@mail.gmail.com>
Content-Language: en-US
Content-ID: <E2E6A1E9E0788343B9DCD71E8D314255@eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Leo Li <leoyang.li@nxp.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Bharat Bhushan <bharat.bhushan@nxp.com>, Madalin-cristian Bucur <madalin.bucur@nxp.com>, Netdev <netdev@vger.kernel.org>, Roy Pledge <roy.pledge@nxp.com>, lkml <linux-kernel@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, David Miller <davem@davemloft.net>, "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "robin.murphy@arm.com" <robin.murphy@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Leo,

On 27.09.2018 23:03, Li Yang wrote:
> On Wed, Sep 26, 2018 at 8:26 AM <laurentiu.tudor@nxp.com> wrote:
>>
>> From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
>>
>> Add a couple of new APIs to check the probing status of the required
>> cpu bound qman and bman portals:
>>   'int bman_portals_probed()' and 'int qman_portals_probed()'.
>> They return the following values.
>>   *  1 if qman/bman portals were all probed correctly
>>   *  0 if qman/bman portals were not yet probed
>>   * -1 if probing of qman/bman portals failed
>> Drivers that use qman/bman portal driver services are required to use
>> these APIs before calling any functions exported by these drivers or
>> otherwise they will crash the kernel.
>> First user will be the dpaa1 ethernet driver, coming in a subsequent
>> patch.
>>
>> Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
>> ---
>>   drivers/soc/fsl/qbman/bman_portal.c | 10 ++++++++++
>>   drivers/soc/fsl/qbman/qman_portal.c | 10 ++++++++++
>>   include/soc/fsl/bman.h              |  8 ++++++++
>>   include/soc/fsl/qman.h              |  9 +++++++++
>>   4 files changed, 37 insertions(+)
>>
>> diff --git a/drivers/soc/fsl/qbman/bman_portal.c b/drivers/soc/fsl/qbman/bman_portal.c
>> index f9edd28894fd..8048d35de8a2 100644
>> --- a/drivers/soc/fsl/qbman/bman_portal.c
>> +++ b/drivers/soc/fsl/qbman/bman_portal.c
>> @@ -32,6 +32,7 @@
>>
>>   static struct bman_portal *affine_bportals[NR_CPUS];
>>   static struct cpumask portal_cpus;
>> +static int __bman_portals_probed;
>>   /* protect bman global registers and global data shared among portals */
>>   static DEFINE_SPINLOCK(bman_lock);
>>
>> @@ -85,6 +86,12 @@ static int bman_online_cpu(unsigned int cpu)
>>          return 0;
>>   }
>>
>> +int bman_portals_probed(void)
>> +{
>> +       return __bman_portals_probed;
>> +}
>> +EXPORT_SYMBOL_GPL(bman_portals_probed);
>> +
>>   static int bman_portal_probe(struct platform_device *pdev)
>>   {
>>          struct device *dev = &pdev->dev;
>> @@ -148,6 +155,7 @@ static int bman_portal_probe(struct platform_device *pdev)
>>          spin_lock(&bman_lock);
>>          cpu = cpumask_next_zero(-1, &portal_cpus);
>>          if (cpu >= nr_cpu_ids) {
>> +               __bman_portals_probed = 1;
> 
> What if the last CPU is not used for portals?  Is there a hard
> requirement that all CPUs need to be used for portal? 

As far as I know, in the current driver design a portal is required for 
each CPU.

> What happens if the last CPU is offline?

Can this happen at probe time?
Anyway, I'm not sure that the driver is even aware of cpu hotplug but 
I'll let Roy comment on this one.

> 
>>                  /* unassigned portal, skip init */
>>                  spin_unlock(&bman_lock);
>>                  return 0;
>> @@ -173,6 +181,8 @@ static int bman_portal_probe(struct platform_device *pdev)
>>   err_ioremap2:
>>          memunmap(pcfg->addr_virt_ce);
>>   err_ioremap1:
>> +        __bman_portals_probed = 1;
>> +
> 
> There are other error paths that not covered.

Right, thanks for pointing. On top of that, the assigned value here 
should be -1 to signal error (instead of 1 which signals success).

---
Best Regards, Laurentiu
