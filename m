Return-Path: <SRS0=OP5l=QE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr50051.outbound.protection.outlook.com ([40.107.5.51]:43744
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726415AbfA1JGT (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 28 Jan 2019 04:06:19 -0500
From: Matthias Fend <Matthias.Fend@wolfvision.net>
Subject: [PATCH 1/2] dt-bindings: input: touchscreen: st1232i: reference
 common DT bindings
Date: Mon, 28 Jan 2019 09:06:06 +0000
Message-ID: <1548666345-24667-1-git-send-email-matthias.fend@wolfvision.net>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
References: <419160a7-edf5-48cf-85ea-d6d5e9cd6e59.95bf7d06-047e-438c-8c7b-895af195351a.1a874761-69ea-4dcd-b6ec-8bdc7777bc57@emailsignatures365.codetwo.com>
Sender: devicetree-owner@vger.kernel.org
To: "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
Cc: Matthias Fend <Matthias.Fend@wolfvision.net>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Add a reference to common touchscreen bindings which are also partly
supported.

Signed-off-by: Matthias Fend <matthias.fend@wolfvision.net>
---
 Documentation/devicetree/bindings/input/touchscreen/sitronix-st1232.txt | =
2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/sitronix-s=
t1232.txt b/Documentation/devicetree/bindings/input/touchscreen/sitronix-st=
1232.txt
index 64ad48b..f3046e7 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/sitronix-st1232.t=
xt
+++ b/Documentation/devicetree/bindings/input/touchscreen/sitronix-st1232.t=
xt
@@ -8,6 +8,8 @@ Required properties:
 Optional properties:
 - gpios: a phandle to the reset GPIO
=20
+For additional optional properties see: touchscreen.txt
+
 Example:
=20
 	i2c@00000000 {
--=20
2.7.4


Matthias Fend=0A=
R&D Electronics =0A=
=0A=
Wolfvision GmbH=0A=
Oberes Ried 14 | 6833 Klaus | Austria =0A=
Tel: +43 5523 52250 | Mail: Matthias.Fend@wolfvision.net =0A=
=0A=
Webpage: www.wolfvision.com | www.wolfvision.com/green=0A=
Firmenbuch / Commercial Register: FN283521v Feldkirch/Austria=0A=
=0A=
