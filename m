From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH V3 11/11] MIPS: Add multiplatform BMIPS target
Date: Mon, 24 Nov 2014 10:34:15 -0800
Message-ID: <CAL1qeaH8d0DAZ5SEyioPUM1WXvTgyEoXOqM88-tibnsd-MDT=Q@mail.gmail.com>
References: <1416796846-28149-1-git-send-email-cernekee@gmail.com>
	<1416796846-28149-12-git-send-email-cernekee@gmail.com>
	<11772640.IZcxoRkMEM@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <11772640.IZcxoRkMEM@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, jfraser-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Nov 24, 2014 at 6:00 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> ---
>>  .../devicetree/bindings/mips/brcm/bmips.txt        |   8 +
>>  .../devicetree/bindings/mips/brcm/soc.txt          |  12 ++
>>  arch/mips/Kbuild.platforms                         |   1 +
>>  arch/mips/Kconfig                                  |  36 ++++
>>  arch/mips/bmips/Kconfig                            |  50 ++++++
>>  arch/mips/bmips/Makefile                           |   1 +
>>  arch/mips/bmips/Platform                           |   7 +
>>  arch/mips/bmips/dma.c                              | 141 +++++++++++++++
>>  arch/mips/bmips/irq.c                              |  38 ++++
>>  arch/mips/bmips/setup.c                            | 195 +++++++++++++++++++++
>>  arch/mips/boot/dts/Makefile                        |   9 +
>>  arch/mips/boot/dts/bcm3384_viper.dtsi              | 108 ++++++++++++
>>  arch/mips/boot/dts/bcm3384_zephyr.dtsi             | 126 +++++++++++++
>>  arch/mips/boot/dts/bcm6328.dtsi                    |  87 +++++++++
>>  arch/mips/boot/dts/bcm6368.dtsi                    |  94 ++++++++++
>>  arch/mips/boot/dts/bcm7125.dtsi                    | 107 +++++++++++
>>  arch/mips/boot/dts/bcm7346.dtsi                    | 192 ++++++++++++++++++++
>>  arch/mips/boot/dts/bcm7360.dtsi                    | 129 ++++++++++++++
>>  arch/mips/boot/dts/bcm7420.dtsi                    | 151 ++++++++++++++++
>>  arch/mips/boot/dts/bcm7425.dtsi                    | 191 ++++++++++++++++++++
>
> I hadn't noticed before that the dts files are now all in one
> directory on MIPS, apparently after a patch from Andrew Brewsticker.
> We should really coordinate these things better, we have just merged
> an arm64 patch to split out the files into multiple directories.

FWIW, I'm planning on sending a patch once 3.19-rc1 is released to
move the DTs into per-vendor sub-directories.  I was expecting to do
it for 3.19, but Robert Richter's series which added kbuild support
for the vendor sub-directories did not end up landing in 3.18.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
