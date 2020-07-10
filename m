Return-Path: <SRS0=VTvW=AV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CFDC433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 09:07:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20A6B207FF
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 09:07:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NU0o0rmL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ExT1cj+L"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgGJJHG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jul 2020 05:07:06 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:45422 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726288AbgGJJHG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Jul 2020 05:07:06 -0400
From:   Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1594372024;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=MVpLVGnR+Mx6MGrjjXvN7djH89CADIzyMcCTyhH/N5s=;
        b=NU0o0rmLqfZRQyGDsJiNHGl4JyQD75vjZbsaeORZh+HdhLh8QBuNhSA4Bow4S9w7j6tDe5
        gWhQfXr5q0fvbLERk6qk5Pys83JwyLmDydvYDh4abm10016fFfM3nJq9zRfSVEtSQJJxqr
        N4gI465NlXXCYTb+WGsVLqezrIqKUyDxG9bhf3Z9qnRCh2mFIpJepaHd97gHFaAcmfxPxj
        620Fm6z02Yfe/MXSnjrdIIilPXfmYBufX6wlyoe98hW4lyW9IggKrf88IafVPc5h3ksPwl
        mEJmwqaTs823uNyAr9aBq1s1JjUguhdipgBrIwYPX397NhUBjfuFd6t6kdMJMQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1594372024;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=MVpLVGnR+Mx6MGrjjXvN7djH89CADIzyMcCTyhH/N5s=;
        b=ExT1cj+LXdXw96gtPegeZ4y8YKjDPawGPbV27oVaF3WPCAE3n2LWFjJnWGO5EHfblldQEM
        dV7TgdZRFrrtfKBQ==
To:     Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, Kurt Kanzenbach <kurt@linutronix.de>
Subject: [PATCH v1 0/1] dt-bindings: net: dsa: Add DSA yaml binding
Date:   Fri, 10 Jul 2020 11:06:17 +0200
Message-Id: <20200710090618.28945-1-kurt@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

as discussed [1] it makes sense to add a DSA yaml binding. So here it
is. Feedback is highly welcome. Tested in combination with the hellcreek.yaml
file.

Thanks,
Kurt

[1] - https://lkml.kernel.org/netdev/449f0a03-a91d-ae82-b31f-59dfd1457ec5@gmail.com/

Kurt Kanzenbach (1):
  dt-bindings: net: dsa: Add DSA yaml binding

 .../devicetree/bindings/net/dsa/dsa.yaml      | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/dsa.yaml

-- 
2.20.1

