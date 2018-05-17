From: frowand.list@gmail.com
Subject: [PATCH] of: overlay: validate offset from property fixups
Date: Wed, 16 May 2018 21:19:51 -0700
Message-ID: <1526530791-18591-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

The smatch static checker marks the data in offset as untrusted,
leading it to warn:

  drivers/of/resolver.c:125 update_usages_of_a_phandle_reference()
  error: buffer underflow 'prop->value' 's32min-s32max'

Add check to verify that offset is within the property data.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 drivers/of/resolver.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 65d0b7adfcd4..7edfac6f1914 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -122,6 +122,11 @@ static int update_usages_of_a_phandle_reference(struct device_node *overlay,
 			goto err_fail;
 		}
 
+		if (offset < 0 || offset + sizeof(__be32) > prop->length) {
+			err = -EINVAL;
+			goto err_fail;
+		}
+
 		*(__be32 *)(prop->value + offset) = cpu_to_be32(phandle);
 	}
 
-- 
Frank Rowand <frank.rowand@sony.com>
