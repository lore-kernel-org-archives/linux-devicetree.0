From: Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>
Subject: [RFC PATCH V1 6/6] platform: mtk-isp: Add Mediatek FD driver
Date: Tue, 23 Apr 2019 18:45:05 +0800
Message-ID: <20190423104505.38778-7-Jerry-Ch.chen@mediatek.com>
References: <20190423104505.38778-1-Jerry-Ch.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190423104505.38778-1-Jerry-Ch.chen@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com, tfiga@chromium.org, matthias.bgg@gmail.com, mchehab@kernel.org
Cc: shik@chromium.org, devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, Rynn.Wu@mediatek.com, srv_heupstream@mediatek.com, holmes.chiou@mediatek.com, suleiman@chromium.org, Jerry-ch Chen <jerry-ch.chen@mediatek.com>, jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org, linux-mediatek@lists.infradead.org, zwisler@chromium.org, christie.yu@mediatek.com, frederic.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Jerry-ch Chen <jerry-ch.chen@mediatek.com>

This patch adds the driver of Face Detection (FD) unit in
Mediatek camera system, providing face detection function.

The mtk-isp directory will contain drivers for multiple IP
blocks found in Mediatek ISP system. It will include ISP Pass 1
driver (CAM), sensor interface driver, DIP driver and face
detection driver.

Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
---
 drivers/media/platform/mtk-isp/Makefile       |   16 +
 drivers/media/platform/mtk-isp/fd/Makefile    |   25 +
 .../media/platform/mtk-isp/fd/mtk_fd-dev.c    |  754 +++++++++++
 .../media/platform/mtk-isp/fd/mtk_fd-dev.h    |  315 +++++
 drivers/media/platform/mtk-isp/fd/mtk_fd-hw.h |  158 +++
 .../media/platform/mtk-isp/fd/mtk_fd-smem.c   |  322 +++++
 .../media/platform/mtk-isp/fd/mtk_fd-smem.h   |   39 +
 .../media/platform/mtk-isp/fd/mtk_fd-v4l2.c   | 1171 +++++++++++++++++
 drivers/media/platform/mtk-isp/fd/mtk_fd_40.c |  555 ++++++++
 9 files changed, 3355 insertions(+)
 create mode 100644 drivers/media/platform/mtk-isp/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/fd/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd-dev.c
 create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd-dev.h
 create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd-hw.h
 create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd-smem.c
 create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd-smem.h
 create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd-v4l2.c
 create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd_40.c

