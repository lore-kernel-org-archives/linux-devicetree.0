From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v6 00/14] Add System Error Interrupt support to Armada SoCs
Date: Tue, 02 Oct 2018 16:30:51 +0200
Message-ID: <875zyko1yc.fsf@bootlin.com>
References: <20181001141358.31508-1-miquel.raynal@bootlin.com>
 <86a7nwvcnn.wl-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <86a7nwvcnn.wl-marc.zyngier@arm.com> (Marc Zyngier's message of
 "Tue, 02 Oct 2018 11:57:48 +0100")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Catalin Marinas <catalin.marinas@arm.com>, Hanna Hawa <hannah@marvell.com>, Haim Boot <hayim@marvell.com>, Will Deacon <will.deacon@arm.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Marc,
 
 On mar., oct. 02 2018, Marc Zyngier <marc.zyngier@arm.com> wrote:

> On Mon, 01 Oct 2018 15:13:44 +0100,
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>> 
>> The ICU is an IRQ chip found in Armada CP110. It currently has 207 wired
>> inputs. Its purpose is to aggregate all CP interrupts and report them to
>> the AP through MSIs. The ICU writes into GIC registers (AP side) by way
>> of the interconnect. These interrupts can be of several groups:
>> - SecuRe (SR);
>> - Non-SecuRe (NSR);
>> - System Error Interrupts (SEI);
>> - RAM Error Interrupts (REI);
>> - ...
>> Each ICU wired interrupt can be of any of these groups. The group is
>> encoded in the MSI payload.
>
> [...]
>
> I'm now ready to queue patches 1 through to 11 (with patches 6 and 9
> as of v7). Who is picking up the DT patches (12 to 14)?

I will do it.

Thanks,

Gregory
>
> Thanks,
>
> 	M.
>
> -- 
> Jazz is not dead, it just smell funny.

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
