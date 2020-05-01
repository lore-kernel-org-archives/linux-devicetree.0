Return-Path: <SRS0=mas4=6P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8707EC4724C
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 May 2020 01:53:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DFF22074A
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 May 2020 01:53:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="eneE0fYo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbgEABxQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Apr 2020 21:53:16 -0400
Received: from mail.nic.cz ([217.31.204.67]:58544 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727114AbgEABxP (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 30 Apr 2020 21:53:15 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 90573141655;
        Fri,  1 May 2020 03:51:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1588297912; bh=E0JKU+hw2ZUnU2i+zuT/JyTDl0Zn7jK48cYFx9SkM9o=;
        h=From:To:Date;
        b=eneE0fYoP4S57ZQLcIwj0Gr7B+mirCGyLrrimSz9+qSioLXDJv+x7ixjrIhm7Ih+p
         fnCF/D6n9wafjC+V08b74zQ3Qy/ihILi/ymO3NV3RS+rBWK9AuTGKIreWCZ+CbgrQP
         /mKy0W/dsnIhcfpniINuF/1J1VWexvmpmD6HRjqU=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     devicetree@vger.kernel.org
Cc:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Pavel Modilaynen <pavel.modilaynen@axis.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] dtc: Use better check for libyaml
Date:   Fri,  1 May 2020 03:51:47 +0200
Message-Id: <20200501015147.32391-1-marek.behun@nic.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.101.4 at mail
X-Virus-Status: Clean
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The current check for libyaml based on pkg-config may succeed even if
yaml.h header is missing. Try to determine if the header is also present
by compiling a simple program.

Fixes: 067c650c456e ("dtc: Use pkg-config to locate libyaml")
Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Pavel Modilaynen <pavel.modilaynen@axis.com>
Cc: Rob Herring <robh+dt@kernel.org>
---
 scripts/dtc/Makefile | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
index ef85f8b7d4a7..75045787f897 100644
--- a/scripts/dtc/Makefile
+++ b/scripts/dtc/Makefile
@@ -12,15 +12,24 @@ dtc-objs	+= dtc-lexer.lex.o dtc-parser.tab.o
 # Source files need to get at the userspace version of libfdt_env.h to compile
 HOST_EXTRACFLAGS := -I $(srctree)/$(src)/libfdt
 
-ifeq ($(shell pkg-config --exists yaml-0.1 2>/dev/null && echo yes),)
+_yaml_libs = $(shell pkg-config --libs yaml-0.1 2>/dev/null)
+_cmd_has_yaml =								\
+   { echo "\#include <yaml.h>" ;					\
+     echo "int main(){" ;						\
+     echo "yaml_get_version(NULL,NULL,NULL);" ;				\
+     echo "}" ; } |							\
+   $(HOSTCC) -xc - -o /dev/null $(_yaml_libs) 2>/dev/null && echo yes
+_has_yaml = $(shell $(_cmd_has_yaml))
+
+ifeq ($(_has_yaml),yes)
+dtc-objs	+= yamltree.o
+HOSTLDLIBS_dtc	:= $(_yaml_libs)
+else
 ifneq ($(CHECK_DT_BINDING)$(CHECK_DTBS),)
 $(error dtc needs libyaml for DT schema validation support. \
 	Install the necessary libyaml development package.)
 endif
 HOST_EXTRACFLAGS += -DNO_YAML
-else
-dtc-objs	+= yamltree.o
-HOSTLDLIBS_dtc	:= $(shell pkg-config yaml-0.1 --libs)
 endif
 
 # Generated files need one more search path to include headers in source tree
-- 
2.24.1

