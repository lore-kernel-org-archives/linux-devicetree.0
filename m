From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v2 0/8] Raspberry Pi 2 support.
Date: Sat, 26 Dec 2015 22:38:05 +0100
Message-ID: <567F08BD.50204@tronnes.org>
References: <1450310115-22163-1-git-send-email-eric@anholt.net>
 <20151218100826.GB1145@omega> <20151220221158.GA6416@omega>
 <874mfbflj3.fsf@eliezer.anholt.net> <20151222142643.GB29335@omega>
 <87si2uux2s.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <87si2uux2s.fsf@eliezer.anholt.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Eric Anholt <eric@anholt.net>, Alexander Aring <alex.aring@gmail.com>, Phil <phil@raspberrypi.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Scott Branden <sbranden@broadcom.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc Zyngier <marc.zyngier@arm.com>, Ray Jui <rjui@broadcom.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


Den 22.12.2015 20:01, skrev Eric Anholt:

>
>> After finally booting the RPi2 I get several messages of:
>>
>> unexpected IRQ trap at vector 00
>>
>> while typing _one_ character over uart.
> We were doing some debugging of that recently.  It seems that every once
> in a while we get woken up but nothing shows up in the top-level status
> register.  We need to just make the irqchip ignore instead of trying to
> look up a handler in that case, but I haven't prioritized it because it
> makes me worry that I'm just papering over a problem in our IRQ masking
> or something.
>
> I haven't seen any problems other than the printk, though.

Downstream has this patch[1]:
irq-bcm2836: Prevent spurious interrupts, and trap them early

It has been used in the nightly build of OpenELEC[2] for 5 days now without
any complaints (used with the downstream ARCH_BCM2709).

[1] 
https://github.com/raspberrypi/linux/commit/688a5f2ada4fbd16547b574a17e6d359ab2364d0
[2] http://forum.kodi.tv/showthread.php?tid=250817&pid=2192054#pid2192054
