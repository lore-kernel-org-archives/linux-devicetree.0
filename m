From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/8] Add Allwinner H6 Mali Midgard GPU
Date: Thu, 11 Apr 2019 12:57:12 +0200
Message-ID: <20190411105720.32357-1-peron.clem@gmail.com>
Reply-To: peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCELXIX7UICBBSNWXTSQKGQEGF3GYTI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

The Allwinner H6 has a Mali-T720 MP2. The drivers are
out-of-tree so this series only introduce the dt-bindings.

The first patch is from Neil Amstrong and has been already
merged in linux-amlogic. It is required for this series.

The second patch is from Icenowy Zheng where I changed the
order has required by Rob Herring.
See: https://patchwork.kernel.org/patch/10699829/

The GPU opp table was taken from Jernej =C5=A0krabec's patch
on LibreELEC.tv.

Thanks,
Clement

Changes in v2 (Thanks to Maxime Ripard):
 - Drop GPU OPP Table
 - Add clocks and clock-names in required

Cl=C3=A9ment P=C3=A9ron (7):
  dt-bindings: gpu: add bus clock for Mali Midgard GPUs
  dt-bindings: gpu: mali-midgard: Add h6 mali gpu compatible
  arm64: dts: allwinner: Add ARM Mali GPU node for H6
  arm64: dts: allwinner: Add mali GPU supply for Pine H64
  arm64: dts: allwinner: Add mali GPU supply for Beelink GS1
  arm64: dts: allwinner: Add mali GPU supply for OrangePi Boards
  arm64: dts: allwinner: Add mali GPU supply for OrangePi 3

Neil Armstrong (1):
  dt-bindings: gpu: mali-midgard: Add resets property

 .../bindings/gpu/arm,mali-midgard.txt         | 27 +++++++++++++++++++
 .../dts/allwinner/sun50i-h6-beelink-gs1.dts   |  5 ++++
 .../dts/allwinner/sun50i-h6-orangepi-3.dts    |  5 ++++
 .../dts/allwinner/sun50i-h6-orangepi.dtsi     |  5 ++++
 .../boot/dts/allwinner/sun50i-h6-pine-h64.dts |  5 ++++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 14 ++++++++++
 6 files changed, 61 insertions(+)

--=20
2.17.1

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
