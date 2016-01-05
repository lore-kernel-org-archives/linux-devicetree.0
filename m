From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] of/platform: export of_default_bus_match_table
Date: Tue, 05 Jan 2016 12:48:29 +0100
Message-ID: <4336094.nx25lSVlfU@wuerfel>
References: <1451960273-19934-1-git-send-email-yamada.masahiro@socionext.com> <2748326.r4zEhnPneC@wuerfel> <CAK7LNAR3yxRoQ-qLCASAaCwzCZaSiXMbRjasfWf=X1O9P49fgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNAR3yxRoQ-qLCASAaCwzCZaSiXMbRjasfWf=X1O9P49fgw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: devicetree@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Olof Johansson <olof@lixom.net>, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 05 January 2016 19:50:31 Masahiro Yamada wrote:
> 2016-01-05 19:13 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> > On Tuesday 05 January 2016 11:17:53 Masahiro Yamada wrote:
> 
> This bus is used to connect external (on-board) devices with the SoC.
> 
> So, no possibility for AMBA, but
> I want "simple-bus" for grouping some device nodes.
> Also, "simple-mfd" would be useful because an external device could be an MFD.
> 
> 
> Please see arch/arm/boot/dts/uniphier-support-card.dtsi
> 
> It describes an add-on card (expansion board)
> which has ETHER, UART, etc. on it.
> 
> I implemented it as "simple-bus".
> 
> This card is connected to the chip select 1
> of the UniPhier System Bus.
> 

Ok, got it. So you could alternatively define your own match table
in the driver with just "simple-bus" and  "simple-mfd". I think either
way is fine, let's see what the DT maintainers prefer.

	Arnd
