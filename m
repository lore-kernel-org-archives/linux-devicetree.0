From: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v8 2/3] CMDQ: Mediatek CMDQ driver
Date: Thu, 23 Jun 2016 14:03:49 +0800
Message-ID: <1466661829.15112.26.camel@mtksdaap41>
References: <1464578397-29743-1-git-send-email-hs.liao@mediatek.com>
	 <1464578397-29743-3-git-send-email-hs.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464578397-29743-3-git-send-email-hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: HS Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, cawa cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Daoyuan Huang <daoyuan.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Damon Chu <damon.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Josh-YC Liu <josh-yc.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Glory Hung <glory.hung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jiaguang Zhang <jiaguang.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi, HS:

On Mon, 2016-05-30 at 11:19 +0800, HS Liao wrote:
> This patch is first version of Mediatek Command Queue(CMDQ) driver. The
> CMDQ is used to help read/write registers with critical time limitation,
> such as updating display configuration during the vblank. It controls
> Global Command Engine (GCE) hardware to achieve this requirement.
> Currently, CMDQ only supports display related hardwares, but we expect
> it can be extended to other hardwares for future requirements.
> 
> Signed-off-by: HS Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/soc/mediatek/Kconfig    |  10 +
>  drivers/soc/mediatek/Makefile   |   1 +
>  drivers/soc/mediatek/mtk-cmdq.c | 943 ++++++++++++++++++++++++++++++++++++++++
>  include/soc/mediatek/cmdq.h     | 197 +++++++++
>  4 files changed, 1151 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mtk-cmdq.c
>  create mode 100644 include/soc/mediatek/cmdq.h

[...]

> +
> +/* events for CMDQ and display */
> +enum cmdq_event {
> +	/* Display start of frame(SOF) events */
> +	CMDQ_EVENT_DISP_OVL0_SOF = 11,
> +	CMDQ_EVENT_DISP_OVL1_SOF = 12,
> +	CMDQ_EVENT_DISP_RDMA0_SOF = 13,
> +	CMDQ_EVENT_DISP_RDMA1_SOF = 14,
> +	CMDQ_EVENT_DISP_RDMA2_SOF = 15,
> +	CMDQ_EVENT_DISP_WDMA0_SOF = 16,
> +	CMDQ_EVENT_DISP_WDMA1_SOF = 17,
> +	/* Display end of frame(EOF) events */
> +	CMDQ_EVENT_DISP_OVL0_EOF = 39,
> +	CMDQ_EVENT_DISP_OVL1_EOF = 40,
> +	CMDQ_EVENT_DISP_RDMA0_EOF = 41,
> +	CMDQ_EVENT_DISP_RDMA1_EOF = 42,
> +	CMDQ_EVENT_DISP_RDMA2_EOF = 43,
> +	CMDQ_EVENT_DISP_WDMA0_EOF = 44,
> +	CMDQ_EVENT_DISP_WDMA1_EOF = 45,
> +	/* Mutex end of frame(EOF) events */
> +	CMDQ_EVENT_MUTEX0_STREAM_EOF = 53,
> +	CMDQ_EVENT_MUTEX1_STREAM_EOF = 54,
> +	CMDQ_EVENT_MUTEX2_STREAM_EOF = 55,
> +	CMDQ_EVENT_MUTEX3_STREAM_EOF = 56,
> +	CMDQ_EVENT_MUTEX4_STREAM_EOF = 57,
> +	/* Display underrun events */
> +	CMDQ_EVENT_DISP_RDMA0_UNDERRUN = 63,
> +	CMDQ_EVENT_DISP_RDMA1_UNDERRUN = 64,
> +	CMDQ_EVENT_DISP_RDMA2_UNDERRUN = 65,
> +	/* Keep this at the end of HW events */
> +	CMDQ_MAX_HW_EVENT_COUNT = 260,
> +};

The value of these symbol is just the GCE-HW-defined value. I think it's
not appropriate to expose HW-defined value to client. For another SoC
GCE HW, these definition may change.

One way to solve this problem is to translate symbol to value
internally. But these events looks like interrupt and the value may vary
by each SoC, to prevent driver modified frequently, it's better to place
the value definition in device tree. It may looks like:

mmsys: clock-controller@14000000 {
	compatible = "mediatek,mt8173-mmsys";
	mediatek,gce = <&gce>;
	gce-events = <53 54>;
	gce-event-names = "MUTEX0_EOF","MUTEX1_EOF";
}

For cmdq driver, you just need modify interface from

int cmdq_rec_wfe(struct cmdq_rec *rec, enum cmdq_event event)
int cmdq_rec_clear_event(struct cmdq_rec *rec, enum cmdq_event event)

to

int cmdq_rec_wfe(struct cmdq_rec *rec, u32 event)
int cmdq_rec_clear_event(struct cmdq_rec *rec, u32 event)

Regards,
CK


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
