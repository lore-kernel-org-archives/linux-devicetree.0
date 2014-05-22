From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Patch v5 0/7] Introduce keystone reset driver
Date: Thu, 22 May 2014 15:54:29 +0200
Message-ID: <5069120.YZWxxyxdrl@wuerfel>
References: <1400766516-14537-1-git-send-email-ivan.khoronzhuk@ti.com> <537E011B.9090902@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <537E011B.9090902@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, dbaryshkov@gmail.com, dwmw2@infradead.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, grant.likely@linaro.org, rdunlap@infradead.org, linux@arm.linux.org.uk, grygorii.strashko@ti.com, olof@lixom.net, w-kwok2@ti.com, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, m-karicheri2@ti.com, sergei.shtylyov@cogentembedded.com
List-Id: devicetree@vger.kernel.org

On Thursday 22 May 2014 09:52:27 Santosh Shilimkar wrote:
> On Thursday 22 May 2014 09:48 AM, Ivan Khoronzhuk wrote:
> > These patches introduce keystone reset driver.
> > 
> > The keystone SoC can be rebooted in several ways. By external reset
> > pin, by soft and by watchdogs. This driver allows software reset and reset
> > by one of the watchdogs. Also added opportunity to set soft/hard reset type.
> > 
> > Based on linux-next/master
> > 
> > v5..v4
> >   power: reset: keystone-reset: introduce keystone reset driver
> >       - changed to get rsmux and rspll offsets from DT
> >   clock: keystone-pllctrl: add bindings for keystone pll controller
> >       - new patch
> >   mfd: ti-keystone-devctrl: add bindings for device state control
> >       - new patch
> >   power: reset: add bindings for keystone reset driver
> >       - corrected description of "ti,syscon-pll", "ti,syscon-dev" properties
> >       - corrected examples
> >   ARM: dts: keystone: update reset node to work with reset driver
> >       - added nodes for pll-controller and device-state-controll
> >       - added offsets to "ti,syscon-pll", "ti,syscon-dev" properties
> >
> Looks like you haven't collected Arnd's Reviewed-by tag on the patches.
> Can be added later as well while applying.
> 
> 

I was going to comment the same. Anyway here you have it for the remaining
patches:

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
