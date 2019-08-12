From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v6 0/2] Allwinner H6 SPDIF support
Date: Mon, 12 Aug 2019 12:51:13 +0200
Message-ID: <20190812105115.26676-1-peron.clem@gmail.com>
Reply-To: peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCELXIX7UICBBKUJYXVAKGQEMVCUXNY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allwinner H6 SoC has a SPDIF controller called One Wire Audio (OWA) which
is different from the previous H3 generation and not compatible.

Difference are an increase of fifo sizes, some memory mapping are different
and there is now the possibility to output the master clock on a pin.

Actually all these features are unused and only a bit for flushing the TX
fifo is required.

Changes since v5:
 - Move soundcard to board device-tree

Changes since v4:
 - rename audio card name to sun50i-h6-spdif
 - drop patches already merged

Changes since v3:
 - rename reg_fctl_ftx to val_fctl_ftx
 - rebase this series on sound-next
 - fix dt-bindings due to change in sound-next
 - change node name sound_spdif to sound-spdif

Changes since v2:
 - Split quirks and H6 support patch
 - Add specific section for quirks comment

Changes since v1:
 - Remove H3 compatible
 - Add TX fifo bit flush quirks
 - Add H6 bindings in SPDIF driver

Cl=C3=A9ment P=C3=A9ron (2):
  arm64: dts: allwinner: Add SPDIF node for Allwinner H6
  arm64: dts: allwinner: h6: Enable SPDIF for Beelink GS1

 .../dts/allwinner/sun50i-h6-beelink-gs1.dts   | 22 +++++++++++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 20 +++++++++++++++++
 2 files changed, 42 insertions(+)

--=20
2.20.1

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/20190812105115.26676-1-peron.clem%40gmail.com.
