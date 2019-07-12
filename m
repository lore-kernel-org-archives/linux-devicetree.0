Return-Path: <SRS0=Hfcl=VJ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from bastet.se.axis.com ([195.60.68.11]:32778 "EHLO
        bastet.se.axis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbfGLL7C (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jul 2019 07:59:02 -0400
From: Pavel Modilaynen <pavel.modilaynen@axis.com>
Subject: [PATCH] dtc: Use pkg-config to locate libyaml
Date: Fri, 12 Jul 2019 13:52:19 +0200
Message-Id: <20190712115219.25997-1-pavelmn@axis.com>
Sender: devicetree-owner@vger.kernel.org
To: robh+dt@kernel.org, frowand.list@gmail.com
Cc: devicetree@vger.kernel.org, Pavel Modilaynen <pavelmn@axis.com>
List-ID: <devicetree@vger.kernel.org>

From: Pavel Modilaynen <pavel.modilaynen@axis.com>

Using Makefile's wildcard with absolute path to detect
the presence of libyaml results in false-positive
detection when cross-compiling e.g. in yocto environment.
The latter results in build error:
| scripts/dtc/yamltree.o: In function `yaml_propval_int':
| yamltree.c: undefined reference to `yaml_sequence_start_event_initialize'
| yamltree.c: undefined reference to `yaml_emitter_emit'
| yamltree.c: undefined reference to `yaml_scalar_event_initialize'
...
Use pkg-config to locate libyaml to address this scenario.

Signed-off-by: Pavel Modilaynen <pavel.modilaynen@axis.com>
---
 scripts/dtc/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
index 82160808765c..99d51b665432 100644
--- a/scripts/dtc/Makefile
+++ b/scripts/dtc/Makefile
@@ -11,7 +11,7 @@ dtc-objs	+= dtc-lexer.lex.o dtc-parser.tab.o
 # Source files need to get at the userspace version of libfdt_env.h to compile
 HOST_EXTRACFLAGS := -I $(srctree)/$(src)/libfdt
 
-ifeq ($(wildcard /usr/include/yaml.h),)
+ifeq ($(shell pkg-config --exists yaml-0.1 && echo yes),)
 ifneq ($(CHECK_DTBS),)
 $(error dtc needs libyaml for DT schema validation support. \
 	Install the necessary libyaml development package.)
@@ -19,7 +19,7 @@ endif
 HOST_EXTRACFLAGS += -DNO_YAML
 else
 dtc-objs	+= yamltree.o
-HOSTLDLIBS_dtc	:= -lyaml
+HOSTLDLIBS_dtc	:= $(shell pkg-config yaml-0.1 --libs)
 endif
 
 # Generated files need one more search path to include headers in source tree
-- 
2.11.0
