From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 2/4] irqchip: irq-mvebu-pic: new driver for Marvell Armada
 7K/8K PIC
Date: Fri, 5 Aug 2016 19:04:53 -0400
Message-ID: <CAP=VYLqpECVBSaY+iPJp0n3rDX8-YHf4cQk_+da6p8uF6NoDOA@mail.gmail.com>
References: <1470408921-447-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1470408921-447-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAP=VYLqoubxSMcJJLSqfGUPVfyggMYwpS1aVRmWri+AQvgHt5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAP=VYLqoubxSMcJJLSqfGUPVfyggMYwpS1aVRmWri+AQvgHt5g@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Yehuda Yitschak <yehuday@marvell.com>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc Zyngier <marc.zyngier@arm.com>, Hanna Hawa <hannah@marvell.com>, Omri Itach <omrii@marvell.com>, LKML <linux-kernel@vger.kernel.org>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Neta Zur Hershkovits <neta@marvell.com>, Kumar Gala <galak@codeaurora.org>, Gregory Clement <gregory.clement@free-electrons.com>, Shadi Ammouri <shadi@marvell.com>, Thomas Gleixner <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 5, 2016 at 7:00 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

>> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
>> index fa33c50..a6f90c5 100644
>> --- a/drivers/irqchip/Kconfig
>> +++ b/drivers/irqchip/Kconfig
>> @@ -246,6 +246,9 @@ config MVEBU_ODMI
>>         bool
>>         select GENERIC_MSI_IRQ_DOMAIN
>>
>> +config MVEBU_PIC
>> +       bool
>
> Please switch to a builtin registration call, and remove module.h and
> all the MODULE_<xyz> references since this is a bool and not a
> tristate Kconfig.

I overlooked that someone else beat me to making the bool/tristate
comment -- oh well, that is a good thing that it is on other people's
minds too now.  Apologies for the duplicated feedback.

Paul.
