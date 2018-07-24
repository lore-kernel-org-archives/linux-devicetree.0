From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 04/15] MIPS: dts: img: pistachio_marduk: Switch mmc to 1
 bit mode
Date: Wed, 25 Jul 2018 00:15:44 +0200
Message-ID: <1b7064bc-7008-2c1c-2398-143401bbc368@suse.de>
References: <20180722212010.3979-1-afaerber@suse.de>
 <20180722212010.3979-5-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180722212010.3979-5-afaerber@suse.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, linux-kernel@vger.kernel.org, Ian Pozella <Ian.Pozella@imgtec.com>, James Hartley <james.hartley@sondrel.com>, Rahul Bedarkar <rahulbedarkar89@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am 22.07.2018 um 23:19 schrieb Andreas Färber:
> From: Ian Pozella <Ian.Pozella@imgtec.com>
> 
> The mmc block in Pistachio allows 1 to 8 data bits to be used.
> Marduk uses 4 bits allowing the upper 4 bits to be allocated
> to the Mikrobus ports. However these bits are still connected
> internally meaning the mmc block recieves signals on all data lines

"receives"

I had fixed a number of typos from the downstream patches already, but
this one slipped through.

Regards,
Andreas

> and seems the internal HW CRC checks get corrupted by this erroneous
> data.
> 
> We cannot control what data is sent on these lines because they go
> to external ports. 1 bit mode does not exhibit the issue hence the
> safe default is to use this. If a user knows that in their use case
> they will not use the upper bits then they can set to 4 bit mode in
> order to improve performance.
> 
> Also make sure that the upper 4 bits don't get allocated to the mmc
> driver (the default is to assign all 8 pins) so they can be allocated
> to other drivers. Allocating all 4 despite setting 1 bit mode as this
> matches what is there in hardware.
> 
> Signed-off-by: Ian Pozella <Ian.Pozella@imgtec.com>
> Signed-off-by: Andreas Färber <afaerber@suse.de>
[snip]

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
