From: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Subject: [PATCH v3 4/7] NFC: trf7970a: Remove useless comment
Date: Fri, 20 Jan 2017 12:17:42 -0700
Message-ID: <20170120191745.29255-5-mgreer@animalcreek.com>
References: <20170120191745.29255-1-mgreer@animalcreek.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170120191745.29255-1-mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lauro Ramos Venancio <lauro.venancio-430g2QfJUUCGglJvpFV4uA@public.gmane.org>, Aloisio Almeida Jr <aloisio.almeida-430g2QfJUUCGglJvpFV4uA@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The last entry in the trf7970a_of_match[] table must be an empty
entry to demarcate the end of the table.  Currently, there is a
comment indicating this but it is obvious so remove the comment.

Signed-off-by: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
---
 drivers/nfc/trf7970a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
index bd3d9a09da0d..6fd85be49365 100644
--- a/drivers/nfc/trf7970a.c
+++ b/drivers/nfc/trf7970a.c
@@ -2211,7 +2211,7 @@ static const struct dev_pm_ops trf7970a_pm_ops = {
 
 static const struct of_device_id trf7970a_of_match[] = {
 	{ .compatible = "ti,trf7970a", },
-	{ /* sentinel */ },
+	{},
 };
 MODULE_DEVICE_TABLE(of, trf7970a_of_match);
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
