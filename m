Return-Path: <SRS0=6DDo=OF=pengutronix.de=mfe@kernel.org>
Date: Mon, 26 Nov 2018 10:13:59 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v2 0/2] Microchip QT1050 support
Message-ID: <20181126091359.lkzo6ijzjks7v4qu@pengutronix.de>
References: <20181029133826.30326-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181029133826.30326-1-m.felsch@pengutronix.de>
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, voice.shen@atmel.com, raphaelpereira@gmail.com, linux-input@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi,

I send this series a month ago, Rob already added his reviewed-by tag.

Regards,
Marco

On 18-10-29 14:38, Marco Felsch wrote:
> Hi,
> 
> this is my v2 containing the comments made on my v1 [1].
> 
> I split the dt-bindings according to commit [2].
> 
> [1] https://www.spinics.net/lists/devicetree/msg250279.html
> [2] https://www.spinics.net/lists/devicetree/msg253946.html
> 
> Marco Felsch (2):
>   dt-bindings: input: add Microchip QT1050 bindings
>   Input: qt1050 - add Microchip AT42QT1050 support
> 
>  .../bindings/input/microchip,qt1050.txt       |  74 +++
>  drivers/input/keyboard/Kconfig                |  11 +
>  drivers/input/keyboard/Makefile               |   1 +
>  drivers/input/keyboard/qt1050.c               | 620 ++++++++++++++++++
>  4 files changed, 706 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/microchip,qt1050.txt
>  create mode 100644 drivers/input/keyboard/qt1050.c
> 
> -- 
> 2.19.1
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
