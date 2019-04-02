Return-Path: <SRS0=mx8/=SE=in.bosch.com=ArunKumar.Prakash@kernel.org>
From: ArunKumar.Prakash <ArunKumar.Prakash@in.bosch.com>
Subject: [PATCH] of: overlay: Fix for possible kfree() on already freed memory
Message-ID: <0171a15f-a1fc-bcc6-f10d-1bc0e401eadd@in.bosch.com>
Date: Tue, 2 Apr 2019 06:53:25 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

While applying an overlay, on an error return from
init_overlay_changeset(), of_overlay_apply()
frees memory pointed by the function arguments 'fdt' and 'tree';
free_overlay_changeset() is then called which tries to free memory
at the same location as 'fdt' aka 'ovcs->fdt' and
'tree' aka 'ovcs->overlay_tree'.

This can produce kernel Oops/BUG_ON() assertion.
This is fixed by making sure elements in ovcs are zero/NULL initialized
until _all_ checks for errors pass.

Below kernel OOPS occurred when a device tree overlay
with an invalid target/target-path is applied.

OF: overlay: find target, node: /fragment@2, path '/external-pcb' not found
OF: overlay: init_overlay_changeset() failed, ret = -22
------------[ cut here ]------------
kernel BUG at mm/slub.c:3892!
Internal error: Oops - BUG: 0 [#1] PREEMPT SMP

------------[manual cut]------------------
task: ffff8004c1529c00 task.stack: ffff00001eea8000
PC is at kfree+0xe4/0x238
LR is at free_overlay_changeset+0x8c/0xac
pc : [<ffff0000081d13e0>] lr : [<ffff0000085b29e8>] ps
x0 : ffff7e0012795d20
Process cat (pid: 2586, stack limit = 0xffff00001eea8000)
Call trace:
Exception stack(0xffff00001eeaba20 to 0xffff00001eeabb60)
[<ffff0000081d13e0>] kfree+0xe4/0x238
[<ffff0000085b29e8>] free_overlay_changeset+0x8c/0xac
[<ffff0000085b33a0>] of_overlay_fdt_apply+0x4d4/0x614
[<ffff0000085ac2e8>] create_overlay+0xac/0x104
[<ffff0000085ac3a4>] cfs_overlay_item_dtbo_write+0x64/0x98
[<ffff00000825dda8>] configfs_release_bin_file+0x58/0x98
[<ffff0000081e587c>] __fput+0xe4/0x1a8
[<ffff0000081e5998>] ____fput+0xc/0x14
[<ffff0000080b9da0>] task_work_run+0x88/0xa4
[<ffff0000080a0968>] do_exit+0x428/0x8f4
[<ffff0000080a0ea4>] do_group_exit+0x40/0x98
[<ffff0000080a0f0c>] __wake_up_parent+0x0/0x28

Signed-off-by: Arun Kumar Prakash <ArunKumar.Prakash@in.bosch.com>
---
 drivers/of/overlay.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 68c281d..a0908ce 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -569,9 +569,6 @@ static int init_overlay_changeset(struct overlay_changeset *ovcs,
 	if (!of_node_is_root(tree))
 		pr_debug("%s() tree is not root\n", __func__);
 
-	ovcs->overlay_tree = tree;
-	ovcs->fdt = fdt;
-
 	INIT_LIST_HEAD(&ovcs->ovcs_list);
 
 	of_changeset_init(&ovcs->cset);
@@ -650,6 +647,8 @@ static int init_overlay_changeset(struct overlay_changeset *ovcs,
 	ovcs->id = id;
 	ovcs->count = cnt;
 	ovcs->fragments = fragments;
+	ovcs->overlay_tree = tree;
+	ovcs->fdt = fdt;
 
 	return 0;
 
-- 
2.7.4
