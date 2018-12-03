From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 0/5] media/sun6i: Allwinner A64 CSI support
Date: Mon, 3 Dec 2018 18:14:39 +0800
Message-ID: <CAGb2v64B-afrJ=n1td4HsJgtyrr=oxjF3M=pqjuKtp2AU2V0Gw@mail.gmail.com>
References: <20181203100747.16442-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203100747.16442-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 3, 2018 at 6:07 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> This series support CSI on Allwinner A64.
>
> The CSI controller seems similar to that of in H3, so fallback
> compatible is used to load the driver.
>
> Unlike other SoC's A64 has set of GPIO Pin gropus SDA, SCK intead
> of dedicated I2C controller, so this series used i2c-gpio bitbanging.
>
> Right now the camera is able to detect, but capture images shows
> sequence of red, blue line. any suggestion please help.

The CSI controller doesn't seem to work properly at the default
clock rate of 600 MHz. Dropping it down to 300 MHz, the default
rate used by the BSP, fixes things.

The BSP also tries to use different clock rates (multiples of 108 MHz)
according to the captured image size. I've not tried this since the
driver no longer exports sub-device controls, and I currently don't
know how to handle that to change the resolution.

Regards
ChenYu
