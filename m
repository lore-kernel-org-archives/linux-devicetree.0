Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACEAAC43331
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 01:17:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 79101214DB
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 01:17:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jKxk19Vd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728415AbfKHBR2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 Nov 2019 20:17:28 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38816 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727024AbfKHBR1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 Nov 2019 20:17:27 -0500
Received: by mail-pl1-f193.google.com with SMTP id w8so2877744plq.5
        for <devicetree@vger.kernel.org>; Thu, 07 Nov 2019 17:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=kZcD6GKA7XbCzd3zg1eCgX8HZHAD6+MLe8xQYM7PmDE=;
        b=jKxk19VdnovnbeBuwPQoZftMD3I3oHzDoPitrIzZx8fcjOoT8jMhScOyC5c0iVp7cT
         WD+e9SPcrFuUxCDI1jIGQGJbkOLpxhvr2J+MI4rW/Qyx9JWb3tfJW9iifr/XHEqwUIlG
         P5FpxncR5UUH9ZbW274W8pwlZ45Y46ua8nM7jrHal0jfGsmTsU8mYnpFzTtyrzlVSKgb
         GrEci+r/HGDFmdHP0zvlNfHFCMRYxShpCqTg03pQoWRiOqDNYzlDLpgUHZkXnm5651Zu
         Qcp4kM1EWv2uZm2I13rKP0dfth8Rx4/TiIYyZXieqU6Ow3N1Uo2OqKQz2TokvTR2hMfN
         ixgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=kZcD6GKA7XbCzd3zg1eCgX8HZHAD6+MLe8xQYM7PmDE=;
        b=rEdH27aF4kWqD9MxaA5wqMFB4UVd4+NvxDFyVYyhIX2ycduTJk6HAEzJGaIAY22Zf6
         ttNMopMP1lSmIbVwASU5TokwDGp8zMaSP0ohx8NmPGC5tyxKZS27FaHKjb8p/WTsDOVd
         5ski7uG9WIaN/r4R6a7iY681kGv2at2FrxRGo5a1l6yPBFymVESlUuXybKXP4xB8ShL9
         c0SC3vkAOrYSPMtfmBxY2ZdhzOTjsgjd3EljYIctS7o7THnuwgOvUgGT4HQUGYPu8Q6h
         q5txqQZj57VI6pNlq6uqXnq9ZogrJfm0orng0M6K3+p6F09y0dFvNoApfdK0pO8JPRXa
         +VSg==
X-Gm-Message-State: APjAAAX9M2uTTlt2vy/YYM2QwodWKsaMePoCeEKEJx1CLi7PvusVpNyv
        IAwsgRc9rFA0wy8sm3Yc+l84ersgalA=
X-Google-Smtp-Source: APXvYqyB6Q21widSmq8YSXUuNBlkXc+2TtWS9jvD0cuWjYjPPfDOAWNebW12rxcoc0nCFsHsptmgXA==
X-Received: by 2002:a17:90a:268c:: with SMTP id m12mr9306601pje.69.1573175847075;
        Thu, 07 Nov 2019 17:17:27 -0800 (PST)
Received: from localhost.localdomain (c-67-170-172-113.hsd1.or.comcast.net. [67.170.172.113])
        by smtp.gmail.com with ESMTPSA id s23sm3801627pgh.21.2019.11.07.17.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 17:17:26 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Yu Chen <chenyu56@huawei.com>, Felipe Balbi <balbi@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Jack Pham <jackp@codeaurora.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 0/3] dwc3 prereqs for HiKey960 USB support
Date:   Fri,  8 Nov 2019 01:17:20 +0000
Message-Id: <20191108011723.32390-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Just another round here trying to push forward a patch series
submitted previously by Yu Chen to get HiKey960 dev-board's USB
functionality working.

This set is even more narrowly focused on just the role-switch
support and adding the role-switch-default-mode option (as the
core extension/glue bindings bits are still in discussion).

While Felipe had quite a bit of feedback on the last round, and
I'm not completely sure how to address all of it yet, I wanted
to send out this set which tries to address *some* of his
concerns, so I could get further feedback and make sure I'm on
the right track.

The current version of the full patchset to enable USB on
HiKey960 can be found here:
  https://git.linaro.org/people/john.stultz/android-dev.git/log/?id=d40d8c803c5a79b70e2a6b363fe03442480df7d9

I'd greatly appreciate any feedback or thoughts!

thanks
-john

New in v5:
* Just sending out role-switch and role-swith-default-mode
  changes
* Reworked role-switch code to not select CONFIG_USB_ROLE_SWITCH
  and to ifdef out the dependent code if its not enabled, as
  suggested by Felipe
* Changed to a string based role-switch-default-mode binding
  as suggested by Felipe


Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
CC: ShuFan Lee <shufan_lee@richtek.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Yu Chen <chenyu56@huawei.com>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jun Li <lijun.kernel@gmail.com>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Jack Pham <jackp@codeaurora.org>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org

John Stultz (2):
  dt-bindings: usb: generic: Add role-switch-default-mode binding
  usb: dwc3: Add support for role-switch-default-mode binding

Yu Chen (1):
  usb: dwc3: Registering a role switch in the DRD code.

 .../devicetree/bindings/usb/generic.txt       |  6 ++
 drivers/usb/dwc3/core.h                       |  6 ++
 drivers/usb/dwc3/drd.c                        | 96 ++++++++++++++++++-
 3 files changed, 107 insertions(+), 1 deletion(-)

-- 
2.17.1

