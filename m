From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] of/address: fix typo in comment block of of_translate_one()
Date: Mon, 30 Nov 2015 15:22:37 +0900
Message-ID: <1448864557-18658-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

Remove the "not" before "cannot".

I am fixing the comment block style while I am here.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/of/address.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 5289c80..91a469d 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -485,9 +485,10 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
 	int rone;
 	u64 offset = OF_BAD_ADDR;
 
-	/* Normally, an absence of a "ranges" property means we are
+	/*
+	 * Normally, an absence of a "ranges" property means we are
 	 * crossing a non-translatable boundary, and thus the addresses
-	 * below the current not cannot be converted to CPU physical ones.
+	 * below the current cannot be converted to CPU physical ones.
 	 * Unfortunately, while this is very clear in the spec, it's not
 	 * what Apple understood, and they do have things like /uni-n or
 	 * /ht nodes with no "ranges" property and a lot of perfectly
-- 
1.9.1
