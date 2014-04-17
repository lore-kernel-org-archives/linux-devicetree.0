From: =?UTF-8?q?Antoine=20T=C3=A9nart?=
	<antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/2] Add GPIO nodes for Berlin BG2 and BG2CD
Date: Thu, 17 Apr 2014 10:45:27 +0200
Message-ID: <1397724329-14154-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

After adding support for the Berlin BG2Q GPIOs, this series uses the
same GPIO dwapb driver to support the Berlin BG2 and BG2CD GPIOs.

Applies on top of Sebastian's for-next branch[1].

[1] https://github.com/shesselba/linux-berlin/commits/berlin/for-next

Antoine T=C3=A9nart (2):
  ARM: dts: berlin: add the BG2 GPIO nodes
  ARM: dts: berlin: add the BG2CD GPIO nodes

 arch/arm/boot/dts/berlin2.dtsi   | 105 +++++++++++++++++++++++++++++++=
++++++++
 arch/arm/boot/dts/berlin2cd.dtsi | 102 +++++++++++++++++++++++++++++++=
++++++
 2 files changed, 207 insertions(+)

--=20
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
