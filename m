From: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH -next] gpu: host1x: gr2d drivers/gpu/host1x/drm/gr2d.c: fix
 error return code in gr2d_submit()
Date: Wed, 24 Apr 2013 10:19:27 +0800
Message-ID: <CAPgLHd8Nj-K4X8gX4_bMFcYjCBU=XzFnGidhvfF0ZtoCXCv0qg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
---
 drivers/gpu/host1x/drm/gr2d.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/drm/gr2d.c b/drivers/gpu/host1x/drm/gr2d.c
index 6a45ae0..146cd64 100644
--- a/drivers/gpu/host1x/drm/gr2d.c
+++ b/drivers/gpu/host1x/drm/gr2d.c
@@ -135,8 +135,10 @@ static int gr2d_submit(struct host1x_drm_context *context,
 			goto fail;
 
 		bo = host1x_bo_lookup(drm, file, cmdbuf.handle);
-		if (!bo)
+		if (!bo) {
+			err = -EINVAL;
 			goto fail;
+		}
 
 		host1x_job_add_gather(job, bo, cmdbuf.words, cmdbuf.offset);
 		num_cmdbufs--;
@@ -158,8 +160,10 @@ static int gr2d_submit(struct host1x_drm_context *context,
 		reloc->cmdbuf = cmdbuf;
 		reloc->target = target;
 
-		if (!reloc->target || !reloc->cmdbuf)
+		if (!reloc->target || !reloc->cmdbuf) {
+			err = -EINVAL;
 			goto fail;
+		}
 	}
 
 	err = copy_from_user(job->waitchk, waitchks,
