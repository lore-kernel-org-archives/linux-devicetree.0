From: Suravee Suthikulanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH] irqchip: gic: Add binding probe for ARM GIC400
Date: Thu, 17 Jul 2014 09:13:37 -0500
Message-ID: <53C7DA11.2000105@amd.com>
References: <1404947104-21345-1-git-send-email-suravee.suthikulpanit@amd.com>
 <1404947104-21345-2-git-send-email-suravee.suthikulpanit@amd.com>
 <2932284.F1eaAf8ArJ@diego> <2621565.f5eISveXXJ@diego>
 <20140717124804.GI13108@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140717124804.GI13108@titan.lakedaemon.net>
Sender: linux-doc-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, marc.zyngier@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, linux-doc@vger.kernel.org, Catalin.Marinas@arm.com, Harish.Kasiviswanathan@amd.com, linux-kernel@vger.kernel.org, Will.Deacon@arm.com, linux-pci@vger.kernel.org, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

On 7/17/2014 7:48 AM, Jason Cooper wrote:
> On Tue, Jul 15, 2014 at 12:03:03AM +0200, Heiko St=FCbner wrote:
>> From: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
>>
>> Commit 3ab72f9156bb "dt-bindings: add GIC-400 binding" added the
>> "arm,gic-400" compatible string, but the corresponding IRQCHIP_DECLA=
RE
>> was never added to the gic driver.
>>
>> Therefore add the missing irqchip declaration for it.
>>
>> Signed-off-by: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
>>
>> Removed additional empty line and adapted commit message to mark it
>> as fixing an issue.
>> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>> ---
>> As I really need this, I took the liberty of adapting the patch acco=
rdingly
>> to make it apply on top of the current irqchip/for-next (or urgent) =
and
>> explicitly state the fixed issue. Hope that is ok
>>
>>   drivers/irqchip/irq-gic.c | 1 +
>>   1 file changed, 1 insertion(+)
>
> Applied to irqchip/urgent with Will's Ack and Cc'd to stable for v3.1=
4+
>
> thx,
>
> Jason.
>
Thank you,

Suravee

