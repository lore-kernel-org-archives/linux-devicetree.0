From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 0/4] RDU1/2 latest supported RAVE SP nodes
Date: Thu, 28 Jun 2018 11:53:15 +0200
Message-ID: <1530179595.22468.50.camel@pengutronix.de>
References: <20180628042424.12664-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180628042424.12664-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>, cphealy@gmail.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, den 27.06.2018, 21:24 -0700 schrieb Andrey Smirnov:
> Shawn:
> 
> These are patches adding the rest of RAVE SP child nodes covering all
> the rest of currently supported MFD cells. There's more to be added,
> once more drivers get accepted upstream.
> 
> The bindings three drivers mentioned are availible in:
> 
>     Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt
>     Documentation/devicetree/bindings/input/zii,rave-sp-pwrbutton.txt
>     Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.txt
> 
> Feedback is welcome!

Apart from the RDU 1/2 mixup you noticed yourself this looks good to
me. Maybe Shawn can just fix this up while applying.

For the series:
Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

Regards,
Lucas
