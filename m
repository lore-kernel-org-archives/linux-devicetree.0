From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/3] dt-bindings: display: bridge: lvds-transmitter: add pwdn-gpios
Date: Wed, 19 Dec 2018 13:38:57 +0200
Message-ID: <2541072.bfOLpEHFeN@avalon>
References: <20181218231850.3572-1-peda@axentia.se> <f0686eeb-14af-6525-6c55-9cc8bdc5730e@samsung.com> <7c2f1268-43a3-1dc2-bb2d-6da9d74a5a43@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7c2f1268-43a3-1dc2-bb2d-6da9d74a5a43@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: Andrzej Hajda <a.hajda@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Archit Taneja <architt@codeaurora.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello,

On Wednesday, 19 December 2018 11:57:32 EET Peter Rosin wrote:
> On 2018-12-19 10:12, Andrzej Hajda wrote:
> > On 19.12.2018 00:19, Peter Rosin wrote:
> >> Add optional property to specify a power-down GPIO.
> >> The pwdn-gpios name is already in use by the thine,thc63lvdm83d
> >> binding, so go with that.
> >>
> >> Signed-off-by: Peter Rosin <peda@axentia.se>
> >> ---
> >> 
> >>  Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt |
> >>  3 +++ 
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git
> >> a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> >> b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> >> index f9e7dd666f58..47941d39f92f 100644
> >> ---
> >> a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> >> +++
> >> b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> >> @@ -31,6 +31,9 @@ Required properties:
> >>    device-specific version corresponding to the device first
> >>    followed by the generic version.
> >> 
> >> +Optional properties:
> >> +- pwdn-gpios: Power-down control GPIO
> >> +
> > 
> > Since naming is not enforced by any datasheet I would propose something
> > more popular with less twisted logic. Maybe:
> > 
> > - enable-gpios: ... (active high).
> 
> That was my original thought too, but the driver implementing the
> lvds-encoder bindings also handles the mentioned thine,thc63lvdm83d
> lvds encoder, and that binding has the "pwdn" naming. So, for driver
> implementation simplicity I went with what was already there, thus
> allowing adding support for both bindings with one implementation
> (in patch 3/3).
> 
> Adding code just to handle multiple names for the same thing does
> not sounds too appealing.

I'm afraid I think we shouldn't add pwdn-gpios support to the lvds encoder DT 
bindings. The reason is that control GPIOs (and regulators) come with device-
specific semantics. If we add pwdn-gpios now, we'll then add reset-gpios, and 
power supplies, and all of a sudden we'll end up having to encode sequencing 
of GPIOs and power supplies in DT. That path has been tried in the past, with 
no good results.

I would instead create device-specific bindings, like done for 
thine,thc63lvdm83d. It's fine to then add support for the pwdn-gpios property 
in the lvds-encoder driver, as long as the meaning of the property comes from 
specific DT bindings, not from the generic ones.

-- 
Regards,

Laurent Pinchart
