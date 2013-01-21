From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH] ARM: architected timers: allow dt based discovery using
 =?UTF-8?Q?clocksource=5Fof=5Finit?=
Date: Mon, 21 Jan 2013 19:25:55 +0100
Message-ID: <ef8b986a3b0a2c3fae230c8d7416d42d@localhost>
References: <1358731326-2979-1-git-send-email-thomas.abraham@linaro.org>
 <50FD7904.1070201@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <50FD7904.1070201@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: swarren@nvidia.com, johnstul@us.ibm.com, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, Thomas Abraham <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, 21 Jan 2013 10:21:08 -0700, Stephen Warren <swarren@wwwdotorg.org>
wrote:
> On 01/20/2013 06:22 PM, Thomas Abraham wrote:
>> Add an entry in __clksrc_of_table so that ARMv7 architected timer is
>> discoverable using call to clocksource_of_init.
> 
>> diff --git a/arch/arm/kernel/arch_timer.c
b/arch/arm/kernel/arch_timer.c
> 
>> +#ifdef CONFIG_CLKSRC_OF
>> +CLOCKSOURCE_OF_DECLARE(armv7_timer, "arm,armv7-timer",
>> arch_timer_of_register)
>> +#endif
> 
> I wonder if we shouldn't enhance include/linux/clocksource.h to define
> CLOCKSOURCE_OF_DECLARE even when !CONFIG_CLKSRC_OF; that way, drivers
> wouldn't need that ifdef.

Indeed. That would be a lot nicer.

        M.
-- 
Fast, cheap, reliable. Pick two.
