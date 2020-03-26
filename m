Return-Path: <SRS0=lKpO=5L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B5DC2D0E8
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 10:56:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1FB9C20838
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 10:56:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EGCqvfJE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727688AbgCZK4h (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 26 Mar 2020 06:56:37 -0400
Received: from mail-lf1-f44.google.com ([209.85.167.44]:34662 "EHLO
        mail-lf1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727841AbgCZK4h (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 26 Mar 2020 06:56:37 -0400
Received: by mail-lf1-f44.google.com with SMTP id e7so4419161lfq.1
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2020 03:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=47qXZzwAbKRjmlZIR98ky/JOV75sfZwm8sWlwjShF8c=;
        b=EGCqvfJE6vR1DAd9s5QD9Lz37cQED2VqxH8++YisKkjfp+p7F8m2Y71LDftQBpb/2n
         i5VgyFZ9WS8uu99Tqbsk26tLxx8VfPW2OQl5zqQ8Y7AtEKez9H72KpmrpqdZ9HDTCCX4
         /7w+vI3ihA0ONx8vYXi6P9G41+zT2cquEvOCqPZhp1QKQcGeoXiYyDVE/vplychWsqje
         P79LblH0YEbwBPDoDKyXQd6hF8RY5vEk5YhEJ1efuYiLPVx4yd+X/chm+hWLcGnZ0BWN
         iVID2OyJ58JpmCSQjz4O+fKvPfnXg4za+xEf7Upx9Cx5aS+GNZRwLpNMFjJP14qQc5yU
         HIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=47qXZzwAbKRjmlZIR98ky/JOV75sfZwm8sWlwjShF8c=;
        b=nywAwpnjE7B5SNj2xQDN59BfDgcMX2PENPeSG99OZsjnaedoorWD0bgBjRvjVXeaDZ
         BQr17up0RIZBVlhCI3XPkdt+Uow2zbYEoVSXsuLbtC+H77omPDneSxsZ5Xid/+rTw1S8
         9j/4Ol4LLRtjTYOLf4QUer6tdz+H9EQXDuhdcLzkIhZprCRiW6rrQ+RKyYrhqWjFi+bs
         SqLOjBetB9QzqyExddN2S1HPX4YbwbDTpAEFar75G3ZxG+vs+48L/tlS4bCthdq51zp2
         v1CyQC+T4EOGtFXV5UKDWbEyUhKjLB0fhbMacWUhuxSzoHEhty80XOemqmvfMFBjy+gc
         0grg==
X-Gm-Message-State: ANhLgQ1HkX2CQq0MkbD6cRK5+yX9fvQAhH8QCtC9AUl4oW1m0pdsc6Vg
        tkQIMegLWzLycXMglRyv91AgJw==
X-Google-Smtp-Source: ADFU+vvS1OdyK1KZuc0v+FzxWV0LS3mwrT/slQOOveM59Ax919FAfDjO8Iw+zFw0NGknj1fhGBUQFg==
X-Received: by 2002:a19:4cc2:: with SMTP id z185mr5441924lfa.0.1585220194880;
        Thu, 26 Mar 2020 03:56:34 -0700 (PDT)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id z17sm1214653ljm.19.2020.03.26.03.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 03:56:34 -0700 (PDT)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Lina Iyer <ilina@codeaurora.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Subject: [PATCH 0/2] dt-bindings: A few updates to PSCI and power-domain bindings
Date:   Thu, 26 Mar 2020 11:56:24 +0100
Message-Id: <20200326105626.6369-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Recent updates to the PSCI and the power-domain DT bindings, deserves some
additional improvements on top. This series takes care of this.

Ulf Hansson (2):
  dt-bindings: arm: Add some constraints for PSCI nodes
  dt-bindings: power: Fix example for power-domain

 .../devicetree/bindings/arm/psci.yaml         |  5 ++++
 .../bindings/power/power-domain.yaml          | 28 +++++++++----------
 2 files changed, 19 insertions(+), 14 deletions(-)

-- 
2.20.1

