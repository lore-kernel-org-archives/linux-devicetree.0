From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC 2/2] drm/bridge: Add I2C based driver for ps8640 bridge
Date: Fri, 16 Oct 2015 14:06:33 +0100
Message-ID: <20151016130632.GE2054@leverpostej>
References: <1444997709-57293-1-git-send-email-ck.hu@mediatek.com>
 <1444997709-57293-2-git-send-email-ck.hu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444997709-57293-2-git-send-email-ck.hu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding <treding@nvidia.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Inki Dae <inki.dae@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, Sean Paul <seanpaul@chromium.org>, Vincent Palatin <vpalatin@chromium.org>, Andy Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Russell King <rmk+kernel@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, yingjoe.chen@mediatek.com, eddie.huang
List-Id: devicetree@vger.kernel.org

> +	/* FIXME - use of_graph_get_port_by_id(np, 1) on newer kernels */
> +	in_ep = of_graph_get_next_endpoint(np, NULL);

Huh?

> +	edidp = of_get_property(np, "edid", &size);

This property wasn't mentioned in the binding document.

Please describe it. If it's from a more generic binding, refer to that
from the binding document.

Thanks,
Mark.
