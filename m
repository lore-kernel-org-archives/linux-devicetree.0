Return-Path: <SRS0=uucL=YV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EEDDCA9EC0
	for <linux-devicetree@archiver.kernel.org>; Mon, 28 Oct 2019 21:59:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0A85A21479
	for <linux-devicetree@archiver.kernel.org>; Mon, 28 Oct 2019 21:59:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OYj7c9Hl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389679AbfJ1V7Y (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 28 Oct 2019 17:59:24 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37535 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389354AbfJ1V7Y (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 28 Oct 2019 17:59:24 -0400
Received: by mail-pf1-f193.google.com with SMTP id u9so3163333pfn.4
        for <devicetree@vger.kernel.org>; Mon, 28 Oct 2019 14:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=6V2QLtsUHV+VMkpsBsOUVHj2Zdm9O3NphSR9ng6V5hA=;
        b=OYj7c9HlB8KdZS8k0+yeFPli8FirbWlVRFcbS8UFAPa+JnPhe/WmMJQqOD9TR9Iy+d
         cAkoFHCrBgEaVtQw56Ddhea6Pm0JkBPg70l2pDjOpiKX+OgJFDMme6qNVrdzv4pP2d1l
         JkCyh+UyzoyNtXdlweJs3mVUru9pceP7+ME/mf45jUgy/v5wTjNyOE7ldIHwDUcGLZLg
         XWX1sS5rzYYn9/g0Gm8dSKRK56VtNHBJh1UB4BzyuqbX5jWUUrJk4fKBedWLY23IylV9
         lIBi635LxlBiuSJKrgqyqRxSXx56Rh25fTaC8v5IyYULb8ZVGZyotFf51Nd+vJGgnTxM
         VcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6V2QLtsUHV+VMkpsBsOUVHj2Zdm9O3NphSR9ng6V5hA=;
        b=qCdtuTBKU8CCM5mFchn33KjW3XMTgNZbKYNI21gXLcvS0nuNfhWTLs1RJTzt/A3XXK
         KGIfxTkGY3sXN5ykHLtg5/OiYMphfhg1bHIJycQl6n99RNpGNNIY9PfowOhi3eII5ZNt
         Cu3FYzwGbD9GkiyQ549tvMkvAeTzXcTNn2H6GzqEB6P6fWl08qQTelGpUEQtFG8Kaxph
         UMXlg056kvLOMVh0uDVQIsbsFPqv0JZUN4eFsyXhm0MB9u+/FU3BCesJm70alOwScEkF
         4FTfgiyP1SSMT1tIxSPm0koFNKHLv5wj+GOmLAhkS9wxuy1iyp3g5MxdHVJHTiq6sdmx
         OKww==
X-Gm-Message-State: APjAAAVIgBOuOOnqWUcv7G6tCMUFqS6aQ28sNTqLsHsQAvpEQYXQieJT
        twxGfcNNwzdwFEG0SVvV/y4sFw==
X-Google-Smtp-Source: APXvYqzLBovy1k5lVCROdtfAnbXyuuhyue9xhrwrk3Xf7So7yVGNs2G5iePulNK+Mzx23renVRogBA==
X-Received: by 2002:a65:6903:: with SMTP id s3mr22693935pgq.195.1572299963255;
        Mon, 28 Oct 2019 14:59:23 -0700 (PDT)
Received: from localhost.localdomain (c-67-170-172-113.hsd1.or.comcast.net. [67.170.172.113])
        by smtp.gmail.com with ESMTPSA id f12sm10880612pfn.152.2019.10.28.14.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 14:59:22 -0700 (PDT)
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
Subject: [PATCH v4 0/9] Prereqs for HiKey960 USB support
Date:   Mon, 28 Oct 2019 21:59:10 +0000
Message-Id: <20191028215919.83697-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Just another round here trying to push forward a patch series
submitted previously by Yu Chen to get HiKey960 dev-board's USB
functionality working.

This series focuses on just the dwc3 changes and bindings
needed.

The current full patchset can be found here:
  https://git.linaro.org/people/john.stultz/android-dev.git/log/?id=ce013895404bd4a5b6487df0ac30ed2dbea43f5d

NOTE: I unfortunately don't have any deep knowledge of the
hardware other then the previously submitted code  and what I
can intuit from testing, but I tried to document the previously
undocumented bindings as best I could, fixed up a few minor
checkpatch issues and tried to address previous feedback as best
I could.

I'd greatly appreciate any feedback or thoughts!

thanks
-john

New in v4:
* Just added a few Reviewed-by: lines from Rob Herring


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

John Stultz (6):
  dt-bindings: usb: rt1711h: Add connector bindings
  dt-bindings: usb: dwc3: Allow clock list & resets to be more flexible
  usb: dwc3: Rework clock initialization to be more flexible
  usb: dwc3: Rework resets initialization to be more flexible
  dt-bindings: usb: generic: Add role-switch-default-host binding
  usb: dwc3: Add host-mode as default support

Yu Chen (3):
  usb: dwc3: Execute GCTL Core Soft Reset while switch modes
  usb: dwc3: Increase timeout for CmdAct cleared by device controller
  usb: dwc3: Registering a role switch in the DRD code.

 .../devicetree/bindings/usb/dwc3.txt          |  5 +-
 .../devicetree/bindings/usb/generic.txt       |  5 ++
 .../bindings/usb/richtek,rt1711h.txt          | 29 +++++++
 drivers/usb/dwc3/Kconfig                      |  1 +
 drivers/usb/dwc3/core.c                       | 38 +++++----
 drivers/usb/dwc3/core.h                       |  6 ++
 drivers/usb/dwc3/drd.c                        | 78 ++++++++++++++++++-
 drivers/usb/dwc3/gadget.c                     |  2 +-
 8 files changed, 144 insertions(+), 20 deletions(-)

-- 
2.17.1

