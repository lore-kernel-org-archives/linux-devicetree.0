From: Qing Xu <qingx@marvell.com>
Subject: Re: [PATCH v4 5/7] mfd: max8925: support dt for regulator
Date: Thu, 08 Nov 2012 10:32:44 +0800
Message-ID: <509B19CC.9000707@marvell.com>
References: <1352282993-26449-1-git-send-email-qingx@marvell.com> <20121107142007.GB20844@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121107142007.GB20844@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: "lrg@ti.com" <lrg@ti.com>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "haojian.zhuang@gmail.com" <haojian.zhuang@gmail.com>, Chao Xie <cxie4@marvell.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On 11/07/2012 10:20 PM, Mark Brown wrote:
> On Wed, Nov 07, 2012 at 06:09:53PM +0800, Qing Xu wrote:
>> From: Qing Xu <qingx@marvell.com>
>>
>> Signed-off-by: Qing Xu <qingx@marvell.com>
> Applied, thanks.
>
>> +max8925 regulator device register is still handled by mfd_add_devices, not by
>> +of_xxx, so, it is not necessary to add compatible name. Also, those reg
>> +offset and id info is stored in mfd_cell(see max8925-core.c), as a result
>> +there is not private properties in dts.
>> +node's name should match with the definition in max8925_regulator_matches
>> +(see max8925-regulator.c)
> Please submit a followup which removes all the Linux-specific references
> and just enumerates the supported regulators.  Please do also use a
> subject line appropriate for the subsystem - this is for the regulator
> driver so it should be regulator:
updated in another patch, please help me review it, thanks.