diff --git a/drivers/media/platform/mtk-isp/Makefile b/drivers/media/platform/mtk-isp/Makefile
new file mode 100644
index 000000000000..5e3a9aa7f8b2
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/Makefile
@@ -0,0 +1,16 @@
+#
+# Copyright (C) 2018 MediaTek Inc.
+#
+# This program is free software: you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+# GNU General Public License for more details.
+#
+
+ifeq ($(CONFIG_VIDEO_MEDIATEK_FD_SUPPORT),y)
+obj-y += fd/
+endif
diff --git a/drivers/media/platform/mtk-isp/fd/Makefile b/drivers/media/platform/mtk-isp/fd/Makefile
new file mode 100644
index 000000000000..f2b64cf53da9
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/fd/Makefile
@@ -0,0 +1,25 @@
+#
+# Copyright (C) 2018 MediaTek Inc.
+#
+# This program is free software: you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+# GNU General Public License for more details.
+#
+$(info $(srctree))
+ccflags-y += -I$(srctree)/drivers/media/platform/mtk-mdp3
+
+obj-y += mtk_fd_40.o
+obj-y += mtk_fd-v4l2.o
+
+# To provide alloc context managing memory shared
+# between CPU and camera coprocessor
+obj-y += mtk_fd-smem.o
+
+# Utilits to provide frame-based streaming model
+# with v4l2 user interfaces
+obj-y += mtk_fd-dev.o
diff --git a/drivers/media/platform/mtk-isp/fd/mtk_fd-dev.c b/drivers/media/platform/mtk-isp/fd/mtk_fd-dev.c
new file mode 100644
index 000000000000..207e5d20ad46
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/fd/mtk_fd-dev.c
@@ -0,0 +1,754 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ * Author: Frederic Chen <frederic.chen@mediatek.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/platform_device.h>
+#include <media/videobuf2-dma-contig.h>
+#include "mtk_fd-dev.h"
+#include "mtk_fd-smem.h"
+#include "mtk-mdp3-regs.h"
+
+int mtk_fd_pipe_init(struct mtk_fd_pipe *fd_pipe,
+		     struct mtk_fd_dev *fd_dev,
+		     struct mtk_fd_pipe_desc *setting,
+		     struct media_device *media_dev,
+		     struct v4l2_device *v4l2_dev,
+		     struct mtk_fd_smem_dev *smem_alloc_dev)
+{
+	int ret, i;
+
+	fd_pipe->fd_dev = fd_dev;
+	fd_pipe->desc = setting;
+	fd_pipe->smem_alloc_dev = smem_alloc_dev;
+
+	atomic_set(&fd_pipe->pipe_job_sequence, 0);
+	spin_lock_init(&fd_pipe->job_lock);
+	mutex_init(&fd_pipe->lock);
+
+	dev_dbg(&fd_pipe->fd_dev->pdev->dev, "init pipe(%s,%d)\n",
+		fd_pipe->desc->name,
+		fd_pipe->desc->id);
+
+	fd_pipe->num_nodes = MTK_FD_VIDEO_NODE_ID_TOTAL_NUM;
+
+	for (i = 0; i < MTK_FD_VIDEO_NODE_ID_OUT_TOTAL_NUM; i++) {
+		fd_pipe->nodes[i].desc =
+			&fd_pipe->desc->output_queue_descs[i];
+		fd_pipe->nodes[i].immutable = 0;
+		fd_pipe->nodes[i].enabled =
+			fd_pipe->nodes[i].desc->default_enable;
+		atomic_set(&fd_pipe->nodes[i].sequence, 0);
+
+		dev_dbg(&fd_pipe->fd_dev->pdev->dev,
+			"%s: init node(%s,%d)\n",
+			fd_pipe->desc->name,
+			fd_pipe->nodes[i].desc->name, i);
+	}
+
+	for (i = MTK_FD_VIDEO_NODE_ID_OUT_TOTAL_NUM;
+	     i < MTK_FD_VIDEO_NODE_ID_TOTAL_NUM; i++) {
+		int cap_idx = i - MTK_FD_VIDEO_NODE_ID_OUT_TOTAL_NUM;
+
+		fd_pipe->nodes[i].desc =
+			&fd_pipe->desc->capture_queue_descs[cap_idx];
+		fd_pipe->nodes[i].immutable = 0;
+		fd_pipe->nodes[i].enabled =
+			fd_pipe->nodes[i].desc->default_enable;
+		atomic_set(&fd_pipe->nodes[i].sequence, 0);
+
+		dev_dbg(&fd_pipe->fd_dev->pdev->dev,
+			"%s: init node(%s,%d)\n",
+			fd_pipe->desc->name,
+			fd_pipe->nodes[i].desc->name, i);
+	}
+
+	if (fd_pipe->desc->master >= 0 &&
+	    fd_pipe->desc->master < MTK_FD_VIDEO_NODE_ID_TOTAL_NUM) {
+		fd_pipe->nodes[fd_pipe->desc->master].immutable = 1;
+		fd_pipe->nodes[fd_pipe->desc->master].enabled = 1;
+	}
+
+	ret = mtk_fd_pipe_v4l2_register(fd_pipe, media_dev, v4l2_dev);
+
+	if (ret) {
+		dev_err(&fd_pipe->fd_dev->pdev->dev,
+			"%s: failed(%d) to create V4L2 devices\n",
+			fd_pipe->desc->name, ret);
+		goto failed_pipe;
+	}
+
+	return 0;
+
+failed_pipe:
+	mutex_destroy(&fd_pipe->lock);
+	return ret;
+}
+
+static int mtk_fd_pipe_next_job_id(struct mtk_fd_pipe *fd_pipe)
+{
+	int global_job_id =
+		atomic_inc_return(&fd_pipe->pipe_job_sequence);
+
+	global_job_id =
+		(global_job_id & 0x0000FFFF) |
+		(fd_pipe->desc->id << 16);
+
+	return global_job_id;
+}
+
+int mtk_fd_pipe_init_job_infos(struct mtk_fd_pipe *fd_pipe)
+{
+	int i;
+
+	spin_lock(&fd_pipe->job_lock);
+
+	fd_pipe->num_pipe_job_infos = ARRAY_SIZE(fd_pipe->pipe_job_infos);
+	INIT_LIST_HEAD(&fd_pipe->pipe_job_running_list);
+	INIT_LIST_HEAD(&fd_pipe->pipe_job_free_list);
+
+	for (i = 0; i < fd_pipe->num_pipe_job_infos; i++) {
+		struct mtk_fd_pipe_job_info *pipe_job_info =
+			&fd_pipe->pipe_job_infos[i];
+		list_add_tail(&pipe_job_info->list,
+			      &fd_pipe->pipe_job_free_list);
+	}
+
+	spin_unlock(&fd_pipe->job_lock);
+
+	return 0;
+}
+
+static int
+mtk_fd_pipe_process_pipe_job_info(struct mtk_fd_pipe *fd_pipe,
+				  struct mtk_fd_pipe_job_info *pipe_job_info)
+{
+	spin_lock(&fd_pipe->job_lock);
+
+	list_del(&pipe_job_info->list);
+	list_add_tail(&pipe_job_info->list, &fd_pipe->pipe_job_running_list);
+
+	spin_unlock(&fd_pipe->job_lock);
+	return 0;
+}
+
+struct mtk_fd_pipe_job_info *
+mtk_fd_pipe_get_running_job_info(struct mtk_fd_pipe *fd_pipe,
+				 int pipe_job_id)
+{
+	struct mtk_fd_pipe_job_info *pipe_job_info = NULL;
+
+	spin_lock(&fd_pipe->job_lock);
+
+	list_for_each_entry(pipe_job_info,
+			    &fd_pipe->pipe_job_running_list, list) {
+		if (pipe_job_info->id == pipe_job_id) {
+			spin_unlock(&fd_pipe->job_lock);
+			return pipe_job_info;
+		}
+	}
+
+	spin_unlock(&fd_pipe->job_lock);
+
+	return NULL;
+}
+
+static int
+mtk_fd_pipe_free_job_info(struct mtk_fd_pipe *fd_pipe,
+			  struct mtk_fd_pipe_job_info *pipe_job_info)
+{
+	spin_lock(&fd_pipe->job_lock);
+
+	list_del(&pipe_job_info->list);
+	list_add_tail(&pipe_job_info->list, &fd_pipe->pipe_job_free_list);
+
+	spin_unlock(&fd_pipe->job_lock);
+
+	return 0;
+}
+
+static struct mtk_fd_pipe_job_info *
+mtk_fd_pipe_get_free_job_info(struct mtk_fd_pipe *fd_pipe)
+{
+	struct mtk_fd_pipe_job_info *pipe_job_info = NULL;
+
+	spin_lock(&fd_pipe->job_lock);
+	list_for_each_entry(pipe_job_info,
+			    &fd_pipe->pipe_job_free_list, list) {
+		dev_dbg(&fd_pipe->fd_dev->pdev->dev, "Found free pipe job\n");
+		spin_unlock(&fd_pipe->job_lock);
+		return pipe_job_info;
+	}
+	spin_unlock(&fd_pipe->job_lock);
+
+	dev_err(&fd_pipe->fd_dev->pdev->dev,
+		"%s: can't found free pipe job\n",
+		fd_pipe->desc->name);
+
+	return NULL;
+}
+
+static void
+mtk_fd_pipe_update_job_info(struct mtk_fd_pipe *fd_pipe,
+			    struct mtk_fd_pipe_job_info *pipe_job_info,
+			    struct mtk_fd_video_device *node,
+			    struct mtk_fd_dev_buffer *dev_buf)
+{
+	if (!pipe_job_info || !dev_buf || !node) {
+		dev_err(&fd_pipe->fd_dev->pdev->dev,
+			"%s: update pipe-job(%p) failed, buf(%p),node(%p)\n",
+			fd_pipe->desc->name,
+			pipe_job_info, dev_buf, node);
+		return;
+	}
+
+	if (pipe_job_info->buf_map[node->desc->id])
+		dev_dbg(&fd_pipe->fd_dev->pdev->dev,
+			"%s:%s: buf overwrite\n",
+			 fd_pipe->desc->name,
+			 node->desc->name);
+
+	if (node->desc->buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		pipe_job_info->num_img_capture_bufs++;
+
+	if (node->desc->buf_type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		pipe_job_info->num_img_output_bufs++;
+
+	if (node->desc->buf_type == V4L2_BUF_TYPE_META_OUTPUT)
+		pipe_job_info->num_meta_output_bufs++;
+
+	if (node->desc->buf_type == V4L2_BUF_TYPE_META_CAPTURE)
+		pipe_job_info->num_meta_capture_bufs++;
+
+	pipe_job_info->buf_map[node->desc->id] = dev_buf;
+
+	dev_dbg(&fd_pipe->fd_dev->pdev->dev,
+		"%s:%s: added buf(%p) to pipe-job(%p)\n",
+		fd_pipe->desc->name, node->desc->name, dev_buf,
+		pipe_job_info);
+}
+
+static void mtk_fd_pipe_debug_job(struct mtk_fd_pipe *fd_pipe,
+				  struct mtk_fd_pipe_job_info *pipe_job_info)
+{
+	int i;
+
+	if (!fd_pipe || !pipe_job_info)
+		return;
+
+	dev_dbg(&fd_pipe->fd_dev->pdev->dev,
+		"%s: pipe-job(%p),id(%d),req(%p)buf nums(%d,%d,%d,%d)\n",
+		fd_pipe->desc->name,
+		pipe_job_info,
+		pipe_job_info->id,
+		pipe_job_info->req,
+		pipe_job_info->num_img_capture_bufs,
+		pipe_job_info->num_img_output_bufs,
+		pipe_job_info->num_meta_capture_bufs,
+		pipe_job_info->num_meta_output_bufs);
+
+	for (i = 0; i < MTK_FD_VIDEO_NODE_ID_TOTAL_NUM ; i++) {
+		if (pipe_job_info->buf_map[i])
+			dev_dbg(&fd_pipe->fd_dev->pdev->dev,
+				"Node(%s,%d), buf(%p)\n",
+				fd_pipe->nodes[i].desc->name, i,
+				pipe_job_info->buf_map[i]);
+	}
+}
+
+int mtk_fd_pipe_job_finish(struct mtk_fd_pipe *fd_pipe,
+			   unsigned int pipe_job_info_id,
+			   enum vb2_buffer_state vbf_state)
+{
+	int i;
+	struct mtk_fd_pipe_job_info *job_info = NULL;
+	const int pipe_id =
+		mtk_fd_pipe_get_pipe_from_job_id(pipe_job_info_id);
+	u64 timestamp = 0;
+
+	if (!fd_pipe)
+		pr_err("%s: pipe-job id(%d) release failed, fd_pipe is null\n",
+		       __func__, pipe_job_info_id);
+
+	job_info = mtk_fd_pipe_get_running_job_info(fd_pipe,
+						    pipe_job_info_id);
+
+	if (!job_info) {
+		dev_err(&fd_pipe->fd_dev->pdev->dev,
+			"%s:%s: can't find pipe-job id(%d)\n",
+			__func__, fd_pipe->desc->name, pipe_id);
+		return -EINVAL;
+	}
+
+	timestamp = ktime_get_ns();
+
+	for (i = 0; i < MTK_FD_VIDEO_NODE_ID_TOTAL_NUM; i++) {
+		struct mtk_fd_dev_buffer *dev_buf = job_info->buf_map[i];
+
+		if (!dev_buf) {
+			continue;
+		} else {
+			dev_buf->vbb.vb2_buf.timestamp = ktime_get_ns();
+			mtk_fd_v4l2_buffer_done(&dev_buf->vbb.vb2_buf,
+						vbf_state);
+		}
+	}
+
+	mtk_fd_pipe_free_job_info(fd_pipe, job_info);
+
+	dev_dbg(&fd_pipe->fd_dev->pdev->dev,
+		"%s:%s: finish pipe-job, id(%d), vb state(%d)\n",
+		__func__, fd_pipe->desc->name, pipe_id,
+		pipe_job_info_id, vbf_state);
+
+	return 0;
+}
+
+static void mtk_fd_dev_buf_fill_info(struct mtk_fd_pipe *fd_pipe,
+				     struct mtk_fd_dev_buffer *dev_buf)
+{
+	struct vb2_v4l2_buffer *b;
+	struct mtk_fd_video_device *node;
+	struct mtk_fd_video_device_desc *desc;
+
+	b = &dev_buf->vbb;
+	node = mtk_fd_vbq_to_node(b->vb2_buf.vb2_queue);
+	desc = node->desc;
+	dev_buf->fmt = node->vdev_fmt;
+	dev_buf->dev_fmt = node->dev_q.dev_fmt;
+	dev_buf->isp_daddr =
+		vb2_dma_contig_plane_dma_addr(&b->vb2_buf, 0);
+	dev_buf->vaddr = vb2_plane_vaddr(&b->vb2_buf, 0);
+	dev_buf->buffer_usage = node->dev_q.buffer_usage;
+	dev_buf->rotation = node->dev_q.rotation;
+
+	if (desc->smem_alloc) {
+		dev_buf->scp_daddr =
+			mtk_fd_smem_iova_to_phys
+			(fd_pipe->smem_alloc_dev,
+			 dev_buf->isp_daddr);
+	} else {
+		dev_buf->scp_daddr = 0;
+	}
+
+	dev_dbg(&fd_pipe->fd_dev->pdev->dev,
+		"%s:%s: buf type(%d), idx(%d), mem(%d), isp_daddr(%p), scp_daddr(%p)\n",
+		fd_pipe->desc->name,
+		desc->name,
+		b->vb2_buf.type,
+		b->vb2_buf.index,
+		b->vb2_buf.memory,
+		dev_buf->isp_daddr,
+		dev_buf->scp_daddr);
+}
+
+int mtk_fd_pipe_queue_buffers(struct media_request *req,
+			      int initial)
+{
+	struct media_request_object *obj;
+	struct mtk_fd_pipe *fd_pipe;
+	struct mtk_fd_pipe_job_info *pipe_job_info = NULL;
+
+	list_for_each_entry(obj, &req->objects, list) {
+		struct vb2_buffer *vb;
+
+		if (vb2_request_object_is_buffer(obj)) {
+			struct mtk_fd_dev_buffer *buf;
+			struct mtk_fd_dev_buffer *dev_buf;
+			struct mtk_fd_video_device *node;
+
+			vb = container_of(obj, struct vb2_buffer, req_obj);
+			node = mtk_fd_vbq_to_node(vb->vb2_queue);
+			fd_pipe = vb2_get_drv_priv(vb->vb2_queue);
+			dev_buf = mtk_fd_vb2_buf_to_dev_buf(vb);
+			buf = dev_buf;
+
+			if (!pipe_job_info) {
+				pipe_job_info = mtk_fd_pipe_get_free_job_info
+					(fd_pipe);
+
+				if (!pipe_job_info)
+					goto FAILE_JOB_NOT_TRIGGER;
+
+				memset(pipe_job_info->buf_map, 0,
+				       sizeof(pipe_job_info->buf_map));
+				pipe_job_info->req = req;
+				pipe_job_info->num_img_capture_bufs = 0;
+				pipe_job_info->num_img_output_bufs = 0;
+				pipe_job_info->num_meta_capture_bufs = 0;
+				pipe_job_info->num_meta_output_bufs = 0;
+			}
+
+			mtk_fd_dev_buf_fill_info(fd_pipe,
+						 buf);
+
+			mtk_fd_pipe_update_job_info(fd_pipe,
+						    pipe_job_info,
+						     node,
+						     buf);
+		}
+	}
+
+	if (!pipe_job_info)
+		return -EINVAL;
+
+	pipe_job_info->id =
+		mtk_fd_pipe_next_job_id(fd_pipe);
+
+	mtk_fd_pipe_debug_job(fd_pipe, pipe_job_info);
+
+	mutex_lock(&fd_pipe->lock);
+
+	if (!fd_pipe->streaming) {
+		dev_dbg(&fd_pipe->fd_dev->pdev->dev,
+			"%s:%s:  stream is off, no hw enqueue triggered\n",
+			__func__, fd_pipe->desc->name);
+		mutex_unlock(&fd_pipe->lock);
+		return 0;
+	}
+
+	if (mtk_fd_pipe_process_pipe_job_info(fd_pipe, pipe_job_info)) {
+		dev_err(&fd_pipe->fd_dev->pdev->dev,
+			"%s:%s: can't start to run pipe job id(%d)\n",
+			__func__, fd_pipe->desc->name,
+			pipe_job_info->id);
+		mutex_unlock(&fd_pipe->lock);
+		goto FAILE_JOB_NOT_TRIGGER;
+	}
+
+	dev_dbg(&fd_pipe->fd_dev->pdev->dev,
+		"%s: trigger pipe job, id(%d)\n",
+		fd_pipe->desc->name,
+		fd_pipe->desc->id);
+
+	if (mtk_fd_pipe_job_start(fd_pipe, pipe_job_info)) {
+		mutex_unlock(&fd_pipe->lock);
+		goto FAILE_JOB_NOT_TRIGGER;
+	}
+
+	mutex_unlock(&fd_pipe->lock);
+
+	return 0;
+
+FAILE_JOB_NOT_TRIGGER:
+	if (initial)
+		return 0;
+
+	mtk_fd_pipe_job_finish(fd_pipe, pipe_job_info->id,
+			       VB2_BUF_STATE_ERROR);
+
+	return -EINVAL;
+}
+
+int mtk_fd_pipe_release(struct mtk_fd_pipe *fd_pipe)
+{
+	mtk_fd_pipe_v4l2_unregister(fd_pipe);
+	mutex_destroy(&fd_pipe->lock);
+
+	return 0;
+}
+
+static void set_img_fmt(struct v4l2_pix_format_mplane *mfmt_to_fill,
+			struct mtk_fd_dev_format *dev_fmt)
+{
+	int i;
+
+	mfmt_to_fill->pixelformat = dev_fmt->fmt.img.pixelformat;
+	mfmt_to_fill->num_planes = dev_fmt->fmt.img.num_planes;
+	mfmt_to_fill->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	mfmt_to_fill->quantization = V4L2_QUANTIZATION_DEFAULT;
+	mfmt_to_fill->colorspace = dev_fmt->fmt.img.colorspace;
+
+	memset(mfmt_to_fill->reserved, 0, sizeof(mfmt_to_fill->reserved));
+
+	pr_debug("%s: Fmt(%d),w(%d),h(%d),f(%d)\n",
+		 __func__,
+		 mfmt_to_fill->pixelformat,
+		 mfmt_to_fill->width,
+		 mfmt_to_fill->height,
+		 mfmt_to_fill->field);
+
+	for (i = 0 ; i < mfmt_to_fill->num_planes; ++i) {
+		int bpl = (mfmt_to_fill->width *
+			dev_fmt->fmt.img.row_depth[i]) / 8;
+		int sizeimage = (mfmt_to_fill->width * mfmt_to_fill->height *
+			dev_fmt->fmt.img.depth[i]) / 8;
+
+		mfmt_to_fill->plane_fmt[i].bytesperline = bpl;
+		mfmt_to_fill->plane_fmt[i].sizeimage = sizeimage;
+		memset(mfmt_to_fill->plane_fmt[i].reserved,
+		       0, sizeof(mfmt_to_fill->plane_fmt[i].reserved));
+
+		pr_debug("plane(%d):bpl(%d),sizeimage(%u)\n",
+			 i, bpl,
+			 mfmt_to_fill->plane_fmt[i].sizeimage);
+	}
+}
+
+static void set_meta_fmt(struct v4l2_meta_format *metafmt_to_fill,
+			 struct mtk_fd_dev_format *dev_fmt)
+{
+	metafmt_to_fill->dataformat = dev_fmt->fmt.meta.dataformat;
+
+	if (dev_fmt->fmt.meta.max_buffer_size <= 0) {
+		pr_debug("Invalid meta buf size(%u), use default(%u)\n",
+			 dev_fmt->fmt.meta.max_buffer_size,
+			 MTK_FD_DEV_META_BUF_DEFAULT_SIZE);
+		metafmt_to_fill->buffersize = MTK_FD_DEV_META_BUF_DEFAULT_SIZE;
+	} else {
+		pr_debug("Use meta size(%u)\n",
+			 dev_fmt->fmt.meta.max_buffer_size);
+		metafmt_to_fill->buffersize = dev_fmt->fmt.meta.max_buffer_size;
+	}
+}
+
+void mtk_fd_pipe_load_default_fmt(struct mtk_fd_pipe *fd_pipe,
+				  struct mtk_fd_video_device *node,
+				  struct v4l2_format *fmt_to_fill)
+{
+	struct mtk_fd_dev_format *dev_fmt;
+	struct mtk_fd_video_device_desc *desc = node->desc;
+
+	if (desc->num_fmts == 0) {
+		pr_err("%s:%s: desc->num_fmts is 0, no format support list\n",
+		       __func__, desc->name);
+		return;
+	}
+
+	if (desc->default_fmt_idx >= desc->num_fmts) {
+		pr_debug("%s:%s: invalid idx(%d), must < num_fmts(%d)\n",
+			 __func__, desc->name, desc->default_fmt_idx,
+			desc->num_fmts);
+		desc->default_fmt_idx = 0;
+	}
+
+	dev_fmt	= &desc->fmts[desc->default_fmt_idx];
+	fmt_to_fill->type = desc->buf_type;
+	if (mtk_fd_buf_is_meta(desc->buf_type)) {
+		set_meta_fmt(&fmt_to_fill->fmt.meta, dev_fmt);
+	} else {
+		fmt_to_fill->fmt.pix_mp.width = desc->default_width;
+		fmt_to_fill->fmt.pix_mp.height = desc->default_height;
+		fmt_to_fill->fmt.pix_mp.field = V4L2_FIELD_NONE;
+
+		set_img_fmt(&fmt_to_fill->fmt.pix_mp, dev_fmt);
+	}
+}
+
+struct mtk_fd_dev_format *
+mtk_fd_pipe_find_fmt(struct mtk_fd_pipe *fd_pipe,
+		     struct mtk_fd_video_device *node,
+		     u32 format)
+{
+	int i;
+	struct mtk_fd_dev_format *dev_fmt;
+
+	struct mtk_fd_video_device_desc *desc = node->desc;
+
+	dev_dbg(&fd_pipe->fd_dev->pdev->dev, "fmt to find(%x)\n", format);
+
+	for (i = 0; i < desc->num_fmts; i++) {
+		dev_fmt = &desc->fmts[i];
+		if (!mtk_fd_buf_is_meta(desc->buf_type)) {
+			if (dev_fmt->fmt.img.pixelformat == format)
+				return dev_fmt;
+		} else {
+			if (dev_fmt->fmt.meta.dataformat == format)
+				return dev_fmt;
+		}
+	}
+
+	return NULL;
+}
+
+int mtk_fd_pipe_set_meta_fmt(struct mtk_fd_pipe *fd_pipe,
+			     struct mtk_fd_video_device *node,
+			     struct v4l2_meta_format *user_fmt,
+			     struct v4l2_meta_format *node_fmt)
+{
+	struct mtk_fd_dev_format *dev_fmt;
+
+	if (!user_fmt || !node_fmt)
+		return -EINVAL;
+
+	dev_fmt = mtk_fd_pipe_find_fmt(fd_pipe, node,
+				       user_fmt->dataformat);
+
+	if (!dev_fmt)
+		return -EINVAL;
+
+	node->dev_q.dev_fmt = dev_fmt;
+	set_meta_fmt(node_fmt, dev_fmt);
+	*user_fmt = *node_fmt;
+
+	return 0;
+}
+
+int mtk_fd_pipe_set_img_fmt(struct mtk_fd_pipe *fd_pipe,
+			    struct mtk_fd_video_device *node,
+			    struct v4l2_pix_format_mplane *user_fmt,
+			    struct v4l2_pix_format_mplane *dest_fmt)
+{
+	struct mtk_fd_dev_format *dev_fmt;
+
+	if (!user_fmt || !dest_fmt)
+		return -EINVAL;
+
+	dev_fmt = mtk_fd_pipe_find_fmt(fd_pipe, node,
+				       user_fmt->pixelformat);
+
+	if (!dev_fmt) {
+		pr_debug("%s:%s:%s: dev_fmt(%d) not found\n",
+			 __func__, fd_pipe->desc->name,
+			 node->desc->name, user_fmt->pixelformat);
+		return -EINVAL;
+	}
+
+	node->dev_q.dev_fmt = dev_fmt;
+	dest_fmt->width = user_fmt->width;
+	dest_fmt->height = user_fmt->height;
+	dest_fmt->field = V4L2_FIELD_NONE;
+
+	set_img_fmt(dest_fmt, dev_fmt);
+
+	return 0;
+}
+
+int mtk_fd_pipe_streamon(struct mtk_fd_pipe *fd_pipe)
+{
+	struct mtk_fd_dev *fd_dev;
+
+	if (!fd_pipe)
+		return -EINVAL;
+
+	fd_dev = dev_get_drvdata(&fd_pipe->fd_dev->pdev->dev);
+
+	mutex_lock(&fd_pipe->lock);
+	fd_pipe->streaming = 1;
+	mutex_unlock(&fd_pipe->lock);
+
+	dev_dbg(&fd_pipe->fd_dev->pdev->dev,
+		"%s:%s:%d: start stream\n",
+		__func__, fd_pipe->desc->name,
+		fd_pipe->desc->id);
+
+	return 0;
+}
+
+int mtk_fd_pipe_streamoff(struct mtk_fd_pipe *fd_pipe)
+{
+	struct mtk_fd_dev *fd_dev;
+
+	if (!fd_pipe)
+		return -EINVAL;
+
+	fd_dev = dev_get_drvdata(&fd_pipe->fd_dev->pdev->dev);
+
+	mutex_lock(&fd_pipe->lock);
+	fd_pipe->streaming = 0;
+	mutex_unlock(&fd_pipe->lock);
+
+	dev_dbg(&fd_pipe->fd_dev->pdev->dev,
+		"%s:%s:%d: stop stream\n",
+		__func__, fd_pipe->desc->name,
+		fd_pipe->desc->id);
+
+	return 0;
+}
+
+int mtk_fd_pipe_job_start(struct mtk_fd_pipe *fd_pipe,
+			  struct mtk_fd_pipe_job_info *pipe_job_info)
+{
+	struct platform_device *pdev = fd_pipe->fd_dev->pdev;
+	int ret;
+	struct fd_hw_param fd_param;
+	struct mtk_fd_dev_buffer *dev_buf_yuv_in = NULL;
+	struct mtk_fd_dev_buffer *dev_buf_meta_in = NULL;
+	struct mtk_fd_dev_buffer *dev_buf_meta_out = NULL;
+
+	if (!pipe_job_info) {
+		dev_err(&pdev->dev,
+			"pipe_job_info(%p) in start can't be NULL\n",
+			pipe_job_info);
+		return -EINVAL;
+	}
+
+	/* We need all the 3 buffers to trigger a FD job */
+	if (!pipe_job_info->buf_map[MTK_FD_VIDEO_NODE_ID_YUV_OUT] ||
+	    !pipe_job_info->buf_map[MTK_FD_VIDEO_NODE_ID_CONFIG_OUT] ||
+	    !pipe_job_info->buf_map[MTK_FD_VIDEO_NODE_ID_CAPTURE]){
+		struct mtk_fd_dev_buffer **map = pipe_job_info->buf_map;
+
+		dev_dbg(&pdev->dev,
+			"can't trigger job: yuv_out(%p), config_out(%p), capture(%p)\n",
+			map[MTK_FD_VIDEO_NODE_ID_YUV_OUT],
+			map[MTK_FD_VIDEO_NODE_ID_CONFIG_OUT],
+			map[MTK_FD_VIDEO_NODE_ID_CAPTURE]);
+		return -EINVAL;
+	}
+
+	dev_dbg(&pdev->dev,
+		"%s:%s: pipe-job id(%d)\n",
+		__func__, fd_pipe->desc->name,
+		pipe_job_info->id);
+
+	memset(&fd_param, 0, sizeof(struct fd_hw_param));
+	fd_param.frame_id = pipe_job_info->id;
+
+	/* yuv_out buffer */
+	dev_buf_yuv_in = pipe_job_info->buf_map[MTK_FD_VIDEO_NODE_ID_YUV_OUT];
+	if (dev_buf_yuv_in) {
+		fd_param.src_img.iova =	(uint32_t)dev_buf_yuv_in->isp_daddr;
+		fd_param.src_img.va = (uint64_t)dev_buf_yuv_in->vaddr;
+		fd_param.src_img_h =
+			(uint16_t)dev_buf_yuv_in->fmt.fmt.pix_mp.height;
+		fd_param.src_img_w =
+			(uint16_t)dev_buf_yuv_in->fmt.fmt.pix_mp.width;
+	}
+
+	/* config_out */
+	dev_buf_meta_in =
+		pipe_job_info->buf_map[MTK_FD_VIDEO_NODE_ID_CONFIG_OUT];
+	if (dev_buf_meta_in) {
+		fd_param.fd_user_param.va = (uint64_t)dev_buf_meta_in->vaddr;
+		fd_param.fd_user_param.pa =
+			(uint32_t)dev_buf_meta_in->scp_daddr;
+		fd_param.fd_user_param.iova =
+			(uint32_t)dev_buf_meta_in->isp_daddr;
+	}
+
+	/* capture */
+	dev_buf_meta_out =
+		pipe_job_info->buf_map[MTK_FD_VIDEO_NODE_ID_CAPTURE];
+	if (dev_buf_meta_out) {
+		fd_param.fd_user_result.va = (uint64_t)dev_buf_meta_out->vaddr;
+		fd_param.fd_user_result.pa =
+			(uint32_t)dev_buf_meta_out->scp_daddr;
+		fd_param.fd_user_result.iova =
+			(uint32_t)dev_buf_meta_out->isp_daddr;
+	}
+
+	dev_dbg(&pdev->dev, "%s:%s: Send pipe job(%d) to fd hw\n",
+		__func__, fd_pipe->desc->name, pipe_job_info->id);
+
+	ret = mtk_fd_hw_job_exec(&fd_pipe->fd_dev->fd_hw, &fd_param);
+
+	if (ret) {
+		dev_dbg(&pdev->dev,
+			"%s:%s: enqueue job(%d) to HW failed(%d)\n",
+			 __func__, fd_pipe->desc->name, pipe_job_info->id, ret);
+		return -EBUSY;
+	}
+
+	return ret;
+}
diff --git a/drivers/media/platform/mtk-isp/fd/mtk_fd-dev.h b/drivers/media/platform/mtk-isp/fd/mtk_fd-dev.h
new file mode 100644
index 000000000000..c13627f2bac4
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/fd/mtk_fd-dev.h
@@ -0,0 +1,315 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ * Author: Frederic Chen <frederic.chen@mediatek.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef _MTK_FD_DEV_H_
+#define _MTK_FD_DEV_H_
+
+#include <linux/types.h>
+#include <linux/platform_device.h>
+#include <media/v4l2-device.h>
+#include <media/videobuf2-v4l2.h>
+
+#include "mtk_fd-hw.h"
+#include "mtk_fd-smem.h"
+
+#define MTK_FD_PIPE_ID_STREAM_0				0
+#define MTK_FD_PIPE_ID_STREAM_1				1
+#define MTK_FD_PIPE_ID_TOTAL_NUM			2
+
+#define MTK_FD_VIDEO_NODE_ID_YUV_OUT			0
+#define MTK_FD_VIDEO_NODE_ID_CONFIG_OUT			1
+#define MTK_FD_VIDEO_NODE_ID_OUT_TOTAL_NUM		2
+#define MTK_FD_VIDEO_NODE_ID_CAPTURE			2
+#define MTK_FD_VIDEO_NODE_ID_CAPTURE_TOTAL_NUM		1
+#define MTK_FD_VIDEO_NODE_ID_TOTAL_NUM \
+	(MTK_FD_VIDEO_NODE_ID_OUT_TOTAL_NUM + \
+	MTK_FD_VIDEO_NODE_ID_CAPTURE_TOTAL_NUM)
+
+#define MTK_FD_VIDEO_NODE_ID_NO_MASTER			-1
+
+#define MTK_FD_OUTPUT_MIN_WIDTH				2U
+#define MTK_FD_OUTPUT_MIN_HEIGHT			2U
+#define MTK_FD_OUTPUT_MAX_WIDTH				5376U
+#define MTK_FD_OUTPUT_MAX_HEIGHT			4032U
+#define MTK_FD_CAPTURE_MIN_WIDTH			2U
+#define MTK_FD_CAPTURE_MIN_HEIGHT			2U
+#define MTK_FD_CAPTURE_MAX_WIDTH			5376U
+#define MTK_FD_CAPTURE_MAX_HEIGHT			4032U
+
+#define MTK_FD_PIPE_MEDIA_MODEL_NAME	"MTK-FD-V4L2"
+#define MTK_FD_PIPE_NAME_STREAM_0	MTK_FD_PIPE_MEDIA_MODEL_NAME
+#define MTK_FD_PIPE_NAME_STREAM_1	"MTK-FD-V4L2-STREAM-1"
+
+#define MTK_FD_DEV_META_BUF_DEFAULT_SIZE		(1110 * 1024)
+
+/*
+ * Supported format and the information used for
+ * size calculation
+ */
+struct mtk_fd_dev_meta_format {
+	u32 dataformat;
+	u32 max_buffer_size;
+	u8 flags;
+};
+
+/* MDP part private format definitation */
+struct mtk_fd_dev_mdp_format {
+	u32 pixelformat;
+	u32 mdp_color;
+	u32 colorspace;
+	u8 depth[VIDEO_MAX_PLANES];
+	u8 row_depth[VIDEO_MAX_PLANES];
+	u8 num_planes;
+	u8 walign;
+	u8 halign;
+	u8 salign;
+	u32 flags;
+};
+
+struct mtk_fd_dev_format {
+	union {
+		struct mtk_fd_dev_meta_format meta;
+		struct mtk_fd_dev_mdp_format img;
+	} fmt;
+};
+
+struct mtk_fd_pipe_job_info {
+	struct media_request *req;
+	int id;
+	struct mtk_fd_dev_buffer*
+		buf_map[MTK_FD_VIDEO_NODE_ID_TOTAL_NUM];
+	int num_img_capture_bufs;
+	int num_img_output_bufs;
+	int num_meta_capture_bufs;
+	int num_meta_output_bufs;
+	struct list_head list;
+};
+
+struct mtk_fd_dev_buffer {
+	struct vb2_v4l2_buffer vbb;
+	struct v4l2_format fmt;
+	struct mtk_fd_dev_format *dev_fmt;
+	int pipe_job_id;
+	void *vaddr;
+	dma_addr_t isp_daddr;
+	dma_addr_t scp_daddr;
+	unsigned int buffer_usage;
+	int rotation;
+	struct list_head list;
+};
+
+struct mtk_fd_pipe_desc {
+	char *name;
+	int master;
+	int id;
+	struct mtk_fd_video_device_desc *output_queue_descs;
+	int total_output_queues;
+	struct mtk_fd_video_device_desc *capture_queue_descs;
+	int total_capture_queues;
+};
+
+struct mtk_fd_video_device_desc {
+	int id;
+	char *name;
+	u32 buf_type;
+	u32 cap;
+	int smem_alloc;
+	int dynamic;
+	int default_enable;
+	struct mtk_fd_dev_format *fmts;
+	int num_fmts;
+	char *description;
+	int default_width;
+	int default_height;
+	const struct v4l2_ioctl_ops *ops;
+	int default_fmt_idx;
+};
+
+struct mtk_fd_dev_queue {
+	struct vb2_queue vbq;
+	/* Serializes vb2 queue and video device operations */
+	struct mutex lock;
+	struct mtk_fd_dev_format *dev_fmt;
+	/* Firmware uses buffer_usage to select suitable DMA ports */
+	unsigned int buffer_usage;
+	int rotation;
+};
+
+struct mtk_fd_video_device {
+	struct video_device vdev;
+	struct mtk_fd_dev_queue dev_q;
+	struct v4l2_format vdev_fmt;
+	struct media_pad vdev_pad;
+	struct v4l2_mbus_framefmt pad_fmt;
+	int immutable;
+	int enabled;
+	struct mtk_fd_video_device_desc *desc;
+	atomic_t sequence;
+};
+
+struct mtk_fd_pipe {
+	struct mtk_fd_dev *fd_dev;
+	struct mtk_fd_video_device nodes[MTK_FD_VIDEO_NODE_ID_TOTAL_NUM];
+	int num_nodes;
+	int streaming;
+	struct media_pad *subdev_pads;
+	struct media_pipeline pipeline;
+	struct v4l2_subdev subdev;
+	struct v4l2_subdev_fh *fh;
+	struct mtk_fd_smem_dev *smem_alloc_dev;
+	atomic_t pipe_job_sequence;
+	struct mtk_fd_pipe_job_info pipe_job_infos[VB2_MAX_FRAME];
+	int num_pipe_job_infos;
+	struct list_head pipe_job_running_list;
+	struct list_head pipe_job_free_list;
+	/* Serializes pipe's stream on/off and buffers enqueue operations */
+	struct mutex lock;
+	spinlock_t job_lock; /* protect the pipe job list */
+	struct mtk_fd_pipe_desc *desc;
+};
+
+struct mtk_fd_dev {
+	struct platform_device *pdev;
+	struct media_device mdev;
+	struct v4l2_device v4l2_dev;
+	struct mtk_fd_pipe fd_pipe[MTK_FD_PIPE_ID_TOTAL_NUM];
+	struct mtk_fd_smem_dev smem_alloc_dev;
+	struct mtk_fd_hw fd_hw;
+};
+
+int mtk_fd_dev_media_register(struct device *dev,
+			      struct media_device *media_dev,
+			      const char *model);
+
+int mtk_fd_dev_v4l2_init(struct mtk_fd_dev *fd_dev);
+
+void mtk_fd_dev_v4l2_release(struct mtk_fd_dev *fd_dev);
+
+int mtk_fd_dev_v4l2_register(struct device *dev,
+			     struct media_device *media_dev,
+			     struct v4l2_device *v4l2_dev);
+
+int mtk_fd_pipe_v4l2_register(struct mtk_fd_pipe *fd_pipe,
+			      struct media_device *media_dev,
+			      struct v4l2_device *v4l2_dev);
+
+int mtk_fd_pipe_v4l2_unregister(struct mtk_fd_pipe *fd_pipe);
+
+void mtk_fd_v4l2_buffer_done(struct vb2_buffer *vb,
+			     enum vb2_buffer_state state);
+
+int mtk_fd_pipe_queue_buffers(struct media_request *req, int initial);
+
+int mtk_fd_pipe_init(struct mtk_fd_pipe *fd_pipe,
+		     struct mtk_fd_dev *fd_dev,
+		     struct mtk_fd_pipe_desc *setting,
+		     struct media_device *media_dev,
+		     struct v4l2_device *v4l2_dev,
+		     struct mtk_fd_smem_dev *smem_alloc_dev);
+
+int mtk_fd_pipe_release(struct mtk_fd_pipe *fd_pipe);
+
+int mtk_fd_pipe_job_finish(struct mtk_fd_pipe *fd_pipe,
+			   unsigned int pipe_job_info_id,
+			   enum vb2_buffer_state state);
+
+int mtk_fd_pipe_job_start(struct mtk_fd_pipe *fd_pipe,
+			  struct mtk_fd_pipe_job_info *pipe_job_info);
+
+int mtk_fd_pipe_init_job_infos(struct mtk_fd_pipe *fd_pipe);
+
+struct mtk_fd_dev_format *
+mtk_fd_pipe_find_fmt(struct mtk_fd_pipe *fd_pipe,
+		     struct mtk_fd_video_device *node,
+		     u32 format);
+
+int mtk_fd_pipe_set_img_fmt(struct mtk_fd_pipe *fd_pipe,
+			    struct mtk_fd_video_device *node,
+			    struct v4l2_pix_format_mplane *user_fmt,
+			    struct v4l2_pix_format_mplane *node_fmt);
+
+int mtk_fd_pipe_set_meta_fmt(struct mtk_fd_pipe *fd_pipe,
+			     struct mtk_fd_video_device *node,
+			     struct v4l2_meta_format *user_fmt,
+			     struct v4l2_meta_format *node_fmt);
+
+void mtk_fd_pipe_load_default_fmt(struct mtk_fd_pipe *fd_pipe,
+				  struct mtk_fd_video_device *node,
+				  struct v4l2_format *fmt_to_fill);
+
+int mtk_fd_pipe_streamon(struct mtk_fd_pipe *fd_pipe);
+
+int mtk_fd_pipe_streamoff(struct mtk_fd_pipe *fd_pipe);
+
+static inline struct mtk_fd_video_device *
+mtk_fd_file_to_node(struct file *file)
+{
+	return container_of(video_devdata(file),
+			    struct mtk_fd_video_device, vdev);
+}
+
+static inline struct mtk_fd_pipe *
+mtk_fd_subdev_to_pipe(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct mtk_fd_pipe, subdev);
+}
+
+static inline struct mtk_fd_video_device *
+mtk_fd_vbq_to_node(struct vb2_queue *vq)
+{
+	return container_of(vq, struct mtk_fd_video_device, dev_q.vbq);
+}
+
+static inline struct mtk_fd_dev_buffer *
+mtk_fd_vb2_buf_to_dev_buf(struct vb2_buffer *vb)
+{
+	return container_of(vb, struct mtk_fd_dev_buffer, vbb.vb2_buf);
+}
+
+static inline struct mtk_fd_dev *mtk_fd_hw_to_dev(struct mtk_fd_hw *fd_hw)
+{
+	return container_of(fd_hw, struct mtk_fd_dev, fd_hw);
+}
+
+static inline struct mtk_fd_hw *get_fd_hw_device(struct device *dev)
+{
+	struct mtk_fd_dev *drv_data =
+		dev_get_drvdata(dev);
+	if (drv_data)
+		return &drv_data->fd_hw;
+	else
+		return NULL;
+}
+
+static inline int mtk_fd_buf_is_meta(u32 type)
+{
+	return type == V4L2_BUF_TYPE_META_CAPTURE ||
+		type == V4L2_BUF_TYPE_META_OUTPUT;
+}
+
+static inline int mtk_fd_pipe_get_pipe_from_job_id(int pipe_job_id)
+{
+	return (pipe_job_id >> 16) & 0x0000FFFF;
+}
+
+static inline struct mtk_fd_pipe *
+mtk_fd_dev_get_pipe(struct mtk_fd_dev *fd_dev, unsigned int pipe_id)
+{
+	if (pipe_id < 0 && pipe_id >= MTK_FD_PIPE_ID_TOTAL_NUM)
+		return NULL;
+	return &fd_dev->fd_pipe[pipe_id];
+}
+
+#endif /* _MTK_FD_DEV_H_ */
diff --git a/drivers/media/platform/mtk-isp/fd/mtk_fd-hw.h b/drivers/media/platform/mtk-isp/fd/mtk_fd-hw.h
new file mode 100644
index 000000000000..40e09d66c479
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/fd/mtk_fd-hw.h
@@ -0,0 +1,158 @@
+/* SPDX-License-Identifier: GPL-2.0
+ * Copyright (C) 2015 MediaTek Inc.
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef __MTK_FD_HW_H__
+#define __MTK_FD_HW_H__
+
+#include <linux/io.h>
+#define SIG_ERESTARTSYS 512
+
+#define FD_WR32(v, a) \
+do { \
+	__raw_writel((v), (void __force __iomem *)((a))); \
+	mb(); /* ensure written */ \
+} while (0)
+
+#define FD_RD32(addr) ioread32((void *)addr)
+
+#define FD_INT_EN		0x15c
+#define FD_INT			0x168
+#define FD_RESULT		0x178
+#define FD_IRQ_MASK		0x001
+
+#define RS_BUF_SIZE_MAX		2288788
+#define VA_OFFSET		0xffff000000000000
+
+#define MTK_FD_MAX_NO		1024
+#define MAX_FACE_SEL_NUM	(MTK_FD_MAX_NO + 2)
+
+/* The max number of face sizes could be detected, for feature scaling */
+#define FACE_SIZE_NUM_MAX	14
+
+/* FACE_SIZE_NUM_MAX + 1, first scale for input image W/H */
+#define FD_SCALE_NUM		15
+
+/* Number of Learning data sets */
+#define LEARNDATA_NUM		18
+
+#define mtk_fd_us_to_jiffies(us) \
+	((((unsigned long)(us) / 1000) * HZ + 512) >> 10)
+
+enum fd_irq {
+	FD_IRQ_IDX = 0,
+	FD_IRQ_IDX_NUM
+};
+
+enum fd_state {
+	FD_INI,
+	FD_ENQ,
+	FD_CBD,
+};
+
+enum stream_stat {
+	STREAM_OFF,
+	STREAM_ON,
+};
+
+struct fd_buffer {
+	__u64 va;	/* used by APMCU access */
+	__u32 pa;	/* used by CM4 access */
+	__u32 iova;	/* used by HW access */
+} __packed;
+
+struct ipi_fd_enq_param {
+	u8 source_img_fmt;
+	struct fd_buffer output_addr;
+	struct fd_buffer src_y;
+	struct fd_buffer src_uv;
+	struct fd_buffer config_addr;
+} __packed;
+
+struct fd_manager_ctx {
+	struct fd_buffer learn_data_buf[2][LEARNDATA_NUM];
+	struct fd_buffer fd_config;
+	struct fd_buffer rs_config;
+	struct fd_buffer fd_result;
+	struct fd_buffer rs_result;
+	struct fd_buffer src_img;
+} __packed;
+
+enum fd_img_format {
+	FMT_VYUY = 2,
+	FMT_UYVY,
+	FMT_YVYU,
+	FMT_YUYV,
+};
+
+enum fd_scp_cmd {
+	FD_CMD_INIT,
+	FD_CMD_ENQ,
+	FD_CMD_EXIT,
+};
+
+struct fd_face_result {
+	__u64 face_idx:12, type:1, x0:10, y0:10, x1:10, y1:10,
+		fcv:18, rip_dir:4, rop_dir:3, det_size:5;
+};
+
+struct fd_user_output {
+	struct fd_face_result face[MAX_FACE_SEL_NUM];
+	__u16 face_number;
+};
+
+struct fd_hw_param {
+	u32 frame_id;
+	u16 src_img_h;
+	u16 src_img_w;
+	struct fd_buffer src_img;
+	struct fd_buffer fd_user_param;
+	struct fd_buffer fd_user_result;
+} __packed;
+
+struct ipi_message {
+	u8 cmd_id;
+	union {
+		struct fd_buffer fd_manager;
+		struct fd_hw_param fd_param;
+	};
+} __packed;
+
+struct mtk_fd_hw {
+	dev_t fd_devno;
+	struct device *larb_dev;
+	struct clk *fd_clk;
+	enum fd_state state;
+	wait_queue_head_t wq;
+	u32 fd_irq_result;
+	void __iomem *fd_base;
+	struct sg_table sgtable;
+	struct platform_device *scp_pdev;
+	struct rproc *rproc_handle;
+	atomic_t fd_user_cnt;
+	/* Ensure only one job in hw */
+	struct mutex fd_hw_lock;
+
+};
+
+int mtk_fd_hw_job_exec(struct mtk_fd_hw *fd_hw,
+		       struct fd_hw_param *fd_param);
+
+int mtk_fd_hw_connect(struct mtk_fd_hw *fd_hw);
+
+int mtk_fd_hw_disconnect(struct mtk_fd_hw *fd_hw);
+
+int mtk_fd_hw_streamon(struct mtk_fd_hw *fd_hw);
+
+int mtk_fd_hw_streamoff(struct mtk_fd_hw *fd_hw);
+
+#endif/*__MTK_FD_HW_H__*/
diff --git a/drivers/media/platform/mtk-isp/fd/mtk_fd-smem.c b/drivers/media/platform/mtk-isp/fd/mtk_fd-smem.c
new file mode 100644
index 000000000000..ed37b672a539
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/fd/mtk_fd-smem.c
@@ -0,0 +1,322 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ * Author: Frederic Chen <frederic.chen@mediatek.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/dma-contiguous.h>
+#include <linux/dma-mapping.h>
+#include <linux/slab.h>
+#include <linux/err.h>
+#include <linux/iommu.h>
+#include <asm/cacheflush.h>
+#include "mtk_fd-smem.h"
+
+#define MTK_FD_SMEM_DEV_NAME "MTK-FD-SMEM"
+
+static struct reserved_mem *fd_reserved_smem;
+static struct dma_map_ops smem_dma_ops;
+
+struct dma_coherent_mem {
+	void		*virt_base;
+	dma_addr_t	device_base;
+	unsigned long	pfn_base;
+	int		size;
+	int		flags;
+	unsigned long	*bitmap;
+	spinlock_t	spinlock; /* protect dma_coherent_mem member */
+	bool		use_dev_dma_pfn_offset;
+};
+
+static struct dma_coherent_mem *dev_get_coherent_memory(struct device *dev)
+{
+	if (dev && dev->dma_mem)
+		return dev->dma_mem;
+	return NULL;
+}
+
+phys_addr_t mtk_fd_smem_iova_to_phys(struct mtk_fd_smem_dev *smem_dev,
+				     dma_addr_t iova)
+{
+		struct iommu_domain *smem_dom;
+		phys_addr_t addr;
+		phys_addr_t limit;
+
+		if (!smem_dev)
+			return 0;
+
+		smem_dom = iommu_get_domain_for_dev(smem_dev->dev.parent);
+
+		if (!smem_dom)
+			return 0;
+
+		addr = iommu_iova_to_phys(smem_dom, iova);
+
+		limit = smem_dev->smem_base + smem_dev->smem_size;
+
+		if (addr < smem_dev->smem_base || addr >= limit) {
+			dev_err(&smem_dev->dev,
+				"Unexpected scp_daddr %pa (must >= %pa and <%pa)\n",
+				&addr, &smem_dev->smem_base, &limit);
+			return 0;
+		}
+		dev_dbg(&smem_dev->dev, "Pa verifcation pass: %pa(>=%pa, <%pa)\n",
+			&addr, &smem_dev->smem_base, &limit);
+		return addr;
+}
+
+/********************************************
+ * MTK FD SMEM DMA ops *
+ ********************************************/
+static int mtk_fd_smem_get_sgtable(struct device *dev,
+				   struct sg_table *sgt,
+				    void *cpu_addr,
+				    dma_addr_t dma_addr,
+				    size_t size, unsigned long attrs)
+{
+	struct mtk_fd_smem_dev *smem_dev = dev_get_drvdata(dev);
+	int n_pages_align;
+	int size_align;
+	int page_start;
+	unsigned long long offset_p;
+
+	phys_addr_t paddr = mtk_fd_smem_iova_to_phys(smem_dev, dma_addr);
+
+	offset_p = (unsigned long long)paddr -
+		(unsigned long long)smem_dev->smem_base;
+
+	dev_dbg(dev, "%s: dma_addr(%p), cpu_addr(%p), pa(%p), size(%d)\n",
+		__func__, dma_addr, cpu_addr, paddr, size);
+
+	size_align = round_up(size, PAGE_SIZE);
+	n_pages_align = size_align >> PAGE_SHIFT;
+	page_start = offset_p >> PAGE_SHIFT;
+
+	dev_dbg(dev, "%s: page_start(%d), page pa(%p), pa(%p), aligned size(%d)\n",
+		__func__,
+		page_start,
+		page_to_phys(*(smem_dev->smem_pages + page_start)),
+		paddr,
+		size_align
+		);
+
+	if (!smem_dev) {
+		dev_err(dev, "can't get sgtable from smem_dev\n");
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "%s: get sgt of the smem: %d pages\n", __func__,
+		n_pages_align);
+
+	return sg_alloc_table_from_pages(sgt,
+					 smem_dev->smem_pages + page_start,
+					 n_pages_align,
+					 0, size_align, GFP_KERNEL);
+}
+
+static void *mtk_fd_smem_get_cpu_addr(struct mtk_fd_smem_dev *smem_dev,
+				      struct scatterlist *sg)
+{
+	struct device *dev = &smem_dev->dev;
+	struct dma_coherent_mem *dma_mem =
+		dev_get_coherent_memory(dev);
+
+	phys_addr_t addr = (phys_addr_t)sg_phys(sg);
+
+	if (addr < smem_dev->smem_base ||
+	    addr > smem_dev->smem_base + smem_dev->smem_size) {
+		dev_err(dev, "%s: Invalid paddr %p from sg\n", __func__, addr);
+		return NULL;
+	}
+
+	return dma_mem->virt_base + (addr - smem_dev->smem_base);
+}
+
+static void mtk_fd_smem_sync_sg_for_cpu(struct device *dev,
+					struct scatterlist *sgl,
+					 int nelems,
+					 enum dma_data_direction dir)
+{
+	struct mtk_fd_smem_dev *smem_dev =
+		dev_get_drvdata(dev);
+	void *cpu_addr;
+
+	cpu_addr = mtk_fd_smem_get_cpu_addr(smem_dev, sgl);
+
+	dev_dbg(dev, "%s: paddr(%p),vaddr(%p),size(%d)\n",
+		__func__, sg_phys(sgl), cpu_addr, sgl->length);
+
+	if (cpu_addr)
+		__dma_unmap_area(cpu_addr, sgl->length, dir);
+}
+
+static void mtk_fd_smem_sync_sg_for_device(struct device *dev,
+					   struct scatterlist *sgl,
+					    int nelems,
+					    enum dma_data_direction dir)
+{
+	struct mtk_fd_smem_dev *smem_dev =
+			dev_get_drvdata(dev);
+	void *cpu_addr;
+
+	cpu_addr = mtk_fd_smem_get_cpu_addr(smem_dev, sgl);
+
+	dev_dbg(dev, "%s: pa(%p),va(%p),size(%d),dir(%d)\n",
+		__func__, sg_phys(sgl), cpu_addr, sgl->length, dir);
+
+	if (cpu_addr)
+		__dma_map_area(cpu_addr, sgl->length, dir);
+}
+
+static int mtk_fd_smem_setup_dma_ops(struct device *dev,
+				     struct device *default_alloc_dev)
+{
+	memcpy((void *)&smem_dma_ops, default_alloc_dev->dma_ops,
+	       sizeof(smem_dma_ops));
+
+	smem_dma_ops.get_sgtable =
+		mtk_fd_smem_get_sgtable;
+	smem_dma_ops.sync_sg_for_device =
+		mtk_fd_smem_sync_sg_for_device;
+	smem_dma_ops.sync_sg_for_cpu =
+		mtk_fd_smem_sync_sg_for_cpu;
+
+	dev->dma_ops = &smem_dma_ops;
+
+	dev_dbg(dev, "setup smem_dma_ops: %p\n", dev->dma_ops);
+
+	return 0;
+}
+
+void mtk_fd_smem_alloc_dev_release(struct mtk_fd_smem_dev *smem_dev)
+{
+	device_unregister(&smem_dev->dev);
+}
+
+int mtk_fd_smem_alloc_dev_init(struct mtk_fd_smem_dev *smem_dev,
+			       struct device *parent)
+{
+	int ret;
+	struct device *dev = &smem_dev->dev;
+
+	dev->parent  = parent;
+	dev_set_name(&smem_dev->dev, "fd-smem");
+
+	ret = device_register(dev);
+
+	if (ret)
+		dev_err(parent, "Failed to register smem device\n");
+
+	dev_dbg(dev, "init alloc dev(%p), parent(%p)\n", dev, dev->parent);
+
+	dev_set_drvdata(dev, smem_dev);
+
+	if (fd_reserved_smem) {
+		dma_addr_t dma_addr;
+		phys_addr_t addr;
+		struct iommu_domain *smem_dom;
+		int i;
+		int size_align;
+		struct page **pages;
+		int n_pages;
+		struct sg_table *sgt = &smem_dev->sgt;
+
+		size_align = round_down(fd_reserved_smem->size, PAGE_SIZE);
+		n_pages = size_align >> PAGE_SHIFT;
+		pages = kmalloc_array(n_pages, sizeof(struct page *),
+				      GFP_KERNEL);
+
+		if (!pages)
+			return -ENOMEM;
+
+		for (i = 0; i < n_pages; i++)
+			pages[i] = phys_to_page(fd_reserved_smem->base
+						+ i * PAGE_SIZE);
+
+		ret = sg_alloc_table_from_pages(sgt, pages, n_pages, 0,
+						size_align, GFP_KERNEL);
+
+		if (ret) {
+			dev_err(dev, "failed to get alloca sg table\n");
+			return -ENOMEM;
+		}
+
+		dma_map_sg_attrs(parent, sgt->sgl, sgt->nents,
+				 DMA_BIDIRECTIONAL,
+				 DMA_ATTR_SKIP_CPU_SYNC);
+
+		dma_addr = sg_dma_address(sgt->sgl);
+		smem_dom = iommu_get_domain_for_dev(parent);
+		addr = iommu_iova_to_phys(smem_dom, dma_addr);
+
+		if (addr != fd_reserved_smem->base)
+			dev_warn(dev,
+				 "incorrect pa(%p) from iommu_iova_to_phys, should be %p\n",
+				 addr, fd_reserved_smem->base);
+
+		ret = dma_declare_coherent_memory(dev,
+						  fd_reserved_smem->base,
+						  dma_addr, size_align,
+						  DMA_MEMORY_EXCLUSIVE);
+
+		dev_dbg(dev, "Coherent mem base(%p,%p),size(%lx),ret(%d)\n",
+			fd_reserved_smem->base, dma_addr, size_align, ret);
+
+		smem_dev->smem_base = fd_reserved_smem->base;
+		smem_dev->smem_size = size_align;
+		smem_dev->smem_pages = pages;
+		smem_dev->num_smem_pages = n_pages;
+		smem_dev->smem_dma_base = dma_addr;
+
+		dev_dbg(dev, "smem_dev setting (%p,%lx,%p,%d)\n",
+			smem_dev->smem_base, smem_dev->smem_size,
+			smem_dev->smem_pages, smem_dev->num_smem_pages);
+	}
+
+	ret = mtk_fd_smem_setup_dma_ops(dev, parent);
+
+	return ret;
+}
+
+static int __init mtk_fd_smem_dma_setup(struct reserved_mem *rmem)
+{
+	unsigned long node = rmem->fdt_node;
+
+	if (of_get_flat_dt_prop(node, "reusable", NULL))
+		return -EINVAL;
+
+	if (!of_get_flat_dt_prop(node, "no-map", NULL)) {
+		pr_err("Reserved memory: regions without no-map are not yet supported\n");
+		return -EINVAL;
+	}
+
+	fd_reserved_smem = rmem;
+
+	pr_debug("Reserved memory: created DMA memory pool at %pa, size %ld MiB\n",
+		 &rmem->base, (unsigned long)rmem->size / SZ_1M);
+	return 0;
+}
+
+RESERVEDMEM_OF_DECLARE(mtk_fd_smem,
+		       "mediatek,reserve-memory-fd_smem",
+		       mtk_fd_smem_dma_setup);
+
+MODULE_AUTHOR("Frederic Chen <frederic.chen@mediatek.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Mediatek Camera FD shared memory alloc device");
+
diff --git a/drivers/media/platform/mtk-isp/fd/mtk_fd-smem.h b/drivers/media/platform/mtk-isp/fd/mtk_fd-smem.h
new file mode 100644
index 000000000000..758a4ab68ec2
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/fd/mtk_fd-smem.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ * Author: Frederic Chen <frederic.chen@mediatek.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef _MTK_FD_SMEM_H_
+#define _MTK_FD_SMEM_H_
+
+#include <linux/dma-mapping.h>
+#include <linux/device.h>
+
+struct mtk_fd_smem_dev {
+	struct device dev;
+	struct sg_table sgt;
+	struct page **smem_pages;
+	int num_smem_pages;
+	phys_addr_t smem_base;
+	dma_addr_t smem_dma_base;
+	int smem_size;
+};
+
+phys_addr_t mtk_fd_smem_iova_to_phys(struct mtk_fd_smem_dev *smem_dev,
+				     dma_addr_t iova);
+int mtk_fd_smem_alloc_dev_init(struct mtk_fd_smem_dev *smem_dev,
+			       struct device *default_alloc_dev);
+void mtk_fd_smem_alloc_dev_release(struct mtk_fd_smem_dev *smem_dev);
+
+#endif /*_MTK_FD_SMEM_H_*/
+
diff --git a/drivers/media/platform/mtk-isp/fd/mtk_fd-v4l2.c b/drivers/media/platform/mtk-isp/fd/mtk_fd-v4l2.c
new file mode 100644
index 000000000000..7f9b08b8ec81
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/fd/mtk_fd-v4l2.c
@@ -0,0 +1,1171 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ * Author: Frederic Chen <frederic.chen@mediatek.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#include <linux/platform_device.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/videobuf2-v4l2.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-ctrls.h>
+#include "mtk_fd-dev.h"
+#include "mtk_fd-hw.h"
+#include "mtk-mdp3-regs.h"
+
+static int mtk_fd_subdev_open(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_fh *fh)
+{
+	struct mtk_fd_pipe *fd_pipe = mtk_fd_subdev_to_pipe(sd);
+	struct mtk_fd_dev *fd_dev =
+		dev_get_drvdata(&fd_pipe->fd_dev->pdev->dev);
+
+	dev_dbg(&fd_pipe->fd_dev->pdev->dev,
+		"%s:%s: pipe(%d) connects to fd_hw\n",
+		__func__, fd_pipe->desc->name,
+		fd_pipe->desc->id);
+
+	fd_pipe->fh = fh;
+
+	mtk_fd_pipe_init_job_infos(fd_pipe);
+
+	return mtk_fd_hw_connect(&fd_dev->fd_hw);
+}
+
+static int mtk_fd_subdev_close(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_fh *fh)
+{
+	struct mtk_fd_pipe *fd_pipe = mtk_fd_subdev_to_pipe(sd);
+	struct mtk_fd_dev *fd_dev =
+		dev_get_drvdata(&fd_pipe->fd_dev->pdev->dev);
+
+	dev_dbg(&fd_pipe->fd_dev->pdev->dev,
+		"%s:%s: pipe(%d) disconnect to fd_hw\n",
+		__func__, fd_pipe->desc->name,
+		fd_pipe->desc->id);
+
+	return mtk_fd_hw_disconnect(&fd_dev->fd_hw);
+}
+
+static int mtk_fd_subdev_s_stream(struct v4l2_subdev *sd,
+				  int enable)
+{
+	struct mtk_fd_pipe *fd_pipe = mtk_fd_subdev_to_pipe(sd);
+	int ret;
+
+	if (enable)
+		ret = mtk_fd_pipe_streamon(fd_pipe);
+	else
+		ret = mtk_fd_pipe_streamoff(fd_pipe);
+
+	return ret;
+}
+
+static int mtk_fd_link_setup(struct media_entity *entity,
+			     const struct media_pad *local,
+			     const struct media_pad *remote, u32 flags)
+{
+	struct mtk_fd_pipe *fd_pipe =
+		container_of(entity, struct mtk_fd_pipe, subdev.entity);
+	u32 pad = local->index;
+
+	dev_dbg(&fd_pipe->fd_dev->pdev->dev,
+		"%s: link setup, flags(0x%x), (%s)%d -->(%s)%d\n",
+		fd_pipe->desc->name,
+		flags,
+		local->entity->name,
+		local->index,
+		remote->entity->name,
+		remote->index);
+
+	WARN_ON(entity->obj_type != MEDIA_ENTITY_TYPE_V4L2_SUBDEV);
+
+	WARN_ON(pad >= fd_pipe->num_nodes);
+
+	fd_pipe->nodes[pad].enabled = !!(flags & MEDIA_LNK_FL_ENABLED);
+
+	return 0;
+}
+
+static int mtk_fd_vb2_buf_prepare(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
+
+	v4l2_buf->field = V4L2_FIELD_NONE;
+	return 0;
+}
+
+static int mtk_fd_vb2_buf_out_validate(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
+
+	v4l2_buf->field = V4L2_FIELD_NONE;
+
+	return 0;
+}
+
+static void mtk_fd_vb2_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
+
+	v4l2_buf->field = V4L2_FIELD_NONE;
+}
+
+static int mtk_fd_vb2_queue_setup(struct vb2_queue *vq,
+				  unsigned int *num_buffers,
+				  unsigned int *num_planes,
+				  unsigned int sizes[],
+				  struct device *alloc_devs[])
+{
+	struct mtk_fd_pipe *fd_pipe = vb2_get_drv_priv(vq);
+	struct mtk_fd_video_device *node =
+		mtk_fd_vbq_to_node(vq);
+	struct device *dev = &fd_pipe->fd_dev->pdev->dev;
+	struct device *buf_alloc_ctx;
+
+	/* Get V4L2 format with the following method */
+	const struct v4l2_format *fmt = &node->vdev_fmt;
+	unsigned int size;
+
+	*num_buffers = clamp_val(*num_buffers, 1, VB2_MAX_FRAME);
+
+	if (node->desc->smem_alloc) {
+		buf_alloc_ctx = &fd_pipe->smem_alloc_dev->dev;
+		dev_dbg(dev, "%s:%s: select smem_vb2_alloc_ctx(%p)\n",
+			fd_pipe->desc->name,
+			node->desc->name,
+			buf_alloc_ctx);
+	} else {
+		buf_alloc_ctx = &fd_pipe->fd_dev->pdev->dev;
+		dev_dbg(dev, "%s:%s: select default_vb2_alloc_ctx(%p)\n",
+			fd_pipe->desc->name,
+			node->desc->name,
+			buf_alloc_ctx);
+	}
+
+	alloc_devs[0] = buf_alloc_ctx;
+
+	if (vq->type == V4L2_BUF_TYPE_META_CAPTURE ||
+	    vq->type == V4L2_BUF_TYPE_META_OUTPUT)
+		size = fmt->fmt.meta.buffersize;
+	else
+		size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
+
+	if (*num_planes) {
+		if (sizes[0] < size) {
+			dev_dbg(dev, "%s:%s:%s: size error(user:%d, max:%d)\n",
+				__func__, fd_pipe->desc->name,
+				node->desc->name, sizes[0], size);
+			return -EINVAL;
+		}
+	} else {
+		*num_planes = 1;
+		sizes[0] = size;
+	}
+
+	dev_dbg(dev, "%s:%s:%s: n_planes(%d), n_bufs(%d), size(%d)\n",
+		__func__, fd_pipe->desc->name,
+		node->desc->name, *num_planes, *num_buffers, sizes[0]);
+
+	return 0;
+}
+
+static int
+	mtk_fd_all_nodes_streaming(struct mtk_fd_pipe *fd_pipe,
+				   struct mtk_fd_video_device *except)
+{
+	int i;
+
+	for (i = 0; i < fd_pipe->num_nodes; i++) {
+		struct mtk_fd_video_device *node = &fd_pipe->nodes[i];
+
+		if (node == except)
+			continue;
+		if (node->enabled &&
+		    !vb2_start_streaming_called(&node->dev_q.vbq))
+			return 0;
+	}
+
+	return 1;
+}
+
+static void mtk_fd_return_all_buffers(struct mtk_fd_pipe *fd_pipe,
+				      struct mtk_fd_video_device *node,
+				      enum vb2_buffer_state state)
+{
+	int i;
+
+	for (i = 0; i < node->dev_q.vbq.num_buffers; i++) {
+		if (node->dev_q.vbq.bufs[i]->state ==
+			VB2_BUF_STATE_ACTIVE)
+			vb2_buffer_done(node->dev_q.vbq.bufs[i],
+					state);
+	}
+}
+
+static int mtk_fd_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
+{
+	struct mtk_fd_pipe *fd_pipe = vb2_get_drv_priv(vq);
+	struct mtk_fd_video_device *node =
+		mtk_fd_vbq_to_node(vq);
+	int ret;
+
+	dev_dbg(&fd_pipe->fd_dev->pdev->dev,
+		"%s:%s:%s\n",
+		fd_pipe->desc->name, node->desc->name,
+		__func__);
+
+	if (!node->enabled) {
+		dev_err(&fd_pipe->fd_dev->pdev->dev,
+			"%s:%s: stream on failed, node is not enabled\n",
+			fd_pipe->desc->name, node->desc->name);
+		ret = -EINVAL;
+		goto fail_return_bufs;
+	}
+
+	ret = media_pipeline_start(&node->vdev.entity, &fd_pipe->pipeline);
+
+	if (ret < 0) {
+		dev_err(&fd_pipe->fd_dev->pdev->dev,
+			"%s:%s: media_pipeline_start failed(%d)\n",
+			fd_pipe->desc->name, node->desc->name,
+			ret);
+		goto fail_return_bufs;
+	}
+
+	if (!mtk_fd_all_nodes_streaming(fd_pipe, node))
+		return 0;
+
+	/* Start streaming of the whole pipeline */
+	ret = v4l2_subdev_call(&fd_pipe->subdev, video, s_stream, 1);
+	if (ret < 0) {
+		dev_err(&fd_pipe->fd_dev->pdev->dev,
+			"%s:%s: sub dev s_stream(1) failed(%d)\n",
+			fd_pipe->desc->name, node->desc->name,
+			ret);
+		goto fail_stop_pipeline;
+	}
+	return 0;
+
+fail_stop_pipeline:
+	media_pipeline_stop(&node->vdev.entity);
+fail_return_bufs:
+	mtk_fd_return_all_buffers(fd_pipe, node, VB2_BUF_STATE_QUEUED);
+
+	return ret;
+}
+
+static void mtk_fd_vb2_stop_streaming(struct vb2_queue *vq)
+{
+	struct mtk_fd_pipe *fd_pipe = vb2_get_drv_priv(vq);
+	struct mtk_fd_video_device *node =
+		mtk_fd_vbq_to_node(vq);
+	int ret;
+
+	WARN_ON(!node->enabled);
+
+	dev_dbg(&fd_pipe->fd_dev->pdev->dev,
+		"%s:%s:%s\n",
+		fd_pipe->desc->name, node->desc->name,
+		__func__);
+
+	if (mtk_fd_all_nodes_streaming(fd_pipe, node)) {
+		ret = v4l2_subdev_call(&fd_pipe->subdev, video, s_stream, 0);
+
+	if (ret)
+		dev_err(&fd_pipe->fd_dev->pdev->dev,
+			"%s:%s: sub dev s_stream(0) failed(%d)\n",
+			fd_pipe->desc->name, node->desc->name,
+			ret);
+	}
+
+	mtk_fd_return_all_buffers(fd_pipe, node, VB2_BUF_STATE_ERROR);
+	media_pipeline_stop(&node->vdev.entity);
+}
+
+static void mtk_fd_vb2_request_complete(struct vb2_buffer *vb)
+{
+	struct mtk_fd_video_device *node =
+		mtk_fd_vbq_to_node(vb->vb2_queue);
+
+	v4l2_ctrl_request_complete(vb->req_obj.req,
+				   node->vdev.ctrl_handler);
+}
+
+static int mtk_fd_videoc_querycap(struct file *file, void *fh,
+				  struct v4l2_capability *cap)
+{
+	struct mtk_fd_pipe *fd_pipe = video_drvdata(file);
+
+	strlcpy(cap->driver, fd_pipe->desc->name,
+		sizeof(cap->driver));
+	strlcpy(cap->card, fd_pipe->desc->name,
+		sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info),
+		 "platform:%s", dev_name(fd_pipe->fd_dev->mdev.dev));
+
+	return 0;
+}
+
+static int mtk_fd_videoc_try_fmt(struct file *file,
+				 void *fh,
+				 struct v4l2_format *f)
+{
+	struct mtk_fd_pipe *fd_pipe = video_drvdata(file);
+	struct mtk_fd_video_device *node = mtk_fd_file_to_node(file);
+	struct v4l2_format try_fmt;
+	int ret;
+
+	memset(&try_fmt, 0, sizeof(try_fmt));
+
+	try_fmt.type = node->dev_q.vbq.type;
+
+	ret = mtk_fd_pipe_set_img_fmt(fd_pipe, node, &f->fmt.pix_mp,
+				      &try_fmt.fmt.pix_mp);
+
+	if (ret)
+		mtk_fd_pipe_load_default_fmt(fd_pipe, node, &try_fmt);
+
+	*f = try_fmt;
+
+	return 0;
+}
+
+static int mtk_fd_videoc_g_fmt(struct file *file, void *fh,
+			       struct v4l2_format *f)
+{
+	struct mtk_fd_video_device *node = mtk_fd_file_to_node(file);
+
+	*f = node->vdev_fmt;
+
+	return 0;
+}
+
+static int mtk_fd_videoc_s_fmt(struct file *file, void *fh,
+			       struct v4l2_format *f)
+{
+	struct mtk_fd_video_device *node = mtk_fd_file_to_node(file);
+	struct mtk_fd_pipe *fd_pipe = video_drvdata(file);
+
+	int ret;
+
+	if (fd_pipe->streaming)
+		return -EBUSY;
+
+	ret = mtk_fd_videoc_try_fmt(file, fh, f);
+
+	if (!ret)
+		node->vdev_fmt = *f;
+
+	return 0;
+}
+
+static int mtk_fd_videoc_enum_framesizes(struct file *file,
+					 void *priv,
+					 struct v4l2_frmsizeenum *sizes)
+{
+	struct mtk_fd_pipe *fd_pipe = video_drvdata(file);
+	struct mtk_fd_video_device *node = mtk_fd_file_to_node(file);
+	struct mtk_fd_dev_format *dev_fmt;
+
+	dev_fmt = mtk_fd_pipe_find_fmt(fd_pipe, node, sizes->pixel_format);
+
+	if (!dev_fmt || sizes->index)
+		return -EINVAL;
+
+	sizes->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
+
+	if (V4L2_TYPE_IS_OUTPUT(node->desc->buf_type)) {
+		sizes->stepwise.max_width = MTK_FD_OUTPUT_MAX_WIDTH;
+		sizes->stepwise.min_width = MTK_FD_OUTPUT_MIN_WIDTH;
+		sizes->stepwise.max_height = MTK_FD_OUTPUT_MAX_HEIGHT;
+		sizes->stepwise.min_height = MTK_FD_OUTPUT_MIN_HEIGHT;
+		sizes->stepwise.step_height = 1;
+		sizes->stepwise.step_width = 1;
+	} else {
+		sizes->stepwise.max_width = MTK_FD_CAPTURE_MAX_WIDTH;
+		sizes->stepwise.min_width = MTK_FD_CAPTURE_MIN_WIDTH;
+		sizes->stepwise.max_height = MTK_FD_CAPTURE_MAX_HEIGHT;
+		sizes->stepwise.min_height = MTK_FD_CAPTURE_MIN_HEIGHT;
+		sizes->stepwise.step_height = 1;
+		sizes->stepwise.step_width = 1;
+	}
+
+	return 0;
+}
+
+static int mtk_fd_videoc_enum_fmt(struct file *file, void *fh,
+				  struct v4l2_fmtdesc *f)
+{
+	struct mtk_fd_video_device *node = mtk_fd_file_to_node(file);
+
+	if (f->index > node->desc->num_fmts ||
+	    f->type != node->dev_q.vbq.type)
+		return -EINVAL;
+
+	strscpy(f->description, node->desc->description,
+		sizeof(f->description));
+
+	f->pixelformat = node->desc->fmts[f->index].fmt.img.pixelformat;
+	f->flags = 0;
+
+	return 0;
+}
+
+static int mtk_fd_meta_enum_format(struct file *file,
+				   void *fh, struct v4l2_fmtdesc *f)
+{
+	struct mtk_fd_video_device *node = mtk_fd_file_to_node(file);
+
+	if (f->index > 0 || f->type != node->dev_q.vbq.type)
+		return -EINVAL;
+
+	strscpy(f->description, node->desc->description,
+		sizeof(f->description));
+
+	f->pixelformat = node->vdev_fmt.fmt.meta.dataformat;
+
+	return 0;
+}
+
+static int mtk_fd_videoc_g_meta_fmt(struct file *file,
+				    void *fh, struct v4l2_format *f)
+{
+	struct mtk_fd_video_device *node = mtk_fd_file_to_node(file);
+	*f = node->vdev_fmt;
+
+	return 0;
+}
+
+static int
+mtk_fd_vidioc_subscribe_event(struct v4l2_fh *fh,
+			      const struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_CTRL:
+		return v4l2_ctrl_subscribe_event(fh, sub);
+	default:
+		return -EINVAL;
+	}
+}
+
+/******************** function pointers ********************/
+
+/* subdev internal operations */
+static const struct v4l2_subdev_internal_ops mtk_fd_subdev_internal_ops = {
+	.open = mtk_fd_subdev_open,
+	.close = mtk_fd_subdev_close,
+};
+
+static const struct v4l2_subdev_video_ops mtk_fd_subdev_video_ops = {
+	.s_stream = mtk_fd_subdev_s_stream,
+};
+
+static const struct v4l2_subdev_ops mtk_fd_subdev_ops = {
+	.video = &mtk_fd_subdev_video_ops,
+};
+
+static const struct media_entity_operations mtk_fd_media_ops = {
+	.link_setup = mtk_fd_link_setup,
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static int mtk_fd_request_buf_validate(struct media_request *req,
+				       int all_enable_node_need_buf)
+{
+	struct media_request_object *obj;
+	struct mtk_fd_pipe *fd_pipe;
+	struct mtk_fd_pipe *fd_dev_first;
+	struct vb2_buffer *vbs[MTK_FD_VIDEO_NODE_ID_TOTAL_NUM] = {};
+	int count = 0;
+
+	if (!all_enable_node_need_buf)
+		return	vb2_request_validate(req);
+
+	list_for_each_entry(obj, &req->objects, list) {
+		struct vb2_buffer *vb;
+
+		if (vb2_request_object_is_buffer(obj)) {
+			struct mtk_fd_video_device *node;
+
+			vb = container_of(obj, struct vb2_buffer, req_obj);
+			node = mtk_fd_vbq_to_node(vb->vb2_queue);
+			fd_pipe = vb2_get_drv_priv(vb->vb2_queue);
+			vbs[node->desc->id] = vb;
+
+			if (count == 0)
+				fd_dev_first = fd_pipe;
+
+			if (fd_dev_first != fd_pipe) {
+				pr_err("Req(%p):found buf of different pipes(%p,%p)",
+				       req, fd_dev_first, fd_pipe);
+				return -EINVAL;
+			}
+		}
+	}
+
+	if (!fd_pipe) {
+		pr_debug("No fd pipe found for the request\n");
+		return -EINVAL;
+	}
+
+	for (count = 0; count < MTK_FD_VIDEO_NODE_ID_TOTAL_NUM; count++) {
+		if (fd_pipe->nodes[count].enabled) {
+			pr_debug("Node(%d:%s): vb(0x%x)\n",
+				 count, fd_pipe->nodes[count].desc->name,
+				 vbs[count]);
+
+			if (!vbs[count]) {
+				pr_debug("Node(%s) enable and no buf enqueue\n",
+					 fd_pipe->nodes[count].desc->name);
+				return -EINVAL;
+			}
+		}
+	}
+
+	dev_dbg(&fd_pipe->fd_dev->pdev->dev,
+		"%s:%s: all bufs found, ready for req(%p) enqueue\n",
+		__func__, fd_pipe->desc->name, req);
+
+	return vb2_request_validate(req);
+}
+
+static int mtk_fd_vb2_request_validate(struct media_request *req)
+{
+	return mtk_fd_request_buf_validate(req, 0);
+}
+
+static void mtk_fd_vb2_request_queue(struct media_request *req)
+{
+	vb2_request_queue(req);
+	mtk_fd_pipe_queue_buffers(req, 0);
+}
+
+static const struct media_device_ops mtk_fd_media_req_ops = {
+	.req_validate = mtk_fd_vb2_request_validate,
+	.req_queue = mtk_fd_vb2_request_queue,
+};
+
+static const struct vb2_ops mtk_fd_vb2_ops = {
+	.buf_queue = mtk_fd_vb2_buf_queue,
+	.queue_setup = mtk_fd_vb2_queue_setup,
+	.buf_prepare  = mtk_fd_vb2_buf_prepare,
+	.buf_out_validate = mtk_fd_vb2_buf_out_validate,
+	.start_streaming = mtk_fd_vb2_start_streaming,
+	.stop_streaming = mtk_fd_vb2_stop_streaming,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+	.buf_request_complete = mtk_fd_vb2_request_complete,
+};
+
+static const struct v4l2_file_operations mtk_fd_v4l2_fops = {
+	.unlocked_ioctl = video_ioctl2,
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release,
+	.poll = vb2_fop_poll,
+	.mmap = vb2_fop_mmap,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl32 = v4l2_compat_ioctl32,
+#endif
+};
+
+static void mtk_fd_node_to_v4l2(struct mtk_fd_pipe *fd_pipe,
+				u32 idx,
+				 struct video_device *vdev,
+				 struct v4l2_format *f)
+{
+	struct mtk_fd_video_device *node = &fd_pipe->nodes[idx];
+
+	vdev->ioctl_ops = node->desc->ops;
+	vdev->device_caps = V4L2_CAP_STREAMING | node->desc->cap;
+	f->type = node->desc->buf_type;
+	mtk_fd_pipe_load_default_fmt(fd_pipe, node, f);
+}
+
+int mtk_fd_dev_media_register(struct device *dev,
+			      struct media_device *media_dev,
+			      const char *model)
+{
+	int ret = 0;
+
+	media_dev->dev = dev;
+	dev_dbg(dev, "setup media_dev.dev: %p\n",
+		media_dev->dev);
+
+	strlcpy(media_dev->model, model,
+		sizeof(media_dev->model));
+	dev_dbg(dev, "setup media_dev.model: %s\n",
+		media_dev->model);
+
+	snprintf(media_dev->bus_info, sizeof(media_dev->bus_info),
+		 "platform:%s", dev_name(dev));
+	dev_dbg(dev, "setup media_dev.bus_info: %s\n",
+		media_dev->bus_info);
+
+	media_dev->hw_revision = 0;
+	dev_dbg(dev, "setup media_dev.hw_revision: %d\n",
+		media_dev->hw_revision);
+
+	media_dev->ops = &mtk_fd_media_req_ops;
+
+	dev_dbg(dev, "media_device_init: media_dev:%p\n",
+		media_dev);
+	media_device_init(media_dev);
+
+	pr_debug("Register media device: %s, %p",
+		 media_dev->model,
+		media_dev);
+
+	ret = media_device_register(media_dev);
+
+	if (ret) {
+		dev_err(dev, "failed to register media device (%d)\n", ret);
+		goto fail_media_dev;
+	}
+	return 0;
+
+fail_media_dev:
+	media_device_unregister(media_dev);
+	media_device_cleanup(media_dev);
+
+	return ret;
+}
+
+int mtk_fd_dev_v4l2_register(struct device *dev,
+			     struct media_device *media_dev,
+			     struct v4l2_device *v4l2_dev)
+{
+	int ret = 0;
+	/* Set up v4l2 device */
+	v4l2_dev->mdev = media_dev;
+	dev_dbg(dev, "setup v4l2_dev->mdev: %p",
+		v4l2_dev->mdev);
+	v4l2_dev->ctrl_handler = NULL;
+	dev_dbg(dev, "setup v4l2_dev->ctrl_handler: %p",
+		v4l2_dev->ctrl_handler);
+
+	pr_debug("Register v4l2 device: %p",
+		 v4l2_dev);
+
+	ret = v4l2_device_register(dev, v4l2_dev);
+
+	if (ret) {
+		dev_err(dev, "failed to register V4L2 device (%d)\n", ret);
+		goto fail_v4l2_dev;
+	}
+
+	return 0;
+
+fail_v4l2_dev:
+	media_device_unregister(media_dev);
+	media_device_cleanup(media_dev);
+
+	return ret;
+}
+
+int mtk_fd_pipe_v4l2_register(struct mtk_fd_pipe *fd_pipe,
+			      struct media_device *media_dev,
+			      struct v4l2_device *v4l2_dev)
+{
+	int i, ret;
+
+	/* Initialize miscellaneous variables */
+	fd_pipe->streaming = 0;
+
+	/* Initialize subdev media entity */
+	fd_pipe->subdev_pads = kcalloc(fd_pipe->num_nodes,
+				       sizeof(*fd_pipe->subdev_pads),
+					GFP_KERNEL);
+	if (!fd_pipe->subdev_pads) {
+		ret = -ENOMEM;
+		goto fail_subdev_pads;
+	}
+
+	ret = media_entity_pads_init(&fd_pipe->subdev.entity,
+				     fd_pipe->num_nodes,
+				     fd_pipe->subdev_pads);
+	if (ret) {
+		dev_err(&fd_pipe->fd_dev->pdev->dev,
+			"failed initialize subdev media entity (%d)\n", ret);
+		goto fail_media_entity;
+	}
+
+	/* Initialize subdev */
+	v4l2_subdev_init(&fd_pipe->subdev, &mtk_fd_subdev_ops);
+
+	fd_pipe->subdev.entity.function =
+		MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
+
+	fd_pipe->subdev.entity.ops = &mtk_fd_media_ops;
+
+	for (i = 0; i < fd_pipe->num_nodes; i++) {
+		struct mtk_fd_video_device_desc *desc =
+			fd_pipe->nodes[i].desc;
+
+		fd_pipe->subdev_pads[i].flags =
+			V4L2_TYPE_IS_OUTPUT(desc->buf_type) ?
+			MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
+	}
+
+	fd_pipe->subdev.flags =
+		V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
+	snprintf(fd_pipe->subdev.name, sizeof(fd_pipe->subdev.name),
+		 "%s", fd_pipe->desc->name);
+	v4l2_set_subdevdata(&fd_pipe->subdev, fd_pipe);
+	fd_pipe->subdev.ctrl_handler = NULL;
+	fd_pipe->subdev.internal_ops = &mtk_fd_subdev_internal_ops;
+
+	dev_dbg(&fd_pipe->fd_dev->pdev->dev,
+		"register subdev: %s, ctrl_handler %p\n",
+		 fd_pipe->subdev.name, fd_pipe->subdev.ctrl_handler);
+	ret = v4l2_device_register_subdev(&fd_pipe->fd_dev->v4l2_dev,
+					  &fd_pipe->subdev);
+	if (ret) {
+		dev_err(&fd_pipe->fd_dev->pdev->dev,
+			"failed initialize subdev (%d)\n", ret);
+		goto fail_subdev;
+	}
+
+	ret = v4l2_device_register_subdev_nodes(&fd_pipe->fd_dev->v4l2_dev);
+	if (ret) {
+		dev_err(&fd_pipe->fd_dev->pdev->dev,
+			"failed to register subdevs (%d)\n", ret);
+		goto fail_subdevs;
+	}
+
+	/* Create video nodes and links */
+	for (i = 0; i < fd_pipe->num_nodes; i++) {
+		struct mtk_fd_video_device *node = &fd_pipe->nodes[i];
+		struct video_device *vdev = &node->vdev;
+		struct vb2_queue *vbq = &node->dev_q.vbq;
+		struct mtk_fd_video_device_desc *desc = node->desc;
+		u32 flags;
+
+		/* Initialize miscellaneous variables */
+		mutex_init(&node->dev_q.lock);
+
+		/* Initialize formats to default values */
+		mtk_fd_node_to_v4l2(fd_pipe, i, vdev, &node->vdev_fmt);
+
+		/* Initialize media entities */
+		ret = media_entity_pads_init(&vdev->entity, 1, &node->vdev_pad);
+		if (ret) {
+			dev_err(&fd_pipe->fd_dev->pdev->dev,
+				"failed initialize media entity (%d)\n", ret);
+			goto fail_vdev_media_entity;
+		}
+
+		node->vdev_pad.flags = V4L2_TYPE_IS_OUTPUT(desc->buf_type) ?
+			MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
+		vdev->entity.ops = NULL;
+
+		/* Initialize vbq */
+		vbq->type = node->vdev_fmt.type;
+		vbq->io_modes = VB2_MMAP | VB2_DMABUF;
+		vbq->ops = &mtk_fd_vb2_ops;
+		vbq->mem_ops = &vb2_dma_contig_memops;
+		vbq->supports_requests = true;
+		vbq->buf_struct_size = sizeof(struct mtk_fd_dev_buffer);
+		vbq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+		vbq->min_buffers_needed = 0;
+		/* Put the process hub sub device in the vb2 private data*/
+		vbq->drv_priv = fd_pipe;
+		vbq->lock = &node->dev_q.lock;
+		ret = vb2_queue_init(vbq);
+		if (ret) {
+			dev_err(&fd_pipe->fd_dev->pdev->dev,
+				"failed to initialize video queue (%d)\n", ret);
+			goto fail_vdev;
+		}
+
+		/* Initialize vdev */
+		snprintf(vdev->name, sizeof(vdev->name), "%s %s",
+			 fd_pipe->desc->name,
+			 node->desc->name);
+		vdev->release = video_device_release_empty;
+		vdev->fops = &mtk_fd_v4l2_fops;
+		vdev->lock = &node->dev_q.lock;
+		vdev->ctrl_handler = NULL;
+		vdev->v4l2_dev = &fd_pipe->fd_dev->v4l2_dev;
+		vdev->queue = &node->dev_q.vbq;
+		vdev->vfl_dir = V4L2_TYPE_IS_OUTPUT(desc->buf_type) ?
+			VFL_DIR_TX : VFL_DIR_RX;
+		video_set_drvdata(vdev, fd_pipe);
+		pr_debug("register vdev: %s\n", vdev->name);
+		ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+		if (ret) {
+			dev_err(&fd_pipe->fd_dev->pdev->dev,
+				"failed to register video device (%d)\n", ret);
+			goto fail_vdev;
+		}
+
+		/* Create link between video node and the subdev pad */
+		flags = 0;
+		if (desc->dynamic)
+			flags |= MEDIA_LNK_FL_DYNAMIC;
+		if (node->enabled)
+			flags |= MEDIA_LNK_FL_ENABLED;
+		if (node->immutable)
+			flags |= MEDIA_LNK_FL_IMMUTABLE;
+
+		if (V4L2_TYPE_IS_OUTPUT(desc->buf_type))
+			ret = media_create_pad_link(&vdev->entity, 0,
+						    &fd_pipe->subdev.entity,
+						    i, flags);
+		else
+			ret = media_create_pad_link(&fd_pipe->subdev.entity,
+						    i, &vdev->entity, 0,
+						    flags);
+
+		if (ret)
+			goto fail_link;
+	}
+
+	return 0;
+
+	for (; i >= 0; i--) {
+fail_link:
+		video_unregister_device(&fd_pipe->nodes[i].vdev);
+fail_vdev:
+		vb2_queue_release(&fd_pipe->nodes[i].dev_q.vbq);
+		media_entity_cleanup(&fd_pipe->nodes[i].vdev.entity);
+fail_vdev_media_entity:
+		mutex_destroy(&fd_pipe->nodes[i].dev_q.lock);
+	}
+fail_subdevs:
+	v4l2_device_unregister_subdev(&fd_pipe->subdev);
+fail_subdev:
+	media_entity_cleanup(&fd_pipe->subdev.entity);
+fail_media_entity:
+	kfree(fd_pipe->subdev_pads);
+fail_subdev_pads:
+	v4l2_device_unregister(&fd_pipe->fd_dev->v4l2_dev);
+	pr_err("fail_v4l2_dev: media_device_unregister and clenaup:%p",
+	       &fd_pipe->fd_dev->mdev);
+	media_device_unregister(&fd_pipe->fd_dev->mdev);
+	media_device_cleanup(&fd_pipe->fd_dev->mdev);
+
+	return ret;
+}
+
+int mtk_fd_pipe_v4l2_unregister(struct mtk_fd_pipe *fd_pipe)
+{
+	unsigned int i;
+
+	for (i = 0; i < fd_pipe->num_nodes; i++) {
+		video_unregister_device(&fd_pipe->nodes[i].vdev);
+		vb2_queue_release(&fd_pipe->nodes[i].dev_q.vbq);
+		media_entity_cleanup(&fd_pipe->nodes[i].vdev.entity);
+		mutex_destroy(&fd_pipe->nodes[i].dev_q.lock);
+	}
+
+	v4l2_device_unregister_subdev(&fd_pipe->subdev);
+	media_entity_cleanup(&fd_pipe->subdev.entity);
+	kfree(fd_pipe->subdev_pads);
+	v4l2_device_unregister(&fd_pipe->fd_dev->v4l2_dev);
+	media_device_unregister(&fd_pipe->fd_dev->mdev);
+	media_device_cleanup(&fd_pipe->fd_dev->mdev);
+
+	return 0;
+}
+
+void mtk_fd_v4l2_buffer_done(struct vb2_buffer *vb,
+			     enum vb2_buffer_state state)
+{
+	struct mtk_fd_pipe *fd_pipe;
+	struct mtk_fd_video_device *node;
+
+	fd_pipe = vb2_get_drv_priv(vb->vb2_queue);
+	node = mtk_fd_vbq_to_node(vb->vb2_queue);
+	dev_dbg(&fd_pipe->fd_dev->pdev->dev,
+		"%s:%s: return buf, idx(%d), state(%d)\n",
+		fd_pipe->desc->name, node->desc->name,
+		vb->index, state);
+	vb2_buffer_done(vb, state);
+}
+
+/********************************************
+ * MTK FD V4L2 Settings *
+ ********************************************/
+
+static const struct v4l2_ioctl_ops mtk_fd_v4l2_video_out_ioctl_ops = {
+	.vidioc_querycap = mtk_fd_videoc_querycap,
+	.vidioc_enum_framesizes = mtk_fd_videoc_enum_framesizes,
+	.vidioc_enum_fmt_vid_cap_mplane = mtk_fd_videoc_enum_fmt,
+	.vidioc_g_fmt_vid_cap_mplane = mtk_fd_videoc_g_fmt,
+	.vidioc_s_fmt_vid_cap_mplane = mtk_fd_videoc_s_fmt,
+	.vidioc_try_fmt_vid_cap_mplane = mtk_fd_videoc_try_fmt,
+	.vidioc_enum_fmt_vid_out_mplane = mtk_fd_videoc_enum_fmt,
+	.vidioc_g_fmt_vid_out_mplane = mtk_fd_videoc_g_fmt,
+	.vidioc_s_fmt_vid_out_mplane = mtk_fd_videoc_s_fmt,
+	.vidioc_try_fmt_vid_out_mplane = mtk_fd_videoc_try_fmt,
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+	.vidioc_subscribe_event = mtk_fd_vidioc_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+
+};
+
+static const struct v4l2_ioctl_ops mtk_fd_v4l2_video_cap_ioctl_ops = {
+	.vidioc_querycap = mtk_fd_videoc_querycap,
+	.vidioc_enum_framesizes = mtk_fd_videoc_enum_framesizes,
+	.vidioc_enum_fmt_vid_cap_mplane = mtk_fd_videoc_enum_fmt,
+	.vidioc_g_fmt_vid_cap_mplane = mtk_fd_videoc_g_fmt,
+	.vidioc_s_fmt_vid_cap_mplane = mtk_fd_videoc_s_fmt,
+	.vidioc_try_fmt_vid_cap_mplane = mtk_fd_videoc_try_fmt,
+	.vidioc_enum_fmt_vid_out_mplane = mtk_fd_videoc_enum_fmt,
+	.vidioc_g_fmt_vid_out_mplane = mtk_fd_videoc_g_fmt,
+	.vidioc_s_fmt_vid_out_mplane = mtk_fd_videoc_s_fmt,
+	.vidioc_try_fmt_vid_out_mplane = mtk_fd_videoc_try_fmt,
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+	.vidioc_subscribe_event = mtk_fd_vidioc_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+
+};
+
+static const struct v4l2_ioctl_ops mtk_fd_v4l2_meta_out_ioctl_ops = {
+	.vidioc_querycap = mtk_fd_videoc_querycap,
+
+	.vidioc_enum_fmt_meta_cap = mtk_fd_meta_enum_format,
+	.vidioc_g_fmt_meta_cap = mtk_fd_videoc_g_meta_fmt,
+	.vidioc_s_fmt_meta_cap = mtk_fd_videoc_g_meta_fmt,
+	.vidioc_try_fmt_meta_cap = mtk_fd_videoc_g_meta_fmt,
+
+	.vidioc_enum_fmt_meta_out = mtk_fd_meta_enum_format,
+	.vidioc_g_fmt_meta_out = mtk_fd_videoc_g_meta_fmt,
+	.vidioc_s_fmt_meta_out = mtk_fd_videoc_g_meta_fmt,
+	.vidioc_try_fmt_meta_out = mtk_fd_videoc_g_meta_fmt,
+
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+};
+
+static const struct v4l2_ioctl_ops mtk_fd_v4l2_meta_cap_ioctl_ops = {
+	.vidioc_querycap = mtk_fd_videoc_querycap,
+
+	.vidioc_enum_fmt_meta_cap = mtk_fd_meta_enum_format,
+	.vidioc_g_fmt_meta_cap = mtk_fd_videoc_g_meta_fmt,
+	.vidioc_s_fmt_meta_cap = mtk_fd_videoc_g_meta_fmt,
+	.vidioc_try_fmt_meta_cap = mtk_fd_videoc_g_meta_fmt,
+
+	.vidioc_enum_fmt_meta_out = mtk_fd_meta_enum_format,
+	.vidioc_g_fmt_meta_out = mtk_fd_videoc_g_meta_fmt,
+	.vidioc_s_fmt_meta_out = mtk_fd_videoc_g_meta_fmt,
+	.vidioc_try_fmt_meta_out = mtk_fd_videoc_g_meta_fmt,
+
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+};
+
+static struct mtk_fd_dev_format fw_param_fmts[] = {
+	{
+		.fmt.meta = {
+			.dataformat = V4L2_META_FMT_MTISP_PARAMS,
+			.max_buffer_size = 1024 * 30,
+		},
+	},
+};
+
+static struct mtk_fd_dev_format in_fmts[] = {
+	{
+		.fmt.img = {
+			.pixelformat = V4L2_PIX_FMT_VYUY,
+			.mdp_color = MDP_COLOR_VYUY,
+			.colorspace = V4L2_COLORSPACE_BT2020,
+			.depth	 = { 16 },
+			.row_depth = { 16 },
+			.num_planes = 1,
+		},
+	},
+	{
+		.fmt.img = {
+			.pixelformat = V4L2_PIX_FMT_YUYV,
+			.mdp_color = MDP_COLOR_YUYV,
+			.colorspace = V4L2_COLORSPACE_BT2020,
+			.depth	 = { 16 },
+			.row_depth = { 16 },
+			.num_planes = 1,
+		},
+	},
+	{
+		.fmt.img = {
+			.pixelformat = V4L2_PIX_FMT_YVYU,
+			.mdp_color = MDP_COLOR_YVYU,
+			.colorspace = V4L2_COLORSPACE_BT2020,
+			.depth	 = { 16 },
+			.row_depth = { 16 },
+			.num_planes = 1,
+		},
+	},
+	{
+		.fmt.img = {
+			.pixelformat = V4L2_PIX_FMT_UYVY,
+			.mdp_color = MDP_COLOR_UYVY,
+			.colorspace = V4L2_COLORSPACE_BT2020,
+			.depth	 = { 16 },
+			.row_depth = { 16 },
+			.num_planes = 1,
+		},
+	},
+};
+
+static struct mtk_fd_video_device_desc
+	output_queues_setting[MTK_FD_VIDEO_NODE_ID_OUT_TOTAL_NUM] = {
+	{
+		.id = MTK_FD_VIDEO_NODE_ID_YUV_OUT,
+		.name = "FDInput",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.dynamic = 0,
+		.smem_alloc = 0,
+		.default_enable = 1,
+		.fmts = in_fmts,
+		.num_fmts = ARRAY_SIZE(in_fmts),
+		.default_fmt_idx = 0,
+		.default_width = MTK_FD_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_FD_CAPTURE_MAX_HEIGHT,
+		.ops = &mtk_fd_v4l2_video_out_ioctl_ops,
+		.description = "YUV source image",
+	},
+	{
+		.id = MTK_FD_VIDEO_NODE_ID_CONFIG_OUT,
+		.name = "FDConfig",
+		.cap = V4L2_CAP_META_OUTPUT,
+		.buf_type = V4L2_BUF_TYPE_META_OUTPUT,
+		.dynamic = 0,
+		.smem_alloc = 1,
+		.default_enable = 1,
+		.fmts = fw_param_fmts,
+		.num_fmts = ARRAY_SIZE(fw_param_fmts),
+		.default_fmt_idx = 0,
+		.ops = &mtk_fd_v4l2_meta_out_ioctl_ops,
+		.description = "Face detection configuration",
+	},
+};
+
+static struct mtk_fd_video_device_desc
+	capture_queues_setting[MTK_FD_VIDEO_NODE_ID_CAPTURE_TOTAL_NUM] = {
+	{
+		.id = MTK_FD_VIDEO_NODE_ID_CAPTURE,
+		.name = "FDOutput",
+		.cap = V4L2_CAP_META_CAPTURE,
+		.buf_type = V4L2_BUF_TYPE_META_CAPTURE,
+		.dynamic = 0,
+		.smem_alloc = 1,
+		.default_enable = 1,
+		.fmts = fw_param_fmts,
+		.num_fmts = ARRAY_SIZE(fw_param_fmts),
+		.default_fmt_idx = 0,
+		.ops = &mtk_fd_v4l2_meta_cap_ioctl_ops,
+		.description = "Face detection result",
+	},
+};
+
+static struct mtk_fd_pipe_desc
+	pipe_settings[MTK_FD_PIPE_ID_TOTAL_NUM] = {
+	{
+		.name = MTK_FD_PIPE_NAME_STREAM_0,
+		.id = MTK_FD_PIPE_ID_STREAM_0,
+		.master = MTK_FD_VIDEO_NODE_ID_NO_MASTER,
+		.output_queue_descs = output_queues_setting,
+		.total_output_queues = MTK_FD_VIDEO_NODE_ID_OUT_TOTAL_NUM,
+		.capture_queue_descs = capture_queues_setting,
+		.total_capture_queues = MTK_FD_VIDEO_NODE_ID_CAPTURE_TOTAL_NUM,
+	},
+	{
+		.name = MTK_FD_PIPE_NAME_STREAM_1,
+		.id = MTK_FD_PIPE_ID_STREAM_1,
+		.master = MTK_FD_VIDEO_NODE_ID_NO_MASTER,
+		.output_queue_descs = output_queues_setting,
+		.total_output_queues = MTK_FD_VIDEO_NODE_ID_OUT_TOTAL_NUM,
+		.capture_queue_descs = capture_queues_setting,
+		.total_capture_queues = MTK_FD_VIDEO_NODE_ID_CAPTURE_TOTAL_NUM,
+	},
+};
+
+int mtk_fd_dev_v4l2_init(struct mtk_fd_dev *fd_dev)
+{
+	struct media_device *media_dev;
+	struct v4l2_device *v4l2_dev;
+	struct mtk_fd_smem_dev *smem_alloc_dev = &fd_dev->smem_alloc_dev;
+	int i;
+	int ret = 0;
+
+	media_dev = &fd_dev->mdev;
+	v4l2_dev = &fd_dev->v4l2_dev;
+
+	ret = mtk_fd_dev_media_register(&fd_dev->pdev->dev,
+					media_dev,
+					 MTK_FD_PIPE_MEDIA_MODEL_NAME);
+
+	ret = mtk_fd_dev_v4l2_register(&fd_dev->pdev->dev,
+				       media_dev,
+					v4l2_dev);
+
+	ret = mtk_fd_smem_alloc_dev_init(smem_alloc_dev, &fd_dev->pdev->dev);
+
+	for (i = 0; i < MTK_FD_PIPE_ID_TOTAL_NUM; i++) {
+		ret = mtk_fd_pipe_init(&fd_dev->fd_pipe[i], fd_dev,
+				       &pipe_settings[i],
+					media_dev, v4l2_dev, smem_alloc_dev);
+		if (ret) {
+			dev_err(&fd_dev->pdev->dev,
+				"%s: Pipe id(%d) init failed(%d)\n",
+				fd_dev->fd_pipe[i].desc->name,
+				i, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+void mtk_fd_dev_v4l2_release(struct mtk_fd_dev *fd_dev)
+{
+	int i = 0;
+
+	if (fd_dev)
+		for (i = 0; i < MTK_FD_PIPE_ID_TOTAL_NUM; i++)
+			mtk_fd_pipe_release(&fd_dev->fd_pipe[i]);
+
+	mtk_fd_smem_alloc_dev_release(&fd_dev->smem_alloc_dev);
+}
+
diff --git a/drivers/media/platform/mtk-isp/fd/mtk_fd_40.c b/drivers/media/platform/mtk-isp/fd/mtk_fd_40.c
new file mode 100644
index 000000000000..8a048bf3f5c5
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/fd/mtk_fd_40.c
@@ -0,0 +1,555 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2015 MediaTek Inc.
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/platform_data/mtk_scp.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/remoteproc.h>
+#include <linux/wait.h>
+
+#ifdef CONFIG_PM_WAKELOCKS
+#include <linux/pm_wakeup.h>
+#else
+#include <linux/wakelock.h>
+#endif
+
+#include "mtk_fd-dev.h"
+#define FD_DRVNAME	"mtk-fd-4.0"
+
+static int mtk_fd_wait_irq(struct mtk_fd_hw *fd_hw)
+{
+	int timeout;
+	struct mtk_fd_dev *fd_dev = mtk_fd_hw_to_dev(fd_hw);
+
+	timeout = wait_event_interruptible_timeout
+		(fd_hw->wq,
+		 (fd_hw->fd_irq_result & FD_IRQ_MASK),
+		 mtk_fd_us_to_jiffies(1 * 1000000));
+
+	if (timeout == 0) {
+		dev_err(&fd_dev->pdev->dev,
+			"%s timeout, %d\n",
+			__func__, fd_hw->fd_irq_result);
+		return -EAGAIN;
+	}
+
+	dev_dbg(&fd_dev->pdev->dev, "irq_res: 0x%8x\n",
+		fd_hw->fd_irq_result);
+
+	if (timeout != 0 && !(fd_hw->fd_irq_result & FD_IRQ_MASK)) {
+		dev_err(&fd_dev->pdev->dev,
+			"%s interrupted by system signal, return value(%d)\n",
+			__func__, timeout);
+		return -ERESTARTSYS;
+	}
+
+	if (!(fd_hw->fd_irq_result & FD_IRQ_MASK)) {
+		dev_err(&fd_dev->pdev->dev,
+			"%s Not FD, %d\n",
+			__func__, fd_hw->fd_irq_result);
+		return -EINVAL;
+	}
+
+	fd_hw->fd_irq_result = 0;
+
+	return 0;
+}
+
+static irqreturn_t mtk_fd_irq(int irq, void *dev_addr)
+{
+	struct mtk_fd_hw *fd_hw;
+
+	fd_hw = (struct mtk_fd_hw *)dev_addr;
+	fd_hw->fd_irq_result = FD_RD32(fd_hw->fd_base + FD_INT);
+	wake_up_interruptible(&fd_hw->wq);
+
+	return IRQ_HANDLED;
+}
+
+static int mtk_fd_hw_job_finish(struct mtk_fd_hw *fd_hw,
+				struct fd_hw_param *fd_param,
+				enum vb2_buffer_state vbf_state)
+{
+	struct mtk_fd_pipe *fd_pipe;
+	int ret;
+	int pipe_id;
+	struct mtk_fd_dev *fd_dev = mtk_fd_hw_to_dev(fd_hw);
+
+	if (!fd_param)
+		return -EINVAL;
+
+	pipe_id = mtk_fd_pipe_get_pipe_from_job_id(fd_param->frame_id);
+	fd_pipe = mtk_fd_dev_get_pipe(fd_dev, pipe_id);
+
+	dev_dbg(&fd_dev->pdev->dev,
+		"%s: ready to return buffers, pipe(%d), pipe_job_id(%d)\n",
+		__func__, pipe_id, fd_param->frame_id);
+
+	ret = mtk_fd_pipe_job_finish(fd_pipe, fd_param->frame_id, vbf_state);
+
+	if (ret)
+		dev_dbg(&fd_dev->pdev->dev, "%s: finish CB failed(%d)\n",
+			__func__, ret);
+
+	return ret;
+}
+
+static dma_addr_t mtk_fd_hw_alloc_rs_buf(struct mtk_fd_hw *fd_hw)
+{
+	u64 va;
+	struct mtk_fd_dev *fd_dev = mtk_fd_hw_to_dev(fd_hw);
+
+	dma_addr_t dma_handle;
+	u32 size = RS_BUF_SIZE_MAX;
+
+	va = (uint64_t)dma_alloc_coherent(&fd_dev->pdev->dev, size, &dma_handle,
+					  GFP_KERNEL);
+	if (va == 0) {
+		dev_err(&fd_dev->pdev->dev, "dma_alloc null va!\n");
+		return va;
+	}
+
+	memset((uint8_t *)va, 0, size);
+
+	return dma_handle;
+}
+
+static int mtk_fd_hw_get_scp_mem(struct mtk_fd_hw *fd_hw,
+				 struct fd_buffer *scp_mem)
+{
+	u32 size;
+	u32 size_align;
+	struct sg_table *sgt;
+	int n_pages;
+	int i;
+	int ret;
+	struct page **pages;
+	struct mtk_fd_dev *fd_dev = mtk_fd_hw_to_dev(fd_hw);
+	struct platform_device *pdev = fd_dev->pdev;
+
+	scp_mem->va = scp_get_reserve_mem_virt(SCP_FD_MEM_ID);
+	scp_mem->pa = scp_get_reserve_mem_phys(SCP_FD_MEM_ID);
+	size = (u32)scp_get_reserve_mem_size(SCP_FD_MEM_ID);
+
+	if (scp_mem->va != 0 && size > 0)
+		memset((void *)scp_mem->va, 0, size);
+
+	sgt = &fd_hw->sgtable;
+	sg_alloc_table(sgt, 1, GFP_KERNEL);
+
+	size_align = round_up(size, PAGE_SIZE);
+	n_pages = size_align >> PAGE_SHIFT;
+
+	pages = kmalloc_array(n_pages, sizeof(struct page *), GFP_KERNEL);
+
+	for (i = 0; i < n_pages; i++)
+		pages[i] = phys_to_page(scp_mem->pa + i * PAGE_SIZE);
+	ret = sg_alloc_table_from_pages(sgt, pages, n_pages,
+					0, size_align, GFP_KERNEL);
+
+	if (ret) {
+		dev_err(&pdev->dev, "failed to get allocate sg table\n");
+		kfree(pages);
+		return -EINVAL;
+	}
+
+	dma_map_sg_attrs(&pdev->dev, sgt->sgl, sgt->nents,
+			 DMA_BIDIRECTIONAL, DMA_ATTR_SKIP_CPU_SYNC);
+	scp_mem->iova = sg_dma_address(sgt->sgl);
+	kfree(pages);
+
+	return 0;
+}
+
+static int mtk_fd_send_ipi_init(struct mtk_fd_hw *fd_hw,
+				struct platform_device *pdev)
+{
+	struct ipi_message fd_init_msg;
+	struct fd_manager_ctx *fd_manager;
+	struct fd_buffer scp_mem;
+	dma_addr_t fd_resize_workbuf;
+	int ret;
+
+	fd_init_msg.cmd_id = FD_CMD_INIT;
+
+	ret = mtk_fd_hw_get_scp_mem(fd_hw, &scp_mem);
+	if (ret)
+		return ret;
+
+	fd_init_msg.fd_manager = scp_mem;
+	fd_manager = (struct fd_manager_ctx *)fd_init_msg.fd_manager.va;
+
+	fd_resize_workbuf = mtk_fd_hw_alloc_rs_buf(fd_hw);
+	if (!fd_resize_workbuf)
+		return -EINVAL;
+
+	fd_manager->rs_result.iova = fd_resize_workbuf;
+
+	return scp_ipi_send(pdev, SCP_IPI_FD_CMD, &fd_init_msg,
+			    sizeof(fd_init_msg), 0);
+}
+
+static int mtk_fd_send_ipi_cmd(struct platform_device *pdev,
+			       struct fd_hw_param *fd_param)
+{
+	struct ipi_message fd_ipi_msg;
+
+	fd_ipi_msg.cmd_id = FD_CMD_ENQ;
+	fd_ipi_msg.fd_param = *fd_param;
+
+	return scp_ipi_send(pdev, SCP_IPI_FD_CMD, &fd_ipi_msg,
+			    sizeof(fd_ipi_msg), 0);
+}
+
+static int mtk_fd_load_scp(struct mtk_fd_hw *fd_hw)
+{
+	int ret;
+	phandle rproc_phandle;
+	struct mtk_fd_dev *fd_dev = mtk_fd_hw_to_dev(fd_hw);
+
+	/* init scp */
+	fd_hw->scp_pdev = scp_get_pdev(fd_dev->pdev);
+
+	if (!fd_hw->scp_pdev) {
+		dev_err(&fd_dev->pdev->dev,
+			"Failed to get scp device\n");
+		return -EINVAL;
+	}
+
+	if (of_property_read_u32(fd_dev->pdev->dev.of_node,
+				 "mediatek,scp", &rproc_phandle)) {
+		dev_err(&fd_dev->pdev->dev,
+			"Could not get scp device\n");
+		return -EINVAL;
+	}
+
+	fd_hw->rproc_handle = rproc_get_by_phandle(rproc_phandle);
+
+	if (!fd_hw->rproc_handle) {
+		dev_err(&fd_dev->pdev->dev,
+			"Could not get FD's rproc_handle\n");
+		return -EINVAL;
+	}
+
+	dev_dbg(&fd_dev->pdev->dev, "FD rproc_phandle: %p",
+		fd_hw->rproc_handle);
+
+	ret = rproc_boot(fd_hw->rproc_handle);
+	if (ret < 0) {
+		/**
+		 * Return 0 if downloading firmware successfully,
+		 * otherwise it is failed
+		 */
+		dev_err(&fd_dev->pdev->dev,
+			"rproc_boot failed!");
+		return -EINVAL;
+	}
+	return ret;
+}
+
+static int mtk_fd_hw_enable(struct mtk_fd_hw *fd_hw)
+{
+	int ret;
+
+	ret = mtk_fd_load_scp(fd_hw);
+	if (ret)
+		return ret;
+
+	ret = mtk_fd_send_ipi_init(fd_hw, fd_hw->scp_pdev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int mtk_fd_hw_disable(struct mtk_fd_hw *fd_hw)
+{
+	atomic_set(&fd_hw->fd_user_cnt, 0);
+	sg_free_table(&fd_hw->sgtable);
+
+	return 0;
+}
+
+int mtk_fd_hw_connect(struct mtk_fd_hw *fd_hw)
+{
+	s32 usercount;
+	struct mtk_fd_dev *fd_dev;
+
+	fd_dev = mtk_fd_hw_to_dev(fd_hw);
+	fd_hw = &fd_dev->fd_hw;
+	mutex_lock(&fd_hw->fd_hw_lock);
+
+	dev_dbg(&fd_dev->pdev->dev, "open fd_hw = 0x%p\n", fd_hw);
+
+	usercount = atomic_inc_return(&fd_hw->fd_user_cnt);
+
+	if (usercount == 1) {
+		pm_runtime_get_sync(&fd_dev->pdev->dev);
+
+		if (mtk_fd_hw_enable(fd_hw))
+			return -EINVAL;
+		fd_hw->state = FD_INI;
+	}
+
+	dev_dbg(&fd_dev->pdev->dev, "%s: usercount = %d",
+		__func__, atomic_read(&fd_hw->fd_user_cnt));
+	mutex_unlock(&fd_hw->fd_hw_lock);
+
+	return 0;
+}
+
+int mtk_fd_hw_job_exec(struct mtk_fd_hw *fd_hw, struct fd_hw_param *fd_param)
+{
+	struct mtk_fd_dev *fd_dev;
+	struct fd_user_output *fd_output;
+	int ret;
+	u32 num;
+
+	fd_dev = mtk_fd_hw_to_dev(fd_hw);
+	mutex_lock(&fd_hw->fd_hw_lock);
+
+	fd_hw->state = FD_ENQ;
+	ret = mtk_fd_send_ipi_cmd(fd_hw->scp_pdev, fd_param);
+	if (ret) {
+		mutex_unlock(&fd_hw->fd_hw_lock);
+		dev_dbg(&fd_dev->pdev->dev, "Failed to send FD ipi command\n");
+		mtk_fd_hw_job_finish(fd_hw, fd_param, VB2_BUF_STATE_ERROR);
+		return ret;
+	}
+
+	ret = mtk_fd_wait_irq(fd_hw);
+	if (ret) {
+		mutex_unlock(&fd_hw->fd_hw_lock);
+		mtk_fd_hw_job_finish(fd_hw, fd_param, VB2_BUF_STATE_ERROR);
+		return ret;
+	}
+
+	num = FD_RD32(fd_hw->fd_base + FD_RESULT);
+	FD_WR32(0x0, fd_hw->fd_base + FD_INT_EN);
+	fd_output = (struct fd_user_output *)fd_param->fd_user_result.va;
+	fd_output->face_number = num;
+	fd_hw->state = FD_CBD;
+
+	mutex_unlock(&fd_hw->fd_hw_lock);
+
+	return mtk_fd_hw_job_finish(fd_hw, fd_param, VB2_BUF_STATE_DONE);
+}
+
+int mtk_fd_hw_disconnect(struct mtk_fd_hw *fd_hw)
+{
+	struct mtk_fd_dev *fd_dev;
+
+	fd_dev = mtk_fd_hw_to_dev(fd_hw);
+	mutex_lock(&fd_hw->fd_hw_lock);
+
+	dev_dbg(&fd_dev->pdev->dev, "release fd_hw: 0x%p\n", fd_hw);
+
+	if (atomic_dec_and_test(&fd_hw->fd_user_cnt)) {
+		if (fd_hw->state == FD_ENQ)
+			mtk_fd_wait_irq(fd_hw);
+
+		mtk_fd_hw_disable(fd_hw);
+		pm_runtime_put_sync(&fd_dev->pdev->dev);
+	}
+
+	dev_dbg(&fd_dev->pdev->dev, "usercount = %d\n",
+		atomic_read(&fd_hw->fd_user_cnt));
+	mutex_unlock(&fd_hw->fd_hw_lock);
+
+	return 0;
+}
+
+static int mtk_fd_probe(struct platform_device *pdev)
+{
+	struct mtk_fd_dev *fd_dev;
+	struct mtk_fd_hw *fd_hw;
+	struct device_node *node;
+	struct platform_device *larb_pdev;
+	int irq_num;
+	int ret;
+
+	fd_dev = devm_kzalloc(&pdev->dev, sizeof(*fd_dev), GFP_KERNEL);
+
+	if (!fd_dev)
+		return -ENOMEM;
+
+	dev_set_drvdata(&pdev->dev, fd_dev);
+	fd_hw = &fd_dev->fd_hw;
+
+	if (!fd_hw) {
+		dev_err(&pdev->dev, "Unable to allocate fd_hw\n");
+		return -ENOMEM;
+	}
+
+	fd_dev->pdev = pdev;
+
+	irq_num = irq_of_parse_and_map(pdev->dev.of_node, FD_IRQ_IDX);
+	ret = request_irq(irq_num, (irq_handler_t)mtk_fd_irq,
+			  IRQF_TRIGGER_NONE, FD_DRVNAME, fd_hw);
+	if (ret) {
+		dev_dbg(&pdev->dev, "%s request_irq fail, irq=%d\n",
+			__func__, irq_num);
+		return ret;
+	}
+	dev_dbg(&pdev->dev, "irq_num=%d\n", irq_num);
+
+	node = of_parse_phandle(pdev->dev.of_node, "mediatek,larb", 0);
+	if (!node) {
+		dev_err(&pdev->dev, "no mediatek, larb found");
+		return -EINVAL;
+	}
+	larb_pdev = of_find_device_by_node(node);
+	if (!larb_pdev) {
+		dev_err(&pdev->dev, "no mediatek, larb device found");
+		return -EINVAL;
+	}
+	fd_hw->larb_dev = &larb_pdev->dev;
+
+	node = pdev->dev.of_node;
+	if (!node) {
+		dev_err(&pdev->dev, "find fd node failed!!!\n");
+		return -ENODEV;
+	}
+
+	fd_hw->fd_base = of_iomap(node, 0);
+
+	if (!fd_hw->fd_base) {
+		dev_err(&pdev->dev, "unable to map fd node!!!\n");
+		return -ENODEV;
+	}
+
+	dev_dbg(&pdev->dev, "fd_hw->fd_base: %lx\n",
+		(unsigned long)fd_hw->fd_base);
+
+	fd_hw->fd_clk = devm_clk_get(&pdev->dev, "FD_CLK_IMG_FD");
+	if (IS_ERR(fd_hw->fd_clk)) {
+		dev_err(&pdev->dev, "cannot get FD_CLK_IMG_FD clock\n");
+		return PTR_ERR(fd_hw->fd_clk);
+	}
+
+	pm_runtime_enable(&pdev->dev);
+	atomic_set(&fd_hw->fd_user_cnt, 0);
+	init_waitqueue_head(&fd_hw->wq);
+	mutex_init(&fd_hw->fd_hw_lock);
+	fd_hw->fd_irq_result = 0;
+
+	ret = mtk_fd_dev_v4l2_init(fd_dev);
+	if (ret)
+		dev_err(&pdev->dev, "v4l2 init failed: %d\n", ret);
+
+	dev_info(&pdev->dev, "Mediatek Camera FD driver probe.\n");
+
+	return 0;
+}
+
+static int mtk_fd_remove(struct platform_device *pdev)
+{
+	int irq_i4;
+	struct mtk_fd_dev *fd_dev = dev_get_drvdata(&pdev->dev);
+
+	if (fd_dev) {
+		mtk_fd_dev_v4l2_release(fd_dev);
+	} else {
+		dev_err(&pdev->dev, "Can't find fd driver data\n");
+		return -EINVAL;
+	}
+
+	mutex_destroy(&fd_dev->fd_hw.fd_hw_lock);
+	pm_runtime_disable(&pdev->dev);
+
+	irq_i4 = platform_get_irq(pdev, 0);
+	free_irq(irq_i4, NULL);
+	kfree(fd_dev);
+
+	return 0;
+}
+
+static int mtk_fd_suspend(struct device *dev)
+{
+	struct mtk_fd_dev *fd_dev;
+	int ret;
+
+	if (pm_runtime_suspended(dev))
+		return 0;
+
+	fd_dev = dev_get_drvdata(dev);
+
+	if (atomic_read(&fd_dev->fd_hw.fd_user_cnt) > 0) {
+		ret = pm_runtime_put_sync(fd_dev->fd_hw.larb_dev);
+		clk_disable_unprepare(fd_dev->fd_hw.fd_clk);
+		return ret;
+	}
+	return 0;
+}
+
+static int mtk_fd_resume(struct device *dev)
+{
+	struct mtk_fd_dev *fd_dev;
+	int ret;
+
+	if (pm_runtime_suspended(dev))
+		return 0;
+
+	fd_dev = dev_get_drvdata(dev);
+
+	if (atomic_read(&fd_dev->fd_hw.fd_user_cnt) > 0) {
+		ret = pm_runtime_get_sync(fd_dev->fd_hw.larb_dev);
+		if (ret) {
+			dev_dbg(&fd_dev->pdev->dev, "open larb clk failed\n");
+			return ret;
+		}
+
+		ret = clk_prepare_enable(fd_dev->fd_hw.fd_clk);
+		if (ret) {
+			dev_dbg(&fd_dev->pdev->dev, "open fd clk failed\n");
+			return ret;
+		}
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops mtk_fd_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(mtk_fd_suspend, mtk_fd_resume)
+	SET_RUNTIME_PM_OPS(mtk_fd_suspend, mtk_fd_resume, NULL)
+};
+
+static const struct of_device_id mtk_fd_of_ids[] = {
+	{ .compatible = "mediatek,mt8183-fd", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mtk_fd_of_ids);
+
+static struct platform_driver mtk_fd_driver = {
+	.probe   = mtk_fd_probe,
+	.remove  = mtk_fd_remove,
+	.driver  = {
+		.name  = FD_DRVNAME,
+		.of_match_table = mtk_fd_of_ids,
+		.pm = &mtk_fd_pm_ops,
+	}
+};
+module_platform_driver(mtk_fd_driver);
+
+MODULE_DESCRIPTION("Mediatek FD driver");
+MODULE_LICENSE("GPL");
-- 
2.18.0
