From: David Daney <david.daney@cavium.com>
Subject: Re: [PATCH 2/2] gpio/MIPS/OCTEON: Add a driver for OCTEON's on-chip
 GPIO pins.
Date: Thu, 17 May 2012 14:37:43 -0700
Message-ID: <4FB56FA7.9070401@cavium.com>
References: <1334275820-7791-1-git-send-email-ddaney.cavm@gmail.com> <1334275820-7791-3-git-send-email-ddaney.cavm@gmail.com> <20120517205044.81B1C3E0621@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120517205044.81B1C3E0621@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>, "ralf@linux-mips.org" <ralf@linux-mips.org>
Cc: David Daney <ddaney.cavm@gmail.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Linus Walleij <linus.walleij@stericsson.com>, Rob Herring <rob.herring@calxeda.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 05/17/2012 01:50 PM, Grant Likely wrote:
> On Thu, 12 Apr 2012 17:10:20 -0700, David Daney<ddaney.cavm@gmail.com>  wrote:
>> From: David Daney<david.daney@cavium.com>
>>
>> The SOCs in the OCTEON family have 16 (or in some cases 20) on-chip
>> GPIO pins, this driver handles them all.  Configuring the pins as
>> interrupt sources is handled elsewhere (OCTEON's irq handling code).
>>
>> Signed-off-by: David Daney<david.daney@cavium.com>
>
> Aside from the bugs already pointed out;
>
> Acked-by: Grant Likely<grant.likely@secretlab.ca>
>
> Will you merge this series via the MIPS tree, or do I need to pick it
> up?

Thanks Grant.

I will make the fixes and resubmit.  I expect Ralf can merge these along 
with the rest of the pile of OCTEON patches.

David Daney

>
>> ---
>>   drivers/gpio/Kconfig       |    8 ++
>>   drivers/gpio/Makefile      |    1 +
>>   drivers/gpio/gpio-octeon.c |  166 ++++++++++++++++++++++++++++++++++++++++++++
