From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v25 2/2] soc: mediatek: Add Mediatek CMDQ helper
Date: Sat, 29 Sep 2018 14:50:35 +0200
Message-ID: <7040427b-f580-ec33-8afa-35dcf5735abb@gmail.com>
References: <1538212903-14331-1-git-send-email-houlong.wei@mediatek.com>
 <1538212903-14331-3-git-send-email-houlong.wei@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1538212903-14331-3-git-send-email-houlong.wei@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Houlong Wei <houlong.wei@mediatek.com>, Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, CK HU <ck.hu@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, Monica Wang <monica.wang@mediatek.com>, HS Liao <hs.liao@mediatek.com>, ginny.chen@mediatek.com, enzhu.wang@mediatek.com
List-Id: devicetree@vger.kernel.org



On 29/09/2018 11:21, Houlong Wei wrote:
[...]

> +static int cmdq_pkt_append_command(struct cmdq_pkt *pkt, enum cmdq_code code,
> +				   u32 arg_a, u32 arg_b)
> +{
> +	u64 *cmd_ptr;
> +
> +	if (unlikely(pkt->cmd_buf_size + CMDQ_INST_SIZE > pkt->buf_size)) {
> +		pkt->cmd_buf_size += CMDQ_INST_SIZE;

Can you plesae provide some example code of a driver that will use this API, I
still don't understand why you need to update the cmd_buf_size here.

> +		WARN_ON(1);

can we add some debug information:
WARN_ON(1, "%s: buffer size too small for the amount of commands", __func__);

Would it make sense to use WARN_ONCE()?

> +		return -ENOMEM;
> +	}
> +	cmd_ptr = pkt->va_base + pkt->cmd_buf_size;
> +	(*cmd_ptr) = (u64)((code << CMDQ_OP_CODE_SHIFT) | arg_a) << 32 | arg_b;
> +	pkt->cmd_buf_size += CMDQ_INST_SIZE;
> +
> +	return 0;
> +}

Thanks,
Matthias
