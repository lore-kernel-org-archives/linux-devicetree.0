From: Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH 0/5] Use mmio-sram driver for Keystone MSMC RAM
Date: Wed, 7 Sep 2016 11:31:35 -0500
Message-ID: <d5fbf81d-6823-4598-cd34-045a98b90770@ti.com>
References: <20160901225846.31058-1-s-anna@ti.com>
 <d797bb0d-41b5-45a7-6faf-95baaab0215b@oracle.com>
 <f6920801-554d-18e8-f140-44aeeb2f878e@ti.com>
 <287b7e1d-1453-2832-515d-e7e51373a3bc@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <287b7e1d-1453-2832-515d-e7e51373a3bc@oracle.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Santosh Shilimkar <santosh.shilimkar@oracle.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Vitaly Andrianov <vitalya@ti.com>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Rob Herring <robh+dt@kernel.org>, Murali Karicheri <m-karicheri2@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 09/07/2016 11:25 AM, Santosh Shilimkar wrote:
> On 9/7/2016 9:22 AM, Suman Anna wrote:
>> Hi Santosh,
>>
>> On 09/07/2016 11:11 AM, Santosh Shilimkar wrote:
>>> Hi Suman,
>>>
>>> On 9/1/2016 3:58 PM, Suman Anna wrote:
>>>> Hi,
>>>>
>>>> The Keystone 2 family of SoCs have an on-chip RAM called the
>>>> Multicore Shared Memory (MSM) RAM. This RAM is accessible through
>>>> the Multicore Shared Memory Controller (MSMC). This series represents
>>>> these on-chip RAMs as sram nodes so that the memory allocations
>>>> can be managed by the in-kernel mmio-sram driver.
>>>>
>>>> The first 4 patches adds the basic SRAM nodes on each of the SoCs,
>>>> and the last patch enables the generic on-chip SRAM driver for
>>>> keystone defconfig.
>>>>
>>> The series looks good in general but I would like to understand
>>> the users of this memory in kernel. Is that going to be posted
>>> as a follow up patch ? Is the Power controller going to make
>>> use of this SRAM for PM code ?
>>
>> Yes, the users will eventually follow. Power Controller code is not
>> gonna be using this SRAM, it has its own RAM. This memory is gonna be
>> split between various functional features like IPC, OPTEE integration,
>> we already have the Boot Monitor code using this. We will have the
>> memory split by either having static child nodes or drivers requesting
>> the memory using gen_pool API.
>>
> OK. Its good to add the code at least with one active user of it.
> Since this has to anyway wait for another merge window, please post the
> users of it so that I can pull the combined patchset.

Yeah, will do. The first user will mostly be the corresponding child
nodes for the boot monitor.

regards
Suman
