From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [EXT] Re: [PATCH 2/2] drm/panel: Add support for Raydium RM67191
 panel driver
Date: Fri, 14 Jun 2019 10:39:53 -0300
Message-ID: <CAOMZO5DcvKQPDhP468VSCfQkFy-7roKBkw7uqXxTMn9PTTgS+A@mail.gmail.com>
References: <1560513063-24995-1-git-send-email-robert.chiras@nxp.com>
 <1560513063-24995-3-git-send-email-robert.chiras@nxp.com> <CAOMZO5BAborMvk=4cgreWKX6rJjK-237me98dM1dDV53oUnExQ@mail.gmail.com>
 <1560518953.9328.31.camel@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560518953.9328.31.camel@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Chiras <robert.chiras@nxp.com>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sam@ravnborg.org" <sam@ravnborg.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "airlied@linux.ie" <airlied@linux.ie>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 14, 2019 at 10:29 AM Robert Chiras <robert.chiras@nxp.com> wrote:

> The GPIO is active high, and the above sequence was received from the
> panel vendor in the following form:
>         SET_RESET_PIN(1);
>         MDELAY(10);
>         SET_RESET_PIN(0);
>         MDELAY(5);
>         SET_RESET_PIN(1);
>         MDELAY(20);
> I got rid of the first transition to high since seemed redundant.
> Also, according to the manual reference, the RSTB pin needs to be
> active high while operating the display.

That's exactly my point :-)

In normal operation the GPIO reset needs to be high.

During reset the GPIO reset needs to be low., which means that the
GPIO reset is "active low".

So you should invert both the dts and the driver to behave correctly.
