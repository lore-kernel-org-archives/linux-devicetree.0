Return-Path: <SRS0=+Je1=4M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E422C3567B
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 07:20:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7330320714
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 07:20:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IZOmGdk3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgBXHUe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Feb 2020 02:20:34 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:37341 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgBXHUd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 24 Feb 2020 02:20:33 -0500
Received: by mail-pj1-f65.google.com with SMTP id m13so3767433pjb.2
        for <devicetree@vger.kernel.org>; Sun, 23 Feb 2020 23:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pp4OJKlkTUP/JKWBsfGX5IGPygvYeWUCLyYPIlFud78=;
        b=IZOmGdk3jvbALg78q+Ogcc/os8rR7kNvGziTpMuqqxVshDSb7T0/n5kLOgxiYvrD6L
         FsaIT/opnfyAbJqctDkl/nSg+/poz+r/XpgrWrCj0upAr29DF+L7hRl6W4XhxLudNiZy
         mQLaah2Y3ds1XjtYfOSm9hQLGA8Fp+1cwAg+ZoVnIAJkSf+i0RN6yxwnEfj9WAoj1QP9
         3cCkaSDjwRYAy9gTaNUU81Rp+oHJn4ppYGFivh0T0knTRTQnKpNsuGoto8fVCwI2NNKS
         N78wCh30Yi+vNrdi6ujUkU1bDTZ7+FjVlQRwtYpE3nNUngzpsG5Jp9vpFUfwl1Z8H12w
         8FnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pp4OJKlkTUP/JKWBsfGX5IGPygvYeWUCLyYPIlFud78=;
        b=X7UhM/rMOfj6kMu1WIgdlfN4FcpvbBFD/xhCXxNJkNbS4Ly1AUbpemeklT/RC55Bgu
         WYZ+HWfhMhUqItzq/5VWf+sC6+IVlrUAzfM2q3kNGlpPL7pEYUiFaVulbcRdpPba8hZ7
         W+3rLWMIXOXBpwQPNPeXaHsmey0fZwdkqPXHOng57++rYLma/KwsbrufYc/rKAaYDySk
         TqVU3KY+kx4YY8nccPCLq+ndsmkiy0Jb8N3LgITQ2i1jGI8aLEjYCVEQf5a7bPpHRkUX
         QJv2K3ZF1TzaPwHoPH3htNCFhSvzMlXED0Iol18iO63Satk0PgtlxTF5z1USIJsTPvVy
         NgZg==
X-Gm-Message-State: APjAAAUHrfYejcB4RcbOFG41dORuw+sc0PuZVIX/sAxFQ2BpHl9wuuKW
        SeDyEF/ZEm8Ys4rlAQ55AR9cVg==
X-Google-Smtp-Source: APXvYqy3jXvJE7VyZtpKH6rIFhGNbXxpgKh1xaZZt9uPKJ3Z6xLRb6oa+wLz4XgROfrFkfGKGYes3Q==
X-Received: by 2002:a17:90b:4396:: with SMTP id in22mr18082228pjb.83.1582528831644;
        Sun, 23 Feb 2020 23:20:31 -0800 (PST)
Received: from localhost ([45.127.44.57])
        by smtp.gmail.com with ESMTPSA id p23sm11452767pgn.92.2020.02.23.23.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2020 23:20:30 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        swboyd@chromium.org, mka@chromium.org, daniel.lezcano@linaro.org,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [RFC PATCH v5 0/3] Convert thermal bindings to yaml
Date:   Mon, 24 Feb 2020 12:50:24 +0530
Message-Id: <cover.1582527752.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi all,

Here is a series splitting up the thermal bindings into 3 separate bindings
in YAML, one each of the sensor, cooling-device and the thermal zones.
Since I was learning about YAML parsers while creating these bindings,
there are bound to be some issues.

I have to add that the bindings as they exist today, don't really follow
the "describe the hardware" model of devicetree. e.g. the entire
thermal-zone binding is a software abstraction to tie arbitrary,
board-specific trip points to cooling strategies. This doesn't fit well
into the model where the same SoC in two different form-factor devices e.g.
mobile and laptop, will have fairly different thermal profiles and might
benefit from different trip points and mitigation heuristics. I've started
some experiments with moving the thermal zone data to a board-specific
platform data that is used to initialise a "thermal zone driver".

In any case, if we ever move down that path, it'll probably end up being v2
of the binding, so this series is still relevant.

Please help review.

Regards,
Amit


Amit Kucheria (3):
  dt-bindings: thermal: Add yaml bindings for thermal sensors
  dt-bindings: thermal: Add yaml bindings for thermal cooling-devices
  dt-bindings: thermal: Add yaml bindings for thermal zones

 .../thermal/thermal-cooling-devices.yaml      | 114 +++++++
 .../bindings/thermal/thermal-sensor.yaml      |  70 ++++
 .../bindings/thermal/thermal-zones.yaml       | 302 ++++++++++++++++++
 3 files changed, 486 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
 create mode 100644 Documentation/devicetree/bindings/thermal/thermal-sensor.yaml
 create mode 100644 Documentation/devicetree/bindings/thermal/thermal-zones.yaml

-- 
2.20.1

