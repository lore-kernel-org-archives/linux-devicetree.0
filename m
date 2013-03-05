From: "Christian Daudt" <csd@broadcom.com>
Subject: Re: [PATCH] ARM: bcm281xx: Add L2 cache enable code
Date: Tue, 5 Mar 2013 14:54:51 -0800
Message-ID: <513677BB.9010309@broadcom.com>
References: <1362451632-18806-1-git-send-email-csd@broadcom.com>
 <201303050901.12317.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201303050901.12317.arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, devicetree-discuss@lists.ozlabs.org, csd_b@daudt.org, "arm@kernel.org" <arm@kernel.org>, abhimanyu.kapur@outlook.com, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 13-03-05 01:01 AM, Arnd Bergmann wrote:
> On Tuesday 05 March 2013, Christian Daudt wrote:
>
>> diff --git a/Documentation/devicetree/bindings/misc/smc.txt b/Documentation/devicetree/bindings/misc/smc.txt
>> new file mode 100644
>> index 0000000..cd8c729
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/misc/smc.txt
>> @@ -0,0 +1,14 @@
>> +Broadcom Secure Monitor Bounce buffer
>> +-----------------------------------------------------
>> +This binding defines the location of the bounce buffer
>> +used for non-secure to secure communications.
>> +
>> +Required properties:
>> +- compatible : "bcm,kona-smc"
>> +- reg : Location and size of bounce buffer
>> +
>> +Example:
>> +	smc@0x3404c000 {
>> +		compatible = "bcm,kona-smc";
>> +		reg = <0x3404c000 0x400>; //1 KiB in SRAM
>> +	};
> For other firmware interfaces like this, we tend to list the specific commands
> that the firmware understands. If you think there might be different versions
> to consider, you might want to model this like
>
> Documentation/devicetree/bindings/arm/psci.txt
This interface is stable and in shipping products at this time, and so 
the api will remain constant.

>> diff --git a/arch/arm/mach-bcm/bcm_kona_smc_asm.S b/arch/arm/mach-bcm/bcm_kona_smc_asm.S
>> new file mode 100644
>> index 0000000..a160848
>> --- /dev/null
>> +++ b/arch/arm/mach-bcm/bcm_kona_smc_asm.S
>> +/*
>> + * int bcm_kona_smc_asm(u32 service_id, u32 buffer_addr)
>> + */
>> +
>> +ENTRY(bcm_kona_smc_asm)
>> +	stmfd	sp!, {r4-r12, lr}
>> +	mov	r4, r0		@ service_id
>> +	mov	r5, #3		@ Keep IRQ and FIQ off in SM
> Why not just use an inline assembly?
We ran into problems with some gcc versions messing up the 
"arch_extension sec" when passing it to the assembler, so we broke it 
out to its own .S file following the example of omap and highbank. I 
suspect that they did it for the same reason.

>
>> +#ifdef CONFIG_CACHE_L2X0
>> +static int __init kona_l2_cache_init(void)
>> +{
>> +	/*
>> +	 * Currently there is no SSAPI for setting the L2 cache aux register,
>> +	 * so the default value (0x1e050000) applies.
>> +	 */
>> +	bcm_kona_smc(SSAPI_ENABLE_L2_CACHE, 0, 0, 0, 0);
> This can be written in a nicer way as
>
> static int __init kona_l2_cache_init(void)
> {
> 	if (!IS_ENABLED(CONFIG_CACHE_L2X0))
> 		return 0;
> 	...
> }
>
> To remove the need for the #ifdef.
ok. done.

>> +static void __init init_irq(void)
>> +{
>> +	irqchip_init();
>> +	bcm_kona_smc_init();
>> +
>> +#ifdef CONFIG_CACHE_L2X0
>> +	kona_l2_cache_init();
>> +#endif /* CONFIG_CACHE_L2X0 */
>> +}
> Why are you calling bcm_kona_smc_init() and kona_l2_cache_init() from init_irq()?
>
> It seems completely unrelated to interrupt handling.
>
It was originally in init_machine section but I was told that that was 
too late and init_irq would be better, and I saw that highbank also has 
it in init_irq. I agree that it is unrelated to irq - is there a better 
place to put this in ?

  thanks,
    csd
