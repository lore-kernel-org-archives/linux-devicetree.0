Return-Path: <SRS0=iPrc=XE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:45532 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727546AbfIIHQl (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 9 Sep 2019 03:16:41 -0400
From: Oleh Kravchenko <oleg@kaa.org.ua>
Subject: v7 EL15203000
Date: Mon,  9 Sep 2019 10:16:30 +0300
Message-Id: <20190909071632.14392-1-oleg@kaa.org.ua>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz
List-ID: <devicetree@vger.kernel.org>

[PATCH v7 1/2] dt-bindings: Add docs for EL15203000
[PATCH v7 2/2] leds: add LED driver for EL15203000 board

Fixed compilation error missing variable led.
Compiled and checked on real device.
