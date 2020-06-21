Return-Path: <SRS0=az0Z=AC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80629C433DF
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 19:40:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D7C6207E8
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 19:40:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="ONmNfyZP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730516AbgFUTkh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 21 Jun 2020 15:40:37 -0400
Received: from mout.web.de ([212.227.15.3]:37319 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730070AbgFUTkh (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 21 Jun 2020 15:40:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1592768429;
        bh=Xzttkjxbn6tRm7PPzTn23RfXNlqY8vkHctwxUl7NGfo=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ONmNfyZPmlUPKJHOXTML8DibZ/LkYPR1RAhczYVEV2QmRM4m0yiUAtzQslGIuSFmc
         ZNjiFK+rOh8SV35HcPq47mqTqTRrp9LPF4NcZUkR9XYQtewBipcvXrJEMpDaOIofxw
         mRz3MrXgKppNkiaW9Dx4Gc8o5SAb6L8D5Xwxy13g=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from LaptopNick.fritz.box ([79.227.109.96]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MRk0k-1jJzBH1fBa-00TBd4; Sun, 21
 Jun 2020 21:40:29 +0200
From:   Nick Reitemeyer <nick.reitemeyer@web.de>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Nick Reitemeyer <nick.reitemeyer@web.de>
Subject: [PATCH 2/2] ARM: dts: ux500: samsung-golden: Add touchkey
Date:   Sun, 21 Jun 2020 21:38:23 +0200
Message-Id: <20200621193822.133683-2-nick.reitemeyer@web.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200621193822.133683-1-nick.reitemeyer@web.de>
References: <20200621193822.133683-1-nick.reitemeyer@web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:F+gf9Pksrfga9CGGdCdBb+Q+Lyh3AAgB1bsqHaNBaxsx3RPY0i+
 eOZazJGKrXUcZaHAjYWCmE11fWLWs2nvwMEW5RV6vdcaAOCold1DxlmBeACb0hJRiOktao6
 fE+t7JVkC0ATjpRlbQexA27EBrNiJwViBS6+5fhL/cGOMkfL4atjKKrVAHXahYWiUTmKG5X
 TBYAHcXSO2adlyIuFa5Rg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6hX209b3+s8=:ygA26r6qSE7/Pc0s7D6x7G
 YUz40QwrBi5DIKA6Hajf16+G14gaEVy2dFaVdROEt8mRn+x1QiJCAXu6bQtv/Cinv+v/z2zir
 OljeuflNMow026g8WxILb+E3IU65MJUjisJ0vbL/lzi3kRytjoMQ+Ks1bH6gZoDeooNnDTiJJ
 Hev5AwCSjaaly616cW/Oa9/APhXKiAAWs8lmgv26QG/8b8o2KTiYXPT3iLt/rdPy8HQDHaEuk
 NTel32JLI7E8Vmfi/2LH9NEaoOLppf7K1pzBTv08cePKAP5KTwD65FqYNUa9IPEW9FiR6ZDLe
 FPLeErinrKkTezCF2eQrICYU13Ewm+ED+bKuByyYtPh4A5YJ6U6savy0o1wxjmkMaUGrwcTi0
 oTk4Uk39u/TJwAVVrPYcH7Yw5tt2T0k748uERtxLWz2J2SFGYMxDkL3HVmaXA2b3P4sLLhZdj
 dQJM/BJrC7vBv1NED+FvACFzbdkQBq91+aJS0iMXdarQtypfoCgOkiuWOhsTRUjjTYlMcLSap
 E6mNLCcoi5R6XXtJWJ1v+u5978zYEJdYKHEtApTCV85gH8HnI2NyByyj1jyWvFMWFg86bG4rA
 kSOufG8DUxzdYSzoVhCDQG51vlAv7qtlZaO+EcwQJ792wlG4oODX50tC/m9mfrRXlHtQ1ZSyj
 EelDl3GAUhYABNNzhI6AaCAeG77ea7w4ABSBxdCNIqDzuy0/mmx460yDYe6Uvj6Cb8QMsoTjs
 9XMwDzZPiQeReeR+vHz5FoYGSlF2HWOSzUPmVJ7Amhs9Y+HDIl1nDipdvl6zf6/2+4PoyvsuI
 /KloOe8uqGqaaQEWUqEokxeJ5ptKPkuE6B8LSChbOqa5dzY3Kw32WulTiFjclo7VRWqr3G6Sr
 OYz1geoefQxzuvecQqCMH/7/5+Kf6wrmQUn9pVqLOrw9J7pfirFzSbqxZfX5+J1XvpKv7+mD9
 5Gw4EZ58U76kLy7Tdnv+eN+HbkRX4Zgg4+wlcgFlHKV1NH+7jQWgk7Pyia0iyGUzYciInUYRs
 82PHWPF81SIRt/bM3s1+g1yO++bCCzF2Iydub6BMYjAL2AV7L039nmoynIDmw4dcZiVVmUx96
 m52CSzGdTogs3AKQRM9lPjSP+5ONB5eMhYRoQpkZikwOdIlhfCNoOSeemsSw9LEoCw5hp6iEM
 V/lapICu3YRhiTE/f568FqXE3tQCsX+FfcrvW8BTOrWHJ+8GgPtFLaxDeVN/IBao92XkHq31y
 072ngHUZY8Dtc0fXI
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Adds support for the back and menu keys on golden.

Signed-off-by: Nick Reitemeyer <nick.reitemeyer@web.de>
=2D--
 .../arm/boot/dts/ste-ux500-samsung-golden.dts | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/ste-ux500-samsung-golden.dts b/arch/arm/boo=
t/dts/ste-ux500-samsung-golden.dts
index 5b499c0b2745..1e26b711d43d 100644
=2D-- a/arch/arm/boot/dts/ste-ux500-samsung-golden.dts
+++ b/arch/arm/boot/dts/ste-ux500-samsung-golden.dts
@@ -24,6 +24,32 @@ chosen {
 		stdout-path =3D &serial2;
 	};

+	i2c-gpio-0 {
+		compatible =3D "i2c-gpio";
+		sda-gpios =3D <&gpio2 14 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		scl-gpios =3D <&gpio2 13 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&i2c_gpio_0_default>;
+
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		touchkey@20 {
+			compatible =3D "coreriver,tc360-touchkey";
+			reg =3D <0x20>;
+			vdd-supply =3D <&ab8500_ldo_aux4_reg>;
+			vcc-supply =3D <&ab8500_ldo_aux6_reg>;
+
+			interrupt-parent =3D <&gpio2>;
+			interrupts =3D <15 IRQ_TYPE_EDGE_FALLING>;
+
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&touchkey_default>;
+			linux,keycodes =3D <KEY_MENU KEY_BACK>;
+		};
+	};
+
 	i2c-gpio-1 {
 		compatible =3D "i2c-gpio";
 		sda-gpios =3D <&gpio4 24 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -403,6 +429,16 @@ golden_cfg1 {
 		};
 	};

+	i2c-gpio-0 {
+		i2c_gpio_0_default: i2c_gpio_0 {
+			golden_cfg1 {
+				pins =3D "GPIO77",	/* TOUCHKEY_SCL */
+				       "GPIO78";	/* TOUCHKEY_SDA */
+				ste,config =3D <&gpio_in_nopull>;
+			};
+		};
+	};
+
 	i2c-gpio-1 {
 		i2c_gpio_1_default: i2c_gpio_1 {
 			golden_cfg1 {
@@ -413,6 +449,15 @@ golden_cfg1 {
 		};
 	};

+	touchkey {
+		touchkey_default: touchkey_default {
+			golden_cfg1 {
+				pins =3D "GPIO79";	/* TOUCHKEY_INT */
+				ste,config =3D <&gpio_in_nopull>;
+			};
+		};
+	};
+
 	sdi0 {
 		sd_level_translator_default: sd_level_translator_default {
 			golden_cfg1 {
=2D-
2.27.0

