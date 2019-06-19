From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add support for
 Raydium RM67191 panel
Date: Wed, 19 Jun 2019 10:21:29 -0300
Message-ID: <CAOMZO5DwwL5+V4Eifskk=pKzpceRmk5bvdXNeCzZfU3jVwEhEA@mail.gmail.com>
References: <1560864646-1468-1-git-send-email-robert.chiras@nxp.com> <1560864646-1468-2-git-send-email-robert.chiras@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560864646-1468-2-git-send-email-robert.chiras@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Chiras <robert.chiras@nxp.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Robert,

On Tue, Jun 18, 2019 at 10:33 AM Robert Chiras <robert.chiras@nxp.com> wrote:

> +Optional properties:
> +- reset-gpios:         a GPIO spec for the RST_B GPIO pin
> +- pinctrl-0            phandle to the pin settings for the reset pin
> +- width-mm:            physical panel width [mm]
> +- height-mm:           physical panel height [mm]
> +- display-timings:     timings for the connected panel according to [1]

Still not convinced we need the 'display-timings' property, even as an
optional property. My understanding is that passing display timings in
the devicetree is not encouraged.

Last time you said you need to pass ''display-timings' to workaround
the problem of connecting this panel to mx8m DCSS or eLCDIF.

The panel timings come from the LCD manufacturer and it is agnostic to
what display controller interface it is connected to.

So I suggest making sure the timings passed in the driver are correct
as per the vendor datasheet. If they are correct and one specific
interface is not able to drive it, then probably it is a bug in this
specific display controller interface or in the SoC clock driver.
