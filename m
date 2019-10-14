From: kbuild test robot <lkp@intel.com>
Subject: [RFC PATCH] crypto: sun8i_ce_pm_ops can be static
Date: Tue, 15 Oct 2019 00:32:43 +0800
Message-ID: <20191014163243.ijpkv4uyszse32lw@332d0cec05f4>
References: <20191012184852.28329-3-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191012184852.28329-3-clabbe.montjoie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@lists.01.org, catalin.marinas@arm.com, davem@davemloft.net, herbert@gondor.apana.org.au, linux@armlinux.org.uk, mark.rutland@arm.com, mripard@kernel.org, robh+dt@kernel.org, wens@csie.org, will@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Corentin Labbe <clabbe.montjoie@gmail.com>
List-Id: devicetree@vger.kernel.org


Fixes: f113059e7b4f ("crypto: Add Allwinner sun8i-ce Crypto Engine")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 sun8i-ce-core.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
index 77e9cb0cc6eea..a08f0e7a29752 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -412,7 +412,7 @@ static int sun8i_ce_pm_resume(struct device *dev)
 	return err;
 }
 
-const struct dev_pm_ops sun8i_ce_pm_ops = {
+static const struct dev_pm_ops sun8i_ce_pm_ops = {
 	SET_RUNTIME_PM_OPS(sun8i_ce_pm_suspend, sun8i_ce_pm_resume, NULL)
 };
 
