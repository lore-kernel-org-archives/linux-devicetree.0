Return-Path: <SRS0=f+s3=S3=pengutronix.de=mfe@kernel.org>
Date: Thu, 25 Apr 2019 09:23:28 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v3 0/2] Microchip QT1050 support
Message-ID: <20190425072328.s6ukzchxabdx2edm@pengutronix.de>
References: <20190415165655.13016-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190415165655.13016-1-m.felsch@pengutronix.de>
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, voice.shen@atmel.com, raphaelpereira@gmail.com, linux-input@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Dmitry,

gentle ping.

On 19-04-15 18:56, Marco Felsch wrote:
> Hi,
> 
> this v3 contains all the comments made on my v2 [1].
> Each patch has it's own changelog so I omit it here.
> 
> I've tested it on a custom v5.0 kernel and rebased
> it on v5.1-rc5 without any issues.
> 
> [1] https://patchwork.kernel.org/cover/10659275/
> 
> Marco Felsch (2):
>   dt-bindings: input: add Microchip QT1050 bindings
>   Input: qt1050 - add Microchip AT42QT1050 support
> 
>  .../bindings/input/microchip,qt1050.txt       |  78 +++
>  drivers/input/keyboard/Kconfig                |  11 +
>  drivers/input/keyboard/Makefile               |   1 +
>  drivers/input/keyboard/qt1050.c               | 597 ++++++++++++++++++
>  4 files changed, 687 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/microchip,qt1050.txt
>  create mode 100644 drivers/input/keyboard/qt1050.c
> 
> -- 
> 2.20.1
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
