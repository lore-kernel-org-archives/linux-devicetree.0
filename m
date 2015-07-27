From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 0/3] ARM: UniPhier: update DTS and MAINTAINERS
Date: Mon, 27 Jul 2015 14:55:41 +0200
Message-ID: <20150727125541.GA19768@localhost>
References: <1437809004-16806-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1437809004-16806-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: arm@kernel.org, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Joe Perches <joe@perches.com>, devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Greg KH <gregkh@linuxfoundation.org>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Pawel Moll <pawel.moll@arm.com>, Jiri Slaby <jslaby@suse.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Jul 25, 2015 at 04:23:21PM +0900, Masahiro Yamada wrote:
> Hi Arnd and Olof,
> 
> The pinctrl drivers for UniPhier SoCs were accepted by Linus Walleij
> into the linux-pinctrl subsystem.
> 
> Here is a small series I'd like you to merge into the ARM-SOC subsystem
> to use my pinctrl drivers.
> 

Thanks, applied 1 and 2 to next/dt, the third I added to next/soc.


-Olof
