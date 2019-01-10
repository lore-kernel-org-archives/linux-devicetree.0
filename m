Return-Path: <SRS0=BP1I=PS=grandegger.com=wg@kernel.org>
Subject: Re: [PATCH V5 0/4] Microchip mcp25xxfd can controller driver
References: <20181221092950.14192-1-kernel@martin.sperl.org>
From: Wolfgang Grandegger <wg@grandegger.com>
Message-ID: <98ecfed2-0834-c842-540e-fb3cc4abe7e1@grandegger.com>
Date: Thu, 10 Jan 2019 09:30:20 +0100
MIME-Version: 1.0
In-Reply-To: <20181221092950.14192-1-kernel@martin.sperl.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
To: kernel@martin.sperl.org, linux-can@vger.kernel.org, devicetree@vger.kernel.org, Mark Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Sukkin Pang <skp@skpang.co.uk>, Gerhard Bertelsmann <info@gerhard-bertelsmann.de>, Wilhelm Leichtfried <Wilhelm.Leichtfried@microchip.com>, Thomas Kopp <Thomas.Kopp@microchip.com>, Enrico Scholz <enrico.scholz@sigma-chemnitz.de>, Brad Hanson <Brad.Hanson@arity.com>, Teemu Keskinarkaus <teemu.keskinarkaus@crosscontrol.com>
List-ID: <devicetree@vger.kernel.org>

Hello Martin,

Am 21.12.18 um 10:29 schrieb kernel@martin.sperl.org:
> From: Martin Sperl <kernel@martin.sperl.org>
> 
> This patchset adds a driver for the mcp25xxfd CanFD controller.
> 
> Most of the features of the controller are supported by this driver
> release.
> 
> The controller includes a few features that the current core Can(FD)
> implementation does not support: * Transmit Bandwidth Sharing bits
>   - this waits for a configurable number of syncronization bits before
>     atempting to transmit the next frame - for the moment controllable
>     via a module parameter
> * SID11 with CanFD frames
>   - at this moment not supported by driver
> * 3 transmit attempts in addition to ONE_SHOT
> * transmitter delay compensation configurations
> * micro second exact transmission and reception timestamps
>   - used internally by driver
> * variable number of tx-fifos
>   - exposed via module parameter at this moment
> 
> The driver has not been heavily optimized yet so there are a few
> "low hanging fruit" that have been left out from earlier versions
> of the patch set for sake of simplicity.
> 
> These optimizations shall be added as extra patches in a later cycle.

I applied all four patches adding:

  $ wc -l drivers/net/can/spi/mcp25xxfd/*
       5 drivers/net/can/spi/mcp25xxfd/Kconfig
      11 drivers/net/can/spi/mcp25xxfd/Makefile
    1204 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c
     803 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.c
     479 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_fifo.c
     760 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.h
     723 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_int.c
     208 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c
     824 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_tx.c
     199 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_gpio.c
     279 drivers/net/can/spi/mcp25xxfd/mcp25xxfd.h
    5495 insgesamt

Do I understand you correctly, this is the basic driver and the
optimizations are not yet included!? Well, I expected less code than
last time but now it's spit up in smaller files, at least. Will try to
do a review this week...

Wolfgang.
