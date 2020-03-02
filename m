Return-Path: <SRS0=6Sr8=4T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7704C3F2D1
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 07:39:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 707ED246A1
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 07:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583134741;
	bh=XIX1LJr3jD45q3Z0gSSWopKbjAyVMDxrUDvlKRrob/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=tjju2UuSOpaNyCx3lmVcdGiuIM7gKT30ePqojS8aaJPgw1YxlzY4KWdKWGQgpwqD4
	 EFC8jgSglsOT2f33ODc8y3/KUCq9UA8O+NJHJF3KkZ6OqnRpfQgY9UJKvehNiAk2cB
	 enGDpziG4AxO/2dbtk8m8jz1WiCKkAYum4P4mxlI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgCBHiP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Mar 2020 02:38:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:44694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726621AbgCBHiP (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 2 Mar 2020 02:38:15 -0500
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6F3B9246B6;
        Mon,  2 Mar 2020 07:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583134694;
        bh=XIX1LJr3jD45q3Z0gSSWopKbjAyVMDxrUDvlKRrob/E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sF6rR4xmi6t7PeztH1k0fb41pP1sQytvD2Plgcr6tPMqqsBnEd839sgvjK0eV5Hza
         p/h2YgL568/dOxXva79cGXbTZ2hYDsuoB0aMpmH1zxP2mVSl9pDOO5RjUeGRtI9h5H
         iikUmjaCIqFKpGMj4ycSsE/WODE+BWmu3mVdQK9w=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1j8feV-0003VZ-Ri; Mon, 02 Mar 2020 08:38:11 +0100
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: [PATCH 03/12] docs: dt: usage_model.rst: fix link for DT usage
Date:   Mon,  2 Mar 2020 08:37:58 +0100
Message-Id: <a7e0a5597ace97503c8ff67cdab2351151c7f267.1583134242.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <cover.1583134242.git.mchehab+samsung@kernel.org>
References: <cover.1583134242.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The devicetree.org doesn't host the Device_Tree_Usage page
anymore. So, fix the link to point to a new address.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/devicetree/usage-model.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/usage-model.rst b/Documentation/devicetree/usage-model.rst
index 326d7af10c5b..e1b42dc63f01 100644
--- a/Documentation/devicetree/usage-model.rst
+++ b/Documentation/devicetree/usage-model.rst
@@ -12,7 +12,7 @@ This article describes how Linux uses the device tree.  An overview of
 the device tree data format can be found on the device tree usage page
 at devicetree.org\ [1]_.
 
-.. [1] http://devicetree.org/Device_Tree_Usage
+.. [1] https://elinux.org/Device_Tree_Usage
 
 The "Open Firmware Device Tree", or simply Device Tree (DT), is a data
 structure and language for describing hardware.  More specifically, it
-- 
2.21.1

