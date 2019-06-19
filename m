From: James Morse <james.morse@arm.com>
Subject: Re: [PATCH 2/2] edac: add support for Amazon's Annapurna Labs EDAC
Date: Wed, 19 Jun 2019 18:22:37 +0100
Message-ID: <44da6863-eb79-a61b-a4bf-9e8c6cacc2b8@arm.com>
References: <1559211329-13098-1-git-send-email-hhhawa@amazon.com>
 <1559211329-13098-3-git-send-email-hhhawa@amazon.com>
 <3129ed19-0259-d227-0cff-e9f165ce5964@arm.com>
 <4514bfa2-68b2-2074-b817-2f5037650c4e@amazon.com>
 <fdc3b458-96eb-1734-c294-2463f37f2244@arm.com>
 <bbb9b41d-8ffa-d4c5-c199-2400695cce8d@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bbb9b41d-8ffa-d4c5-c199-2400695cce8d@amazon.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: "Hawa, Hanna" <hhhawa@amazon.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, bp@alien8.de, mchehab@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, nicolas.ferre@microchip.com, paulmck@linux.ibm.com, dwmw@amazon.co.uk, benh@amazon.com, ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com, hanochu@amazon.com, linux-edac@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Hawa,

On 17/06/2019 14:00, Hawa, Hanna wrote:
>> I don't think it can, on a second reading, it looks to be even more complicated than I
>> thought! That bit is described as disabling forwarding of uncorrected data, but it looks
>> like the uncorrected data never actually reaches the other end. (I'm unsure what 'flush'
>> means in this context.)
>> I was looking for reasons you could 'know' that any reported error was corrected. This was
>> just a bad suggestion!

> Is there interrupt for un-correctable error?

The answer here is somewhere between 'not really' and 'maybe'.
There is a signal you may have wired-up as an interrupt, but its not usable from linux.

A.8.2 "Asychronous error signals" of the A57 TRM [0] has:
| nINTERRIRQ output Error indicator for an L2 RAM double-bit ECC error.
("7.6 Asynchronous errors" has more on this).

Errors cause L2ECTLR[30] to get set, and this value output as a signal, you may have wired
it up as an interrupt.

If you did, beware its level sensitive, and can only be cleared by writing to L2ECTLR_EL1.
You shouldn't allow linux to access this register as it could mess with the L2
configuration, which could also affect your EL3 and any secure-world software.

The arrival of this interrupt doesn't tell you which L2 tripped the error, and you can
only clear it if you write to L2ECTLR_EL1 on a CPU attached to the right L2. So this isn't
actually a shared (peripheral) interrupt.

This stuff is expected to be used by firmware, which can know the affinity constraints of
signals coming in as interrupts.


> Does 'asynchronous errors' in L2 used to report UE?

>From "7.2.4 Error correction code" single-bit errors are always corrected.
A.8.2 quoted above gives the behaviour for double-bit errors.


> In case no interrupt, can we use die-notifier subsystem to check if any error had occur
> while system shutdown?

notify_die() would imply a synchronous exception that killed a thread. SError are a whole
lot worse. Before v8.2 these are all treated as 'uncontained': unknown memory corruption.
Which in your L2 case is exactly what happened. The arch code will panic().

If your driver can print something useful to help debug the panic(), then a panic_notifier
sounds appropriate. But you can't rely on these notifiers being called, as kdump has some
hooks that affect if/when they run.

(KVM will 'contain' SError that come from a guest to the guest, as we know a distinct set
of memory was in use. You may see fatal error counters increasing without the system
panic()ing)

contained/uncontained is part of the terminology from the v8.2 RAS spec [1].


Thanks,

James


[0]
http://infocenter.arm.com/help/topic/com.arm.doc.ddi0488c/DDI0488C_cortex_a57_mpcore_r1p0_trm.pdf
[1]
https://static.docs.arm.com/ddi0587/ca/ARM_DDI_0587C_a_RAS.pdf?_ga=2.148234679.1686960568.1560964184-897392434.1556719556
