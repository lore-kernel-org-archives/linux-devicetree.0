Return-Path: <SRS0=OGe9=JA=martin.sperl.org=kernel@kernel.org>
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH V4 0/3] Microchip mcp25xxfd can controller driver
From: Martin Sperl <kernel@martin.sperl.org>
In-Reply-To: <4682a3b2-a924-0231-673c-566373cca412@grandegger.com>
Date: Thu, 14 Jun 2018 07:19:37 +0200
Content-Transfer-Encoding: 7bit
Message-Id: <51FF051D-FB8D-43B4-ADD8-7FEA380E6DEF@martin.sperl.org>
References: <20180514160313.29597-1-kernel@martin.sperl.org> <6C9DAC2E-F20A-4FCE-A585-6DBCEEF97D08@martin.sperl.org> <4682a3b2-a924-0231-673c-566373cca412@grandegger.com>
To: Wolfgang Grandegger <wg@grandegger.com>
Cc: linux-can@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Mark Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marcel Birthelmer <Marcel.Birthelmer@microchip.com>, Sukkin Pang <skp@skpang.co.uk>, Gerhard Bertelsmann <info@gerhard-bertelsmann.de>
List-ID: <devicetree@vger.kernel.org>


> On 12.06.2018, at 16:38, Wolfgang Grandegger <wg@grandegger.com> wrote:
> 
> Hello Martin,
> 
> this driver is huge... more than 4300 lines of code. That's maybe one
> reason why it has not yet been reviewed. The driver includes a debugfs
> interface and is also very verbose in general. I'm not sure if the
> debugging code is really useful for the end user, but well, debugfs is
> exactly for that purpose. What about splitting up the driver in a
> subdirectory "mcp2517fd" into core, spi, debugfs, etc. Other opinions?

Splitting does unfortunately strip the compiler from the opportunity to
Automatically inline code.

What I was thinking is maybe to split up the patch into:
* basic functionality
* debugfs
* optimization code 
* gpio lib related (already separated)
* documentation comments

Would that be helpful?

Thanks, Martin 
