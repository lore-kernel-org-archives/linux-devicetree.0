From: gtk_ruiwang <gtk_ruiwang@mediatek.com>
Subject: Re: [PATCH,v1] media: mtk-vcodec: fix vp9 content playback error
 with show exist frame
Date: Tue, 16 Apr 2019 16:53:54 +0800
Message-ID: <1555404834.22504.9.camel@mhfsdcap03>
References: <1554106718-23107-1-git-send-email-maoguang.meng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-7"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554106718-23107-1-git-send-email-maoguang.meng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>, maoguang.meng@mediatek.com
Cc: Longfei Wang <longfei.wang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, gtk_ruiwang@mediatek.com
List-Id: devicetree@vger.kernel.org

Dear Hans, all,

Could you please help to review this patch?

This is a fix about vp9 show+AF8-existing+AF8-frames.

Sincerely thanks,
BR

On Mon, 2019-04-01 at 16:18 +-0800, maoguang.meng+AEA-mediatek.com wrote:
+AD4 From: Maoguang Meng +ADw-maoguang.meng+AEA-mediatek.com+AD4
+AD4 
+AD4 Update referenced frame buffer's reference count when playing vp9
+AD4 content which has show+AF8-existing+AF8-frame flag, and copy enough buffer
+AD4 data to current shown frame.
+AD4 
+AD4 Signed-off-by: Maoguang Meng +ADw-maoguang.meng+AEA-mediatek.com+AD4
+AD4 ---
+AD4  .../media/platform/mtk-vcodec/vdec/vdec+AF8-vp9+AF8-if.c   +AHw   16 +-+-+-+-+-+-+----------
+AD4  1 file changed, 7 insertions(+-), 9 deletions(-)
+AD4 
+AD4 diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec+AF8-vp9+AF8-if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec+AF8-vp9+AF8-if.c
+AD4 index bc8349b..d950837 100644
+AD4 --- a/drivers/media/platform/mtk-vcodec/vdec/vdec+AF8-vp9+AF8-if.c
+AD4 +-+-+- b/drivers/media/platform/mtk-vcodec/vdec/vdec+AF8-vp9+AF8-if.c
+AD4 +AEAAQA -481,15 +-481,15 +AEAAQA static void vp9+AF8-swap+AF8-frm+AF8-bufs(struct vdec+AF8-vp9+AF8-inst +ACo-inst)
+AD4  		 +ACo-/
+AD4  		if ((frm+AF8-to+AF8-show-+AD4-fb +ACEAPQ NULL) +ACYAJg
+AD4  			(inst-+AD4-cur+AF8-fb-+AD4-base+AF8-y.size +AD4APQ
+AD4 -			frm+AF8-to+AF8-show-+AD4-fb-+AD4-base+AF8-y.size)) +AHs
+AD4 +-			frm+AF8-to+AF8-show-+AD4-fb-+AD4-base+AF8-y.size) +ACYAJg
+AD4 +-			(inst-+AD4-cur+AF8-fb-+AD4-base+AF8-c.size +AD4APQ
+AD4 +-			frm+AF8-to+AF8-show-+AD4-fb-+AD4-base+AF8-c.size)) +AHs
+AD4  			memcpy((void +ACo)inst-+AD4-cur+AF8-fb-+AD4-base+AF8-y.va,
+AD4  				(void +ACo)frm+AF8-to+AF8-show-+AD4-fb-+AD4-base+AF8-y.va,
+AD4 -				vsi-+AD4-buf+AF8-w +ACo
+AD4 -				vsi-+AD4-buf+AF8-h)+ADs
+AD4 +-				frm+AF8-to+AF8-show-+AD4-fb-+AD4-base+AF8-y.size)+ADs
+AD4  			memcpy((void +ACo)inst-+AD4-cur+AF8-fb-+AD4-base+AF8-c.va,
+AD4  				(void +ACo)frm+AF8-to+AF8-show-+AD4-fb-+AD4-base+AF8-c.va,
+AD4 -				vsi-+AD4-buf+AF8-w +ACo
+AD4 -				vsi-+AD4-buf+AF8-h / 2)+ADs
+AD4 +-				frm+AF8-to+AF8-show-+AD4-fb-+AD4-base+AF8-c.size)+ADs
+AD4  		+AH0 else +AHs
+AD4  			/+ACo After resolution change case, current CAPTURE buffer
+AD4  			 +ACo may have less buffer size than frm+AF8-to+AF8-show buffer
+AD4 +AEAAQA -895,7 +-895,7 +AEAAQA static int vdec+AF8-vp9+AF8-decode(unsigned long h+AF8-vdec, struct mtk+AF8-vcodec+AF8-mem +ACo-bs,
+AD4  
+AD4  		if (vsi-+AD4-resolution+AF8-changed) +AHs
+AD4  			if (+ACE-vp9+AF8-alloc+AF8-work+AF8-buf(inst)) +AHs
+AD4 -				ret +AD0 -EINVAL+ADs
+AD4 +-				ret +AD0 -EIO+ADs
+AD4  				goto DECODE+AF8-ERROR+ADs
+AD4  			+AH0
+AD4  		+AH0
+AD4 +AEAAQA -924,14 +-924,12 +AEAAQA static int vdec+AF8-vp9+AF8-decode(unsigned long h+AF8-vdec, struct mtk+AF8-vcodec+AF8-mem +ACo-bs,
+AD4  
+AD4  		if (vsi-+AD4-show+AF8-existing+AF8-frame +ACYAJg (vsi-+AD4-frm+AF8-to+AF8-show+AF8-idx +ADw
+AD4  					VP9+AF8-MAX+AF8-FRM+AF8-BUF+AF8-NUM)) +AHs
+AD4 -			mtk+AF8-vcodec+AF8-err(inst,
+AD4 +-			mtk+AF8-vcodec+AF8-debug(inst,
+AD4  				+ACI-Skip Decode drv-+AD4-new+AF8-fb+AF8-idx+AD0AJQ-d, drv-+AD4-frm+AF8-to+AF8-show+AF8-idx+AD0AJQ-d+ACI,
+AD4  				vsi-+AD4-new+AF8-fb+AF8-idx, vsi-+AD4-frm+AF8-to+AF8-show+AF8-idx)+ADs
+AD4  
+AD4  			vp9+AF8-ref+AF8-cnt+AF8-fb(inst, +ACY-vsi-+AD4-new+AF8-fb+AF8-idx,
+AD4  					vsi-+AD4-frm+AF8-to+AF8-show+AF8-idx)+ADs
+AD4 -			ret +AD0 -EINVAL+ADs
+AD4 -			goto DECODE+AF8-ERROR+ADs
+AD4  		+AH0
+AD4  
+AD4  		/+ACo VPU assign the buffer pointer in its address space,
