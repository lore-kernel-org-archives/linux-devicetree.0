Return-Path: <SRS0=UWh6=XB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:54081 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728435AbfIFN3f (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 6 Sep 2019 09:29:35 -0400
From: Oleh Kravchenko <oleg@kaa.org.ua>
Subject: 
Date: Fri,  6 Sep 2019 16:29:15 +0300
Message-Id: <20190906132916.12423-1-oleg@kaa.org.ua>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz
List-ID: <devicetree@vger.kernel.org>

[PATCH v6 1/2] dt-bindings: Add docs for EL15203000
[PATCH v6 2/2] leds: add LED driver for EL15203000 board

Reworked few minor issues:
- added 'repeat' entity in test documentation
- removed variable i
- few lines of code was moved to make code clear
