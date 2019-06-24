From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [EXT] Re: [PATCH v3 2/2] drm/panel: Add support for Raydium
 RM67191 panel driver
Date: Mon, 24 Jun 2019 13:12:58 -0300
Message-ID: <CAOMZO5CVPJqE0dR2PZvKem4WHztvTF=FT9K1x-b7TduH-yYb7A@mail.gmail.com>
References: <1561037428-13855-1-git-send-email-robert.chiras@nxp.com>
 <1561037428-13855-3-git-send-email-robert.chiras@nxp.com> <CAOMZO5DS2v15h9E=qKg2vKuFkBSQQwdBHA5Th5mZ+ca6DWgQsw@mail.gmail.com>
 <1561362278.9328.83.camel@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561362278.9328.83.camel@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Chiras <robert.chiras@nxp.com>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sam@ravnborg.org" <sam@ravnborg.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "airlied@linux.ie" <airlied@linux.ie>
List-Id: devicetree@vger.kernel.org

Hi Robert,

On Mon, Jun 24, 2019 at 4:44 AM Robert Chiras <robert.chiras@nxp.com> wrote:

> > You did not handle the "power" regulator.
> There is no need for a power regulator.

I am sure the panel requires power to be applied so that it can work :-)

> > Can't you simply remove them?
> The reset gpio pin is shared between the DSI display controller and

Looking at the imx8mq-evk schematics it is not clear for me what pin
in shared between the OLED display and touch screen.

Could you please clarify which pin you are referring to?

> touch controller, both found on the same panel. Since, the touch driver
> also acceses this gpio pin, in some cases the display can be put to
> sleep, but the touch is still active. This is why, during suspend I
> release the gpio resource, and I have to take it back in resume.
> Without this release/acquire mechanism during suspend/resume, stress-
> tests showed some failures: the resume freezes completly.

Looking at the imx8mq-evk dts from the vendor tree I see that the
touchscreen is not supported in mainline yet.

Maybe there is a better way to solve this, so what if you don't
introduce the suspend/resume hooks for now and then we revisit this
after the touchscreen driver is added?
