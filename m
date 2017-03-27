From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 0/2] drm/sun4i: Add display backend interrupt to
 dt binding
Date: Mon, 27 Mar 2017 22:38:45 +0800
Message-ID: <20170327143847.16259-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB6WH4TDAKGQEPVHUXQQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

As promised, here is the patch adding the interrupt line for the display
backend to the sun5i shared dtsi, and another one adding it to the device
tree bindings.

The display backend has an undocumented (in the user manual) interrupt
that, according to vendor code, is raised when the current scanout is
completed. This might be a better fit for DRM/KMS vblank signalling,
rather than the TCON's vblank interrupt. If true, it would allow us
to cut out the TCON from the crtc in the driver, instead keeping it
solely as an encoder, simplifying some of the inter-component code.

Regardless, the interrupt line exists and should be added to the
device tree.


Regards
ChenYu

Chen-Yu Tsai (2):
  drm/sun4i: Add display backend interrupt to device tree binding
  ARM: dts: sun5i: Add interrupt for display backend

 Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 2 ++
 arch/arm/boot/dts/sun5i.dtsi                                  | 1 +
 2 files changed, 3 insertions(+)

-- 
2.11.0
