From: Gerlando Falauto <gerlando.falauto@keymile.com>
Subject: Re: DT version of kirkwood_ge0x_init()
Date: Wed, 05 Jun 2013 11:37:36 +0200
Message-ID: <51AF06E0.6040103@keymile.com>
References: <51ADBEE0.5040500@keymile.com> <51ADC2C2.6010106@gmail.com>
 <51AE53D4.5070208@keymile.com> <51AEFF26.8080004@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <51AEFF26.8080004@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, "Longchamp, Valentin" <Valentin.Longchamp@keymile.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "Brunck,
 Holger" <Holger.Brunck@keymile.com>, Thomas Gleixner <tglx@linutronix.de>, Simon Guinot <simon@sequanux.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Sebastian,

thanks for the info.

On 06/05/2013 11:04 AM, Sebastian Hesselbarth wrote:
[...]
>
> I have irqchip and clocksource drivers ready for Orion SoCs (Kirkwood,
> Dove, Orion5x, MV78x00). Just need some time to rebase and send patches.

[sorry we've moved to a different topic]
[adding Thomas Gleixner]
You mean the driver in arch/arm/plat-orion/gpio.c or the generic
one in drivers/gpio/gpio-mvebu.c?

Because the first one looks like it's using generic irq chip already.
For the second one I don't understand how you can handle the per-CPU 
registers which are peculiar to MV78200/ArmadaXP.
Unless there's already patches on top of Thomas's rework for the per-CPU 
registers.

Thank you,
Gerlando
