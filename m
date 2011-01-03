From: "H. Peter Anvin" <hpa@linux.intel.com>
Subject: Re: [sodaville] [PATCH 02/15] x86: Add device tree support
Date: Mon, 03 Jan 2011 10:05:15 -0800
Message-ID: <4D220FDB.4090000@linux.intel.com>
References: <1292600033-12271-1-git-send-email-bigeasy@linutronix.de>	<1292600033-12271-3-git-send-email-bigeasy@linutronix.de>	<20101230084311.GD11721@angua.secretlab.ca> <4D21BF17.6090209@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4D21BF17.6090209@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Grant Likely <grant.likely@secretlab.ca>, sodaville@linutronix.de, devicetree-discuss@lists.ozlabs.org, x86@kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/03/2011 04:20 AM, Sebastian Andrzej Siewior wrote:
> Grant Likely wrote:
>>> +extern char cmd_line[COMMAND_LINE_SIZE];
>>> +/* This number is used when no interrupt has been assigned */
>>> +#define NO_IRQ		(-1)
>>
>> 0 means NO_IRQ on x86 and most architectures.  I will change this when
>> I pick up the patch.
> 
> cat /proc/interrupts
>             CPU0
>    0:         40   IO-APIC-edge      timer
> 

0 for the timer is special.  However, Linus has declared that NO_IRQ is
to be zero, and that only very special interrupts like the PIT timer are
allowed to break that.

	-hpa
