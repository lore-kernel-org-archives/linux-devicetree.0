Return-Path: <SRS0=nYmw=A7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 656F3C4346E
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jul 2020 12:50:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 40B522073A
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jul 2020 12:50:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1P3qiOfe";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uPFNfunp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728883AbgGTMum (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jul 2020 08:50:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728858AbgGTMum (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jul 2020 08:50:42 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2643BC061794;
        Mon, 20 Jul 2020 05:50:42 -0700 (PDT)
From:   Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1595249439;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=6+BzVRvbBqejxHDmGLD/drz5+sgjSBkrPrmMnAHy3U0=;
        b=1P3qiOfeLhHz+38cMTzC2Jtn9V8F7C/GmBn9Kef4LNSiAs7Euymq1yQ7FmpT+GGBPc/eJH
        smdERbKO8N4pn0WsXcTSmV8GxYm1Fy0pk2sUzWyNMFWKvNCA5X7cjQxReohJM3DgHpmKj/
        ybVjVltmJtUOiEswqrme6pd2jyPyBSJESX0h5MilDDzuXTNM3/KHtsItZcUdIORtkDctlT
        SV90HrTr0wBYo2ScGHdecRKtXIWQImqnkpcnfKifQJi9sXwFy9lqY0uCZ4RDZtqeVgN0TQ
        53HkTotvNdwGvjjgYyY4OSRS78iUxL7gaIrYbiR6E+tpriwTV8tgDQ6+r7up5Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1595249439;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=6+BzVRvbBqejxHDmGLD/drz5+sgjSBkrPrmMnAHy3U0=;
        b=uPFNfunpnA3LELZYbJ5wt5ophNF5yFGPcVNvAeqi0cCUaLE5cWO6cXV4Ave5ljNRtY9aW7
        o+7jivPLQ0swMZDw==
To:     Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, Kurt Kanzenbach <kurt@linutronix.de>
Subject: [PATCH v2 0/3] Add DSA yaml binding
Date:   Mon, 20 Jul 2020 14:49:36 +0200
Message-Id: <20200720124939.4359-1-kurt@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

as discussed [1] [2] it makes sense to add a DSA yaml binding. This is the
second version and contains now two ways of specifying the switch ports: Either
by "ports" or by "ethernet-ports". That is why the third patch also adjusts the
DSA core for it.

Tested in combination with the hellcreek.yaml file.

Changes since v1:

 * Use select to not match unrelated switches
 * Allow ethernet-port(s)
 * List ethernet-controller properties
 * Include better description
 * Let dsa.txt refer to dsa.yaml

Thanks,
Kurt

[1] - https://lkml.kernel.org/netdev/449f0a03-a91d-ae82-b31f-59dfd1457ec5@gmail.com/
[2] - https://lkml.kernel.org/netdev/20200710090618.28945-1-kurt@linutronix.de/

Kurt Kanzenbach (3):
  dt-bindings: net: dsa: Add DSA yaml binding
  dt-bindings: net: dsa: Let dsa.txt refer to dsa.yaml
  net: dsa: of: Allow ethernet-ports as encapsulating node

 .../devicetree/bindings/net/dsa/dsa.txt       | 255 +-----------------
 .../devicetree/bindings/net/dsa/dsa.yaml      |  92 +++++++
 net/dsa/dsa2.c                                |   8 +-
 3 files changed, 99 insertions(+), 256 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/dsa.yaml

-- 
2.20.1

