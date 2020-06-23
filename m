Return-Path: <SRS0=lOvj=AE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88226C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 09:44:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6626F20679
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 09:44:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732049AbgFWJoC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 23 Jun 2020 05:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732005AbgFWJoC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 23 Jun 2020 05:44:02 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9742C061573
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2020 02:44:01 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:26:93a1:ff06:f8b0])
        by baptiste.telenet-ops.be with bizsmtp
        id uZjo2200Q4qCYS801ZjoYa; Tue, 23 Jun 2020 11:43:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jnfT2-0006Zp-Cq; Tue, 23 Jun 2020 11:43:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jnfT2-0006mF-BD; Tue, 23 Jun 2020 11:43:48 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     David Gibson <david@gibson.dropbear.id.au>,
        Jon Loeliger <jdl@jdl.com>
Cc:     devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dtc: Consider one-character strings as strings
Date:   Tue, 23 Jun 2020 11:43:43 +0200
Message-Id: <20200623094343.26010-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

When using overlays, a target-path property pointing to the root node is
quite common.  However, "dtc -O dts" prints it as a byte array:

    target-path = [2f 00];

instead of a string:

    target-path = "/";

For guess_value_type() to consider a value to be a string, it must
contain less nul bytes than non-nul bytes, thus ruling out strings
containing only a single character.  Allow printing such strings by
relaxing the condition slightly.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Alternatively, guess_value_type() could check explicitly for "/",
reducing the number of false positives.

However, there seem to be plenty of other uses of one-character strings
in DTS files.  The most common one is 'type = "a"' for HDMI connectors.
---
 treesource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/treesource.c b/treesource.c
index 2acb920d77752410..061ba8c9c5e83265 100644
--- a/treesource.c
+++ b/treesource.c
@@ -183,7 +183,7 @@ static enum markertype guess_value_type(struct property *prop)
 			nnotcelllbl++;
 	}
 
-	if ((p[len-1] == '\0') && (nnotstring == 0) && (nnul < (len-nnul))
+	if ((p[len-1] == '\0') && (nnotstring == 0) && (nnul <= (len-nnul))
 	    && (nnotstringlbl == 0)) {
 		return TYPE_STRING;
 	} else if (((len % sizeof(cell_t)) == 0) && (nnotcelllbl == 0)) {
-- 
2.17.1

