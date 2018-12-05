From: <Nicolas.Ferre@microchip.com>
Subject: Re: Moving ARM dts files
Date: Wed, 5 Dec 2018 08:13:37 +0000
Message-ID: <392c9399-83c8-a74a-a849-748225802851@microchip.com>
References: <20181204183649.GA5716@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181204183649.GA5716@bogus>
Content-Language: en-US
Content-ID: <860E0E98F3268844A88BC71619279FEA@namprd11.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh@kernel.org, arm@kernel.org
Cc: andrew@lunn.ch, alexandre.belloni@bootlin.com, tony@atomide.com, linus.walleij@linaro.org, liviu.dudau@arm.com, yamada.masahiro@socionext.com, thierry.reding@gmail.com, f.fainelli@gmail.com, khilman@kernel.org, gregory.clement@bootlin.com, michal.simek@xilinx.com, krzk@kernel.org, Ludovic.Desroches@microchip.com, joel@jms.id.au, andy.gross@linaro.org, devicetree@vger.kernel.org, jason@lakedaemon.net, horms@verge.net.au, linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com, shawnguo@kernel.org, afaerber@suse.de, daniel@zonque.org
List-Id: devicetree@vger.kernel.org

On 04/12/2018 at 19:36, Rob Herring wrote:
> Olof, Arnd,
> 
> I've put together a script to move the dts files and update the
> makefiles. It doesn't handle files not following a common prefix which
> isn't many and some includes within the dts files will need some fixups
> by hand.
> 
> MAINTAINERS will also need updating.
> 
> A few questions:
> 
> Do we want to move absolutely everything to subdirs? There's quite a
> few platforms with only 1-2 platforms. I haven't added these to the
> list yet, but can.
> 
> Do any vendors need another level of directories? davinci, omap, nspire,
> etc. for TI for example.
> 
> What to do with armv7m.dtsi? I guess it should remain and we just fixup
> the include. There may be a few other cross vendor things.
> 
> 
> Sub-arch maintainers,
> 'vendor_map' below is the mapping of file prefix to new subdirectory
> (the SoC vendor prefix). Please comment if there are any issues.

It'll certainly break some of our scripts (CI, building scripts, overlay 
makefiles, etc.). We already experienced it when adding the "dts" 
directory. But if it's needed...

> 8<-----------------------------------------------------------
> #!/usr/bin/env python3
> 
> import os
> import re
> from git import Git
> import glob
> 
> vendor_map = {

[..]

>      'integ' : 'arm',
>      've' : 'arm',
>      'aspeed' : 'aspeed',
>      'at91' : 'atmel',

As it's a new directory, what about creating a "microchip" one as it's 
our vendor's name now.

>      'sama' : 'atmel',

If desired, you can extend to sama5d for the current files.

Adding the entry 'sam9' : "microchip", can be future proof...


Best regards,
-- 
Nicolas Ferre
