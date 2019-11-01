Return-Path: <SRS0=9w3Z=YZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95399CA9ECF
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 Nov 2019 11:29:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 65E3821855
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 Nov 2019 11:29:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZuTw0li"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbfKAL33 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 1 Nov 2019 07:29:29 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40884 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbfKAL32 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 Nov 2019 07:29:28 -0400
Received: by mail-pl1-f195.google.com with SMTP id e3so2122927plt.7
        for <devicetree@vger.kernel.org>; Fri, 01 Nov 2019 04:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A8jyKNCvhqIlTF0nOXjRHhr0IkGR523dr7Xptd4WjeU=;
        b=VZuTw0liEBDgNPWag7s9u3rT605jQW0C+J9kOxrKuQW2SxAoWVtJY5L7HTRc+O6ivd
         JcUwmNKYhJGe4hwcuUhbggHM9ZzSmDCgPXuGZMQKsfTFZmNraNHLn1MZWh3IJuypD08b
         38q5aqZkn3caQVxCkWi6mWT4UCcw5oJnmwhrI4vUJmpuHy7Po0SbAN7mc0jtMMFtK9Go
         UcSY2zIHqIzy7obLnZGpgy09SeNyVmRfxMSV2T944ka0fwMlKHO9SObLixReJaExUA7C
         Cwh87oW/fZ0vGDOr4IqKzY7Xqi4CcWF2Adxhn63hmg/cExGR4N7AMfT7bwW1a2Mq/0ls
         Rdkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=A8jyKNCvhqIlTF0nOXjRHhr0IkGR523dr7Xptd4WjeU=;
        b=RYHovVBlUFLqDFJCTFabVRcYWKobDm51x5LZI08vdvH//tXvRUpzDQWmwyOAuAYFWF
         lcctqBYH2yV8eKH8NjVaUPmLXY94AxuS8vpcZ/c1Y7MWY6uORSdVOnz3AFkARLAFeTB0
         cujkVPPfjPvpJVRECBDosNlX1BmQdrTS/D0MCy3vtm8NVAYBxnqDXtKinohc98bB6A6v
         DFH+RtVPNYGbkMEqXdyBxxmPzciyZYfp3ZbOdMfU2BpOjt9j3hQJrc5Sb8Y32g9OgLhA
         0Qy4H6mK7necIpDWdUUvdvmQa13GhqNTNsmw24m7G6D6RH1/YFyblPVzCJPbuEhuQu8N
         B0RQ==
X-Gm-Message-State: APjAAAUb1P1hcVVdF1+A+ZvURCvMgDjQkOfsqGzD5JBSvZIl74jQMWLO
        dVD4eWg5tOfPIbeefYLoIEU=
X-Google-Smtp-Source: APXvYqycVMxkU+yInakKmu4Soq8iUpqZIlFuQ9dRzFPGLmsXP4Q7kIBEThFumlZYy0ruVHJaor6kwg==
X-Received: by 2002:a17:902:bb8b:: with SMTP id m11mr12169747pls.235.1572607767843;
        Fri, 01 Nov 2019 04:29:27 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id w12sm1369427pfn.105.2019.11.01.04.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 04:29:27 -0700 (PDT)
From:   Joel Stanley <joel@jms.id.au>
To:     Rob Herring <robh+dt@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
        Jeremy Kerr <jk@ozlabs.org>,
        Alistar Popple <alistair@popple.id.au>,
        Eddie James <eajames@linux.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        devicetree@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] fsi: Add AST2600 FSI master
Date:   Fri,  1 Nov 2019 21:59:02 +1030
Message-Id: <20191101112905.7282-2-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191101112905.7282-1-joel@jms.id.au>
References: <20191101112905.7282-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This adds support for the FSI master included in the ASPEED AST2600 BMC
SoC.

The driver has been tested on hardware for most operations. Future
enhancements include robust error recovery, DMA support and interrupt
support.

This patch doesn't include Andrew's endian fix from today, but we can
merge that as a follow up.

Please review!

Joel Stanley (3):
  dt-bindings: fsi: Add description of FSI master
  fsi: Add ast2600 master driver
  fsi: aspeed: Add trace points

 .../bindings/fsi/fsi-master-aspeed.txt        |  24 +
 drivers/fsi/Kconfig                           |   6 +
 drivers/fsi/Makefile                          |   1 +
 drivers/fsi/fsi-master-aspeed.c               | 550 ++++++++++++++++++
 include/trace/events/fsi_master_aspeed.h      |  77 +++
 5 files changed, 658 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
 create mode 100644 drivers/fsi/fsi-master-aspeed.c
 create mode 100644 include/trace/events/fsi_master_aspeed.h

-- 
2.24.0.rc1

