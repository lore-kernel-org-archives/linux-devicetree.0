From: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 3/4] clk: berlin: bg2q: remove CLK_IGNORE_UNUSED flag for sdio clk
Date: Tue, 20 Oct 2015 19:16:46 +0800
Message-ID: <1445339807-2351-4-git-send-email-jszhang@marvell.com>
References: <1445339807-2351-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445339807-2351-1-git-send-email-jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Since we have added the necessary two clks' properties in dts, we can
remove the "sdio" clk's CLK_IGNORE_UNUSED flag now.

Signed-off-by: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
---
 drivers/clk/berlin/bg2q.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/berlin/bg2q.c b/drivers/clk/berlin/bg2q.c
index 221f40c..243f421 100644
--- a/drivers/clk/berlin/bg2q.c
+++ b/drivers/clk/berlin/bg2q.c
@@ -283,7 +283,7 @@ static const struct berlin2_gate_data bg2q_gates[] __initconst = {
 	{ "usb2",	"perif",	13 },
 	{ "usb3",	"perif",	14 },
 	{ "pbridge",	"perif",	15, CLK_IGNORE_UNUSED },
-	{ "sdio",	"perif",	16, CLK_IGNORE_UNUSED },
+	{ "sdio",	"perif",	16 },
 	{ "nfc",	"perif",	18 },
 	{ "pcie",	"perif",	22 },
 };
-- 
2.6.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
