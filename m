Return-Path: <SRS0=E/bd=36=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D14C35254
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 17:50:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1A13320838
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 17:50:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kopismobile-com.20150623.gappssmtp.com header.i=@kopismobile-com.20150623.gappssmtp.com header.b="T341g6JG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727548AbgBJRuh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 12:50:37 -0500
Received: from mail-oi1-f176.google.com ([209.85.167.176]:35731 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727507AbgBJRuh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Feb 2020 12:50:37 -0500
Received: by mail-oi1-f176.google.com with SMTP id b18so10042397oie.2
        for <devicetree@vger.kernel.org>; Mon, 10 Feb 2020 09:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kopismobile-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version;
        bh=S6SvASRcIaU3c6voKXFvpN53oiJE43umJl9q4lSt+3w=;
        b=T341g6JG+IqhQaUpmTDNvVBv+3nJQh9QwjUxk6sGSuhMqggoqubn1ZBCg5LOeJONlv
         DaPR96Y/Ti2uYapl9ETvVQPyAcNs7HNGCGvopnnXTUjZkQ1RyXvxToxuP4rFTQpteXx1
         CSJyV6N4hEBwFckdBRt1a3QzCwcJv8cArdqJ5OwuWIjsWbaTbxYVkM4UfXw5W48P5dZ4
         rF4xuj3yFsHRt9gOAkwhuzvwaFlUYs0oovpxuDySp82n22fWTqzSKqYdRtlcy9z7bKmq
         sCYjw2mJgduWa6tDzxMQ2BKV+Ny2eQG6k58RbSa/NDjGhSjEDtmUZ4IHfPxB7MN1iP/K
         fPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version;
        bh=S6SvASRcIaU3c6voKXFvpN53oiJE43umJl9q4lSt+3w=;
        b=YNoDTD7MWIVof+eKhj59W12I26HyIW9uhJzAwsIfoZLsfZ8yAJxuhg5rGdFmcLlxeu
         QVgY/LEzd2iGKpU8feh/NLck4GsvqybKEixY0560ERQCV/uVGHOj0oXx/kpTPj2QYKVg
         yMQPFc4z4mAYaNsG1CErhglH+hzNcUPx9mqkFHO5/13MRnqPX9v+53BjDtmY/deur6Id
         5XPQcvi9YmI2UmYNO+7blMJm46exIyasIIt1TqZrilAYSsC8cPy2/Jjot096lpkXiiaH
         0VThGKSZUCPpfepIzKShJUsTkj44oOe68oqezwkUryqKAduIN8auI8HhvljLqMcYVMTH
         yCwQ==
X-Gm-Message-State: APjAAAU++IaHwSwaRhRqumIL/uHJvUqZH22LkUppreUqRodI4XwgrHai
        OET5S8mL/ke/4/KwImrFra5e/+MmKgAJTArCFxxtd4BvJSxDPh5Uy3h2ddq9aauqEpA42Boqizz
        e2NmyHaIoYWLMtVQ=
X-Google-Smtp-Source: APXvYqxcsq1u/5/cf9x3mTnx/Jw3eCJvrkfl9Vk7DMM0AoEc3N5neHU0T7A844bvvfLIlhjiQsQByA==
X-Received: by 2002:a54:4086:: with SMTP id i6mr146527oii.65.1581357036394;
        Mon, 10 Feb 2020 09:50:36 -0800 (PST)
Received: from farregard-ubuntu.kopismobile.org (c-73-177-17-21.hsd1.ms.comcast.net. [73.177.17.21])
        by smtp.gmail.com with ESMTPSA id r205sm293189oih.54.2020.02.10.09.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 09:50:36 -0800 (PST)
From:   George Hilliard <ghilliard@kopismobile.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/2] Implement support for inverted serial TX/RX on i.MX
Date:   Mon, 10 Feb 2020 11:49:40 -0600
Message-Id: <20200210174942.14182-1-ghilliard@kopismobile.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This peripheral has dedicated control bits that flip input/output
signals before handing them off to the OS.  This is useful on my
hardware because the UART is connected to an RS-422 transceiver with the
+/- pins hooked up backward.  Instead of a hack flipping all the bits
before sending them, the hardware can do it for free.



-- 
CONFIDENTIALITY NOTICE: This email and any attachments are for the sole use 
of the intended recipient and may contain material that is proprietary, 
confidential, privileged or otherwise legally protected or restricted under 
applicable government laws. Any review, disclosure, distributing or other 
use without expressed permission of the sender is strictly prohibited. If 
you are not the intended recipient, please contact the sender and delete 
all copies without reading, printing, or saving.
