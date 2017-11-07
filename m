From: Rob Herring <robh@kernel.org>
Subject: Re: next/master build: 214 builds: 26 failed, 188 passed, 28 errors,
 6333 warnings (next-20171107)
Date: Tue, 7 Nov 2017 08:02:47 -0600
Message-ID: <CAL_JsqJsXzgUvQrBXGQxuOrb-QUjOOiSyqhpF-V9NeaKG4TyrA@mail.gmail.com>
References: <5a0159b6.08bc500a.ebe4b.25c6@mx.google.com> <CAK8P3a3QKkGv6eSjX7wH6LpOY0-1XUPFoX0ntog5-ZSHPab6iA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a3QKkGv6eSjX7wH6LpOY0-1XUPFoX0ntog5-ZSHPab6iA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "kernelci.org bot" <bot@kernelci.org>, Kernel Build Reports Mailman List <kernel-build-reports@lists.linaro.org>, "open list:RALINK MIPS ARCHITECTURE" <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>, David Daney <david.daney@cavium.com>, Linus Walleij <linus.walleij@linaro.org>, Masami Hiramatsu <mhiramat@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 7, 2017 at 6:15 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tue, Nov 7, 2017 at 7:59 AM, kernelci.org bot <bot@kernelci.org> wrote:

>> 12 arch/arm/boot/dts/spear1340-evb.dtb: Warning (dmas_property): Property 'dmas', cell 4 is not a phandle reference in /ahb/apb/serial@b4100000
>> 12 arch/arm/boot/dts/spear1340-evb.dtb: Warning (dmas_property): Missing property '#dma-cells' in node /interrupt-controller@ec801000 or bad phandle (referred from /ahb/apb/serial@b4100000:dmas[4])
>> 12 arch/arm/boot/dts/spear1310-evb.dtb: Warning (gpios_property): Property 'cs-gpios', cell 6 is not a phandle reference in /ahb/apb/spi@e0100000
>> 12 arch/arm/boot/dts/spear1310-evb.dtb: Warning (gpios_property): Missing property '#gpio-cells' in node /interrupt-controller@ec801000 or bad phandle (referred from /ahb/apb/spi@e0100000:cs-gpios[6])
> ...
>
> endless stream of new dtc warnings, mostly valid. I have started
> fixing them but at some point
> gave up. Looking for help here.

Sorry, I intended to have these show up early in the cycle to give
time to fix, but between -next being sporadic and kernelci needing a
change to report dtc warnings it all landed late. It's really only
50-100 unique errors. Things just explode since everything is an
include file.

Rob
