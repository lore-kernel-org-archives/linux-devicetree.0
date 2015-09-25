From: santosh shilimkar <santosh.shilimkar@oracle.com>
Subject: Re: [PATCH 1/3] Documentation: dt: keystone: provide SoC specific
 compatible flags
Date: Fri, 25 Sep 2015 08:18:07 -0700
Message-ID: <560565AF.2010701@oracle.com>
References: <1442938118-4718-1-git-send-email-nm@ti.com>
 <1442938118-4718-2-git-send-email-nm@ti.com> <5602ED34.9010108@oracle.com>
 <56040323.1080409@ti.com> <560406C2.6090200@ti.com> <56041CA4.40208@ti.com>
 <56055F1F.4060401@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <56055F1F.4060401@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nishanth Menon <nm@ti.com>, Murali Karicheri <m-karicheri2@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 9/25/2015 7:50 AM, Nishanth Menon wrote:
> On 09/24/2015 10:54 AM, Murali Karicheri wrote:
> [...]
>> ti,omap3 is the family of omap3 devices similar to keystone. ti,omap3450
>> is required if there is an exceptional treatment required for ti,omap3450.
>>
>> In keystone case so far there is no case of exceptional treatment
>> required in the code for a specific SoC. So a generic name, ti,keystone
>> is used. When exceptional treatment is needed in the future, for example
>> k2hk Soc, we should introduce SoC specific string in the following order.
>
> Did you do a grep on the code to see?
> $ git grep ti,omap3 arch/arm/mach-omap2/
>             arch/arm/mach-omap2/board-generic.c:    "ti,omap3430",
> arch/arm/mach-omap2/board-generic.c:    "ti,omap3",
> arch/arm/mach-omap2/board-generic.c:    "ti,omap36xx",
> arch/arm/mach-omap2/board-generic.c:    "ti,omap3-beagle",
>
> This is the same as keystone's device support. even though only 36xx was
> needed, we introduced other SoC specific compatibility match.
>
>> "ti,k2hk-evm", "ti,k2hk", "ti,keystone"
>>
>> So unless there is an exception, there is no need for a SoC specific
>> string in the compatibility string list. So this can be added later if
>> there is need for exceptional treatment. Did I get it wrong?
>>
>
> I see both your views seem to be "if we dont need a compatible" dont add
> it. My view was based on "be accurate in the hardware description"
>
> OK - i will probably agree on the topic. But, how about userspace
> needing to know which SoC they are on, without needing to depend on
> board->soc mapping? How do we help resolve that?
>
Why the user space should care about exact SOC ?
