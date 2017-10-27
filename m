From: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH] display: panel: Add Tianma tm070rvhg71 display support
 (800x480)
Date: Fri, 27 Oct 2017 10:18:00 +0200
Message-ID: <20171027101800.5dbfb161@jawa>
References: <1508537403-878-1-git-send-email-lukma@denx.de>
        <20171027031336.psu7hn27w2xajyux@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171027031336.psu7hn27w2xajyux@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

> On Sat, Oct 21, 2017 at 12:10:03AM +0200, Lukasz Majewski wrote:
> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > ---
> >  .../bindings/display/panel/tianma,tm070rvhg71.txt  |  7 ++++++
> >  drivers/gpu/drm/panel/panel-simple.c               | 27
> > ++++++++++++++++++++++ 2 files changed, 34 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt
> > b/Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt
> > new file mode 100644 index 0000000..b84217f --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt
> > @@ -0,0 +1,7 @@ +Tianma Micro-electronics TM070RVHG71 7.0" WXGA TFT
> > LCD panel +
> > +Required properties:
> > +- compatible: should be "tianma,tm070rvhg71
> > +
> > +This binding is compatible with the simple-panel binding, which is
> > specified +in simple-panel.txt in this directory.
> 
> No supplies? Still need to list power-supply here if so, so it is
> clear that this display has a single supply (or you need to list
> multiple ones if not).

I took the same approach as several other simple panels having
description in Documentation/devicetree/bindings/display/panel/*
directory (e.g. innolux,g121i1-l01.txt) .

In the description it is stated that this binding is compatible with
one documented in the simple-panel.txt, which defines following
properties:

Required properties:
- power-supply: regulator to provide the supply voltage

Optional properties:
- ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
- enable-gpios: GPIO pin to enable or disable the panel
- backlight: phandle of the backlight device attached to the panel


Do I need to do something more?

> 
> Rob


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
