From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH 1/4] ARM: dts: keystone: update for supporting K2L/K2E EVMs
Date: Mon, 10 Mar 2014 04:01:12 +0800
Message-ID: <531CC888.1080100@ti.com>
References: <1393365035-20083-1-git-send-email-santosh.shilimkar@ti.com>
 <1393365035-20083-2-git-send-email-santosh.shilimkar@ti.com>
 <20140309053924.GD12854@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140309053924.GD12854@quad.lixom.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, "Karicheri,
 Muralidharan" <m-karicheri2@ti.com>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sunday 09 March 2014 01:39 PM, Olof Johansson wrote:
> On Tue, Feb 25, 2014 at 04:50:32PM -0500, Santosh Shilimkar wrote:
>> From: Murali Karicheri <m-karicheri2@ti.com>
>>
>> This patch add compatibility strings for k2hk, k2l and k2e EVMs
>>
>> Cc: Olof Johansson <olof@lixom.net>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Kumar Gala <galak@codeaurora.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>> Signed-off-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
>> ---
>>  .../devicetree/bindings/arm/keystone/keystone.txt  |   10 ++++++++++
>>  arch/arm/mach-keystone/keystone.c                  |    3 +++
>>  2 files changed, 13 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/keystone/keystone.txt b/Documentation/devicetree/bindings/arm/keystone/keystone.txt
>> index 63c0e6a..ad16e7a 100644
>> --- a/Documentation/devicetree/bindings/arm/keystone/keystone.txt
>> +++ b/Documentation/devicetree/bindings/arm/keystone/keystone.txt
>> @@ -8,3 +8,13 @@ Required properties:
>>   - compatible: All TI specific devices present in Keystone SOC should be in
>>     the form "ti,keystone-*". Generic devices like gic, arch_timers, ns16550
>>     type UART should use the specified compatible for those devices.
>> +
>> +Boards:
>> +-  Keystone 2 Hawking/Kepler EVM
>> +   compatible = "ti,k2hk-evm"
>> +
>> +-  Keystone 2 Lamarr EVM
>> +   compatible = "ti,k2l-evm"
> 
> Your previous email said Lammar. One, or maybe both, are wrong, but which one?
>
My email had a typo then. The one here is right.
 
>> +
>> +-  Keystone 2 Edison EVM
>> +   compatible = "ti,k2e-evm"
>> diff --git a/arch/arm/mach-keystone/keystone.c b/arch/arm/mach-keystone/keystone.c
>> index 6e6bb7d..aa0d212 100644
>> --- a/arch/arm/mach-keystone/keystone.c
>> +++ b/arch/arm/mach-keystone/keystone.c
>> @@ -47,6 +47,9 @@ static void __init keystone_init(void)
>>  
>>  static const char *keystone_match[] __initconst = {
>>  	"ti,keystone-evm",
>> +	"ti,k2hk-evm",
>> +	"ti,k2l-evm",
>> +	"ti,k2e-evm",
> 
> -evm indicate board-level compat fields. We'd be better off just keeping a
> "ti,keystone" top-level compatible here and just using that to probe. That
> way you don't have to touch the file for new boards in the future.
> 
So far keystone-evm was k2hk(Keystone2 Hawking EVM) but with additional two
SOC's and board's, separate compatible was needed to differentiate. These
boards do have significant differences though current mainline code.
This mainly because the boards are build for those specific SOC families.

I would like to keep the organisation that way so that we cab support any
future boards like below.
"ti,k2hk-evm" --> All the Keystone2 Hawking/Kepler boards
"ti,k2l-evm" --> All the Keystone2 Lamarr boards
"ti,k2e-evm" --> All the Keystone2 Edision boards

I don't expect to touch this file till new SOC gets added with its
EVM.

Regards,
Ssantosh
