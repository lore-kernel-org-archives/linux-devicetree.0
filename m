From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH] pinctrl: single: fix error return code in pcs_parse_one_pinctrl_entry()
Date: Tue, 7 May 2013 20:06:19 +0800
Message-ID: <CAPgLHd-av2Yg44ARcSGr_zOajO-U611y3N4_Sn7J5Z+=OfVFcg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, grant.likely@linaro.org, rob.herring@calxeda.com, haojian.zhuang@linaro.org
Cc: yongjun_wei@trendmicro.com.cn, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Introduced by commit 9dddb4df90d136429b6d6ddefceb49a9b93f6cd1
(pinctrl: single: support generic pinconf)

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/pinctrl/pinctrl-single.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 5f2d2bf..b9fa046 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1166,7 +1166,8 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
 	(*map)->data.mux.function = np->name;
 
 	if (pcs->is_pinconf) {
-		if (pcs_parse_pinconf(pcs, np, function, map))
+		res = pcs_parse_pinconf(pcs, np, function, map);
+		if (res)
 			goto free_pingroups;
 		*num_maps = 2;
 	} else {
