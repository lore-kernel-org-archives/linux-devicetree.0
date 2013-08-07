Return-Path: <devicetree-owner@vger.kernel.org>
Received: from pegase1.c-s.fr ([93.17.236.30]:56820 "EHLO mailhub1.si.c-s.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932349Ab3HGQPw (ORCPT <rfc822;devicetree@vger.kernel.org>);
	Wed, 7 Aug 2013 12:15:52 -0400
Received: from localhost (mailhub1-int [192.168.12.234])
	by localhost (Postfix) with ESMTP id 6FADD1C8582
	for <devicetree@vger.kernel.org>; Wed,  7 Aug 2013 17:54:57 +0200 (CEST)
Received: from mailhub1.si.c-s.fr ([192.168.12.234])
	by localhost (mailhub1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rr1q5V7JuMIe for <devicetree@vger.kernel.org>;
	Wed,  7 Aug 2013 17:54:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 5A4841C8565
	for <devicetree@vger.kernel.org>; Wed,  7 Aug 2013 17:54:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 69C18C7392
	for <devicetree@vger.kernel.org>; Wed,  7 Aug 2013 17:54:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id oGvrL5xNX_cX for <devicetree@vger.kernel.org>;
	Wed,  7 Aug 2013 17:54:55 +0200 (CEST)
Received: from [172.25.231.7] (unknown [172.25.231.7])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 38A38C7394
	for <devicetree@vger.kernel.org>; Wed,  7 Aug 2013 17:54:55 +0200 (CEST)
Message-ID: <52026DBA.8000202@c-s.fr>
Date: Wed, 07 Aug 2013 17:54:34 +0200
From: leroy christophe <christophe.leroy@c-s.fr>
MIME-Version: 1.0
Subject: Fwd: [PATCH] SPI: Set SPI bits per words in an OF DeviceTree SPI
 node
References: <201308071544.r77Fij2Y006649@localhost.localdomain>
In-Reply-To: <201308071544.r77Fij2Y006649@localhost.localdomain>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Sujet: 	[PATCH] SPI: Set SPI bits per words in an OF DeviceTree SPI node
Date : 	Wed, 7 Aug 2013 17:44:45 +0200
De : 	Christophe Leroy <christophe.leroy@c-s.fr>
Pour : 	Grant Likely <grant.likely@secretlab.ca>, Rob Herring 
<rob.herring@calxeda.com>
Copie � : 	spi-devel-general@lists.sourceforge.net, 
linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, 
stigge@antcom.de



This patch allows to set up the bits per word together with all other SPI
parameters in the SPI Node of the OF device tree

In the node, you then have to include the 'spi-bits' property.

Exemple:
	fpga-loader@7 {
		compatible = "cs,fpga-loader";
		spi-max-frequency = <10000000>;
		reg = <7>;
		spi-cs-high;
		spi-bits = <16>;
	};

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

--- linux-3.8.13/drivers/spi/spi.c	2013-05-11 22:57:46.000000000 +0200
+++ linux/drivers/spi/spi.c	2013-08-06 18:19:30.000000000 +0200
@@ -870,6 +870,11 @@
   		if (of_find_property(nc, "spi-3wire", NULL))
   			spi->mode |= SPI_3WIRE;
   +		/* Bits per word */
+		prop = of_get_property(nc, "spi-bits", &len);
+		if (prop && len >= sizeof(*prop))
+			spi->bits_per_word = prop[0];
+
   		/* Device speed */
   		prop = of_get_property(nc, "spi-max-frequency", &len);
   		if (!prop || len < sizeof(*prop)) {




