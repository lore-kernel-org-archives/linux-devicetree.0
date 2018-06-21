Return-Path: <SRS0=AoJL=JH=grandegger.com=wg@kernel.org>
Subject: Re: [PATCH V4 0/3] Microchip mcp25xxfd can controller driver
References: <20180514160313.29597-1-kernel@martin.sperl.org>
 <6C9DAC2E-F20A-4FCE-A585-6DBCEEF97D08@martin.sperl.org>
 <4682a3b2-a924-0231-673c-566373cca412@grandegger.com>
 <51FF051D-FB8D-43B4-ADD8-7FEA380E6DEF@martin.sperl.org>
From: Wolfgang Grandegger <wg@grandegger.com>
Message-ID: <d031e6a0-e8e0-5946-7ef6-63a1a5541209@grandegger.com>
Date: Thu, 21 Jun 2018 09:38:06 +0200
MIME-Version: 1.0
In-Reply-To: <51FF051D-FB8D-43B4-ADD8-7FEA380E6DEF@martin.sperl.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
To: Martin Sperl <kernel@martin.sperl.org>
Cc: linux-can@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Mark Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marcel Birthelmer <Marcel.Birthelmer@microchip.com>, Sukkin Pang <skp@skpang.co.uk>, Gerhard Bertelsmann <info@gerhard-bertelsmann.de>
List-ID: <devicetree@vger.kernel.org>

Hello Martin, all,

Am 14.06.2018 um 07:19 schrieb Martin Sperl:
> 
>> On 12.06.2018, at 16:38, Wolfgang Grandegger <wg@grandegger.com> wrote:
>>
>> Hello Martin,
>>
>> this driver is huge... more than 4300 lines of code. That's maybe one
>> reason why it has not yet been reviewed. The driver includes a debugfs
>> interface and is also very verbose in general. I'm not sure if the
>> debugging code is really useful for the end user, but well, debugfs is
>> exactly for that purpose. What about splitting up the driver in a
>> subdirectory "mcp2517fd" into core, spi, debugfs, etc. Other opinions?
> 
> Splitting does unfortunately strip the compiler from the opportunity to
> Automatically inline code.
> 
> What I was thinking is maybe to split up the patch into:
> * basic functionality
> * debugfs
> * optimization code 
> * gpio lib related (already separated)
> * documentation comments
> 
> Would that be helpful?

I recently sent a review for:

[PATCH V3 2/3] can: mcp25xxfd: Add Microchip mcp25xxfd CAN FD driver

but it did not show up on the linux-can ml. I also cannot find the
original patch. Patch 2/3 from your V3 and V4 series is missing in the
archive. Is there a size limitation?

Wolfgang.
