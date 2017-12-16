From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 0/5] IR support for A83T - sunxi-ir driver update
Date: Sat, 16 Dec 2017 03:49:09 +0100
Message-ID: <20171216024914.7550-1-embed3d@gmail.com>
Reply-To: embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD257DPK24NRBLMT2LIQKGQENENPZ2Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch series adds support for the sunxi A83T ir module and enhances the sunxi-ir driver.
Right now the base clock frequency for the ir driver is a hard coded define and is set to 8 MHz.
This works for the most common ir receivers. On the Sinovoip Bananapi M3 the ir receiver needs,
a 3 MHz base clock frequency to work without problems with this driver (like in the legacy kernel).

To fix this issue I reworked the driver that this value could be set over the devicetree.

About 37 devices would have a devicetree change if this patch series would be applied.
Therfore I would like to ask you to give me some feedback about the patch series, before I finialize it.


Thanks in advance!

Philipp


Philipp Rossak (5):
  [media] rc: update sunxi-ir driver to get base frequency from
    devicetree
  [media] dt: bindings: Update binding documentation for sunxi IR
    controller
  ARM: dts: sun8i: a83t: Add the ir pin for the A83T
  ARM: dts: sun8i: a83t: Add support for the ir interface
  ARM: dts: sun8i: a83t: bananapi-m3: Enable IR controller

 Documentation/devicetree/bindings/media/sunxi-ir.txt | 14 ++++++++------
 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts         |  7 +++++++
 arch/arm/boot/dts/sun8i-a83t.dtsi                    | 15 +++++++++++++++
 drivers/media/rc/sunxi-cir.c                         | 20 +++++++++++---------
 4 files changed, 41 insertions(+), 15 deletions(-)

-- 
2.11.0
