Return-Path: <SRS0=N8x8=KD=mentor.com=Harish_Kandiga@kernel.org>
From: Harish Jenny K N <harish_kandiga@mentor.com>
Subject: [PATCH] Documentation: remove dynamic-resolution-notes reference to non-existent file
Date: Thu, 19 Jul 2018 17:24:04 +0530
Message-ID: <1532001244-8349-1-git-send-email-harish_kandiga@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Harish Jenny K N <harish_kandiga@mentor.com>
List-ID: <devicetree@vger.kernel.org>

File dt-object-internal.txt does not exist. This patch removes
a reference to it.

Signed-off-by: Harish Jenny K N <harish_kandiga@mentor.com>
---
 Documentation/devicetree/dynamic-resolution-notes.txt | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/dynamic-resolution-notes.txt b/Documentation/devicetree/dynamic-resolution-notes.txt
index 083d232..c24ec36 100644
--- a/Documentation/devicetree/dynamic-resolution-notes.txt
+++ b/Documentation/devicetree/dynamic-resolution-notes.txt
@@ -2,15 +2,14 @@ Device Tree Dynamic Resolver Notes
 ----------------------------------

 This document describes the implementation of the in-kernel
-Device Tree resolver, residing in drivers/of/resolver.c and is a
-companion document to Documentation/devicetree/dt-object-internal.txt[1]
+Device Tree resolver, residing in drivers/of/resolver.c

 How the resolver works
 ----------------------

 The resolver is given as an input an arbitrary tree compiled with the
 proper dtc option and having a /plugin/ tag. This generates the
-appropriate __fixups__ & __local_fixups__ nodes as described in [1].
+appropriate __fixups__ & __local_fixups__ nodes.

 In sequence the resolver works by the following steps:

--
2.7.4
