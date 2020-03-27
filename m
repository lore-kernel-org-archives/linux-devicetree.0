Return-Path: <SRS0=jSFQ=5M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE36AC2D0ED
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 01:36:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A11E320774
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 01:36:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z2i95Aqx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727800AbgC0Bcz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 26 Mar 2020 21:32:55 -0400
Received: from mail-pf1-f202.google.com ([209.85.210.202]:33218 "EHLO
        mail-pf1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727833AbgC0Bcy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 26 Mar 2020 21:32:54 -0400
Received: by mail-pf1-f202.google.com with SMTP id o5so6974463pfp.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2020 18:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=CndPbhEYDs1U4gkN9kz/g201YX5b6/GIUM2pkWkOTok=;
        b=Z2i95AqxFtFVeJnN0ep10o2FLq3PHgLj0xV1jas+TG8DoHR/Ie+akCb78FuKraPzKz
         5aoVGcNUcN8y2qQzoBO0xfnWUftDtaJwhSSJ3j4DqC7DT63Dw4v4mM5VXLzsrlcbEXpp
         5OpEooJMSJpoIbeIy/wyazTFWjJ9rqCjPkliTqDnMNWWtGBW4ip8H6gDpwQmHE6NHRXP
         /e8lpO8XPWTXNUYU4mMInzlM3mpaz/GYK9bJAyiG+oT7KNYz2COa3tO7FBNqBBv4WH6p
         8xOK/8TWkKuoLZwdOSnKmKYVvyr5dewf+biAQDRqc3ncEHidS84Wt9vcPYW49WP4Do7Z
         YUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=CndPbhEYDs1U4gkN9kz/g201YX5b6/GIUM2pkWkOTok=;
        b=AZJkek/7exI2KbwP+wDrG1fthsovaTrA8KFN8i5vyC/2WlUSyFWtiwdmgxqvOxXvDC
         qpV+R3UMqdTwKY43Tb3xno77UWKID3fdKptg85SVkJ39+qHq5kuKLFDKco7TX4t+3k7I
         P+rJGVMGpdRnpFYYr2zv1vOHVSrhQrUwb/ARZoQ84Y5MYNvcoiOTqddBb4noWMzLRqvz
         qinMUdZ9CNCD6qD42VpK7CAn5Iyvf/pJg1T4Ew1z8CtgmozCs7ROhUaxqIw1XZm5X+ej
         SWkWKthnpCPCVCYTJWOnurrMwdASgVmrS6i+1I/fRnWbFUxz+yFn4zJFzhE6odTsJ+Mp
         Y2og==
X-Gm-Message-State: ANhLgQ37RMNMKxdiY5MJNQ6zS0HUxMggqEXPGCabW6Q9V7zSwfsC7blg
        h5+KJW7ivpoifFPrJM83GrakGCHh5nRz
X-Google-Smtp-Source: ADFU+vtEHaAqRLOhguRyQ6WDAN2vuYnRbqyv9pgMaWqOyGbQOTVbIoWbvV3BqJHbw+jxXtfx1C87+q2KzjgX
X-Received: by 2002:a63:da4d:: with SMTP id l13mr11745412pgj.216.1585272773528;
 Thu, 26 Mar 2020 18:32:53 -0700 (PDT)
Date:   Thu, 26 Mar 2020 18:32:37 -0700
In-Reply-To: <20200327013239.238182-1-rajatja@google.com>
Message-Id: <20200327013239.238182-3-rajatja@google.com>
Mime-Version: 1.0
References: <20200327013239.238182-1-rajatja@google.com>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH v3 3/5] dt-bindings: input/atkbd.txt: Add binding for "function-row-physmap"
From:   Rajat Jain <rajatja@google.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>, dtor@google.com,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajat Jain <rajatja@google.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Enrico Weigelt <info@metux.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, furquan@google.com,
        dlaurie@google.com, bleung@google.com, zentaro@google.com,
        dbehr@google.com
Cc:     rajatxjain@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Create the documentation for the new introduced property, that
describes the function-row keys physical positions.

Signed-off-by: Rajat Jain <rajatja@google.com>
---
v3: same as v2
v2: Remove the Change-Id from the commit log

 .../devicetree/bindings/input/atkbd.txt       | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/atkbd.txt

diff --git a/Documentation/devicetree/bindings/input/atkbd.txt b/Documentation/devicetree/bindings/input/atkbd.txt
new file mode 100644
index 0000000000000..816653eb8e98d
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/atkbd.txt
@@ -0,0 +1,34 @@
+Device tree bindings for AT / PS2 keyboard device
+
+Optional properties:
+
+	function-row-physmap:
+			An ordered array of the physical codes for the function
+			row keys. Arranged in order from left to right.
+
+Example:
+
+	This is a sample ACPI _DSD node describing the property:
+
+        Name (_DSD, Package () {
+                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
+                Package () {
+                        Package () { "function-row-physmap",
+                                Package () {
+                                        0xEA, /* T1 BACK */
+                                        0xE7, /* T2 REFRESH */
+                                        0x91, /* T3 FULLSCREEN */
+                                        0x92, /* T4 SCALE */
+                                        0x93, /* T5 SNIP */
+                                        0x94, /* T6 BRIGHTNESS_DOWN */
+                                        0x95, /* T7 BRIGHTNESS_UP */
+                                        0x96, /* T8 PRIVACY_SCRN_TOGGLE */
+                                        0x97, /* T9 KBD_BKLIGHT_DOWN */
+                                        0x98, /* T10 KBD_BKLIGHT_UP */
+                                        0xA0, /* T11 VOL_MUTE */
+                                        0xAE, /* T12 VOL_DOWN */
+                                        0xB0, /* T13 VOL_UP */
+                                }
+                        }
+                }
+        })
-- 
2.25.1.696.g5e7596f4ac-goog

