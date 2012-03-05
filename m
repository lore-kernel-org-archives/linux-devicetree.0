From: "Cousson, Benoit" <b-cousson@ti.com>
Subject: Re: [PATCH v2 7/7] Document: devicetree: add OF documents for arch-mmp
Date: Mon, 5 Mar 2012 16:08:37 +0100
Message-ID: <4F54D6F5.8050805@ti.com>
References: <1330950111-30797-1-git-send-email-haojian.zhuang@marvell.com>
 <1330950111-30797-8-git-send-email-haojian.zhuang@marvell.com>
 <201203051446.14600.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201203051446.14600.arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: eric.y.miao@gmail.com, devicetree-discuss@lists.ozlabs.org, Haojian Zhuang <haojian.zhuang@marvell.com>, Rob Herring <rob.herring@calxeda.com>, grant.likely@secretlab.ca, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 3/5/2012 3:46 PM, Arnd Bergmann wrote:
> On Monday 05 March 2012, Haojian Zhuang wrote:
>> Add OF support in Document/devicetree directory.
>>
>> Signed-off-by: Haojian Zhuang<haojian.zhuang@marvell.com>
>
> Acked-by: Arnd Bergmann<arnd@arndb.de>
>
> One question for Benoit, Grant or Rob:
>
>> +Required properties:
>> +- compatible: should be "mrvl,sa1100-rtc"
>> +- reg: physical base address of the controller and length of memory mapped
>> +  region.
>> +- interrupts: Should be two. The first interrupt number is the rtc alarm
>> +  interrupt and the second interrupt number is the rtc hz interrupt.
>> +- interrupt-names: Assign name of irq resource.
>> +
>> +Example:
>> +	rtc: rtc@d4010000 {
>> +		compatible = "mrvl,mmp-rtc";
>> +		reg =<0xd4010000 0x1000>;
>> +		interrupts =<5>,<6>;
>> +		interrupt-name = "rtc 1Hz", "rtc alarm";
>> +	};
>
> When the binding for a device lists the interrupt-names property, should it
> also list the specific values for it? This one says that which ones they are,
> but I think we should actually mandate the exact string in the binding if
> we want to allow drivers to get the resource by its name.

Yes, indeed. The names are not some random strings, the driver will use 
get_resource_by_name and expect the name to be aligned with HW 
documentation and thus should be well documented in the binding.

Regards,
Benoit
