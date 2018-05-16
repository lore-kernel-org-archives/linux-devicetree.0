From: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v6 09/17] media: rkisp1: add rockchip isp1 core driver
Date: Wed, 16 May 2018 17:08:49 +0900
Message-ID: <CAAFQd5BZm6+s=o1xEu_+E56R-k+ujAFxfytjA+N_SAcU=4A9FA@mail.gmail.com>
References: <20180308094807.9443-1-jacob-chen@iotwrt.com> <20180308094807.9443-10-jacob-chen@iotwrt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180308094807.9443-10-jacob-chen@iotwrt.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacob Chen <jacob-chen@iotwrt.com>, Shunqian Zheng <zhengsq@rock-chips.com>
Cc: "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, =?UTF-8?B?6ZKf5Lul5bSH?= <zyc@rock-chips.com>, Eddie Cai <eddie.cai.linux@gmail.com>, Jeffy <jeffy.chen@rock-chips.com>, devicetree@vger.kernel.org, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Chen Jacob <jacob2.chen@rock-chips.com>, =?UTF-8?B?6ZmI5Z+O?= <cc@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Hi Jacob, Shunqian,

On Thu, Mar 8, 2018 at 6:49 PM Jacob Chen <jacob-chen@iotwrt.com> wrote:
[snip]
> +static const struct of_device_id rkisp1_plat_of_match[] = {
> +       {
> +               .compatible = "rockchip,rk3288-cif-isp",
> +               .data = &rk3288_isp_clk_data,
> +       }, {
> +               .compatible = "rockchip,rk3399-cif-isp",
> +               .data = &rk3399_isp_clk_data,
> +       },
> +       {},
> +};

We need MODULE_DEVICE_TABLE() here.

Best regards,
Tomasz
