From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v2 7/7] Document: devicetree: add OF documents for arch-mmp
Date: Mon, 05 Mar 2012 09:07:00 -0600
Message-ID: <4F54D694.80808@gmail.com>
References: <1330950111-30797-1-git-send-email-haojian.zhuang@marvell.com>
 <1330950111-30797-8-git-send-email-haojian.zhuang@marvell.com>
 <201203051446.14600.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
Cc: eric.y.miao@gmail.com, Benoit Cousson <b-cousson@ti.com>, devicetree-discuss@lists.ozlabs.org, Haojian Zhuang <haojian.zhuang@marvell.com>, grant.likely@secretlab.ca, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 03/05/2012 08:46 AM, Arnd Bergmann wrote:
> On Monday 05 March 2012, Haojian Zhuang wrote:
>> Add OF support in Document/devicetree directory.
>>
>> Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
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
>> +		reg = <0xd4010000 0x1000>;
>> +		interrupts = <5>, <6>;
>> +		interrupt-name = "rtc 1Hz", "rtc alarm";
>> +	};
> 
> When the binding for a device lists the interrupt-names property, should it
> also list the specific values for it? This one says that which ones they are,
> but I think we should actually mandate the exact string in the binding if
> we want to allow drivers to get the resource by its name.

Sounds good to me. Requiring documentation is a good way to discourage
its use. :)

Ideally we would discourage spaces in the names, but since the whole
point is using the existing names from Linux we can't really enforce that.

Rob
