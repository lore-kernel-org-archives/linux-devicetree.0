From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 1/4] iommu/arm-smmu: Introduce wrapper for writeq/readq
Date: Thu, 22 Aug 2019 15:30:24 +0100
Message-ID: <4ef6512d-701f-4fe8-8173-5f659dab0d32@arm.com>
References: <20190711150242.25290-1-gregory.clement@bootlin.com>
 <20190711150242.25290-2-gregory.clement@bootlin.com>
 <20190820120848.2m6gytilrpil4stu@willie-the-truck>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190820120848.2m6gytilrpil4stu@willie-the-truck>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Will Deacon <will@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Antoine Tenart <antoine.tenart@bootlin.com>, Catalin Marinas <catalin.marinas@arm.com>, Hanna Hawa <hannah@marvell.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Miqu=c3=a8l_Raynal?= <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On 20/08/2019 13:08, Will Deacon wrote:
> Hi Gregory, Hanna,
> 
> On Thu, Jul 11, 2019 at 05:02:39PM +0200, Gregory CLEMENT wrote:
>> From: Hanna Hawa <hannah@marvell.com>
>>
>> This patch introduces the smmu_writeq_relaxed/smmu_readq_relaxed
>> helpers, as preparation to add specific Marvell work-around for
>> accessing 64 bits width registers of ARM SMMU.
>>
>> Signed-off-by: Hanna Hawa <hannah@marvell.com>
>> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>> ---
>>   drivers/iommu/arm-smmu.c | 36 +++++++++++++++++++++++++++---------
>>   1 file changed, 27 insertions(+), 9 deletions(-)
> 
> Sorry for the delay in replying to this -- Robin's been reworking the driver
> so that implementation quirks can be specified more cleanly. Please can you
> take a look at:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=for-joerg/arm-smmu/refactoring
> 
> and try to respin your patches on top of that?

Right, the arm_smmu_impl design was specifically anticipating this quirk 
as well - it should just be a case of a cfg_probe hook to hide the 
features which can't work, plus {read,write}_reg64 hooks to override any 
remaining 64-bit accesses with the explicit hi_lo_* variants, munged 
together (either statically or dynamically) with the standard MMU-500 hooks.

Robin.
