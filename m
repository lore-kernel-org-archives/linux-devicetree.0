From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH 0/5] Add tda998x (HDMI) support to atmel-hlcdc
Date: Mon, 9 Apr 2018 13:44:22 +0200
Message-ID: <bbc7a992-5f17-c108-2b6a-01a585e6e315@axentia.se>
References: <20180409105918.20792-1-peda@axentia.se>
 <20180409111733.GP16141@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180409111733.GP16141@n2100.armlinux.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 2018-04-09 13:17, Russell King - ARM Linux wrote:
> On Mon, Apr 09, 2018 at 12:59:13PM +0200, Peter Rosin wrote:
>> During this, I found that the tda998x driver never sets the format in
>> the connector display_info. Thus, the atmel-hlcdc driver fails to select
>> output format. Since I had similar problems with ds90c185 lvds encoder
>> I added patches to override the atmel-hlcdc output format via a DT
>> property and things start to play together.
> 
> That sounds like a hack.  The tda998x driver doesn't set the format
> because it pre-dates the addition of this information in the display
> info structure, and none of its current users require that information.
> 
> As you're the first to require it, rather than working around the
> driver by adding stuff to DT, it would be much better to improve the
> driver by adding this information.
> 
> Thanks.

Even if I improved the tda998x driver, it would not be correct.

The background is that while the atmel-hlcdc driver supports rgb888,
our PCB is only wired for rgb565. And the tda19988 has rgb888 input
(we have the lsb bits tied to ground on our PCB). So, the tda998x
driver can request rgb888 and the atmel-hlcdc driver can say ok,
but it still would not be correct. So, where exactly do you suggest
that I model the narrowing of the display format?

Cheers,
Peter
