Return-Path: <SRS0=ZGg2=XH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:57431 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727069AbfILWLY (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 12 Sep 2019 18:11:24 -0400
From: Oleh Kravchenko <oleg@kaa.org.ua>
Subject: v7 EL15203000
Date: Fri, 13 Sep 2019 01:11:13 +0300
Message-Id: <20190912221115.23595-1-oleg@kaa.org.ua>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz
List-ID: <devicetree@vger.kernel.org>

[PATCH v8 1/2] dt-bindings: Add docs for EL15203000
[PATCH v8 2/2] leds: add LED driver for EL15203000 board

Changes what was made:
- removed odd spaces;
- use only one return in el15203000_pattern_set_P();
- reduce returns in el15203000_probe_dt();
- remove ret variable from el15203000_probe().
