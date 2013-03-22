From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 02/11] ARM: remove extra timer-sp control register clearing
Date: Thu, 21 Mar 2013 21:36:15 -0500
Message-ID: <514BC39F.6050209@gmail.com>
References: <1363820051-24428-1-git-send-email-robherring2@gmail.com> <1363820051-24428-3-git-send-email-robherring2@gmail.com> <20130321192322.GR4977@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130321192322.GR4977@n2100.arm.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, linus.walleij@linaro.org, haojian.zhuang@linaro.org, pawel.moll@arm.com, john.stultz@linaro.org, tglx@linutronix.de, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On 03/21/2013 02:23 PM, Russell King - ARM Linux wrote:
> On Wed, Mar 20, 2013 at 05:54:02PM -0500, Rob Herring wrote:
>> From: Rob Herring <rob.herring@calxeda.com>
>>
>> The timer-sp initialization code clears the control register before
>> initializing the timers, so every platform doing this is redundant.
>>
>> For unused timers, we should not care what state they are in.
> 
> NAK.  We do care what state they're in.  What if they have their interrupt
> enable bit set, and IRQ is shared with the clock event timer?
> 
> No, this patch is just wrong.

Okay, I can have the timer init function clear the register in the case
that even when the timer is unused.

Rob
