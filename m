From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/3] Add Watchdog for H6
Date: Thu, 11 Apr 2019 17:45:31 +0200
Message-ID: <20190411154534.25563-1-peron.clem@gmail.com>
Reply-To: peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCELXIX7UICBBAF5XXSQKGQE2BSBMFI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Allwinner H6 SoC has two watchdogs. The documented watchdog is identicaly
the same reading the user manual as the one used in the A64.

After investigation it seems that on some SoC the first watchdog doesn't
make the board reboot.
Some tests has been performed and it seems that first H6 version aren't
affected only the latest one.

Chen-Yu Tsai's boards:
Pine H64 - H6 V200-AWIN H6448BA 7782 =3D> OK
OrangePi Lite 2 - H6 V200-AWIN H8068BA 61C2 =3D> KO

Cl=C3=A9ment P=C3=A9ron's board:
Beelink GS1 - H6 V200-AWIN H7309BA 6842 =3D> KO

I think it could good to add it with a comment anyway.
In case a user want to activate it and isn't aware of this issue.

The r_watchdog is still available and usable on all the H6 boards.

Thanks,
Cl=C3=A9ment

Cl=C3=A9ment P=C3=A9ron (3):
  arm64: dts: allwinner: h6: add watchdog node
  arm64: dts: allwinner: h6: add r_watchog node
  arm64: defconfig: Enable Sunxi watchdog

 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 16 ++++++++++++++++
 arch/arm64/configs/defconfig                 |  1 +
 2 files changed, 17 insertions(+)

--=20
2.17.1

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
