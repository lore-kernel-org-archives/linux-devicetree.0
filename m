From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1] arm64: dts: ls1043a: Add configure-gfladj property to
 USB3 node
Date: Tue, 28 Aug 2018 07:30:39 -0300
Message-ID: <CAOMZO5DJXjWWAOzx_hQKUzjvkb_cCXhGF9nEwnxk8nwTvagh6g@mail.gmail.com>
References: <20180828101213.25750-1-yinbo.zhu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180828101213.25750-1-yinbo.zhu@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yinbo Zhu <yinbo.zhu@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ran Wang <ran.wang_1@nxp.com>, linux-kernel <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rajesh Bhagat <rajesh.bhagat@freescale.com>, Yuantian Tang <andy.tang@nxp.com>, Changming Huang <jerry.huang@nxp.com>, Sumit Garg <sumit.garg@nxp.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, xiaobo.xie@nxp.com, Li Yang <leoyang.li@nxp.com>, Minghuan Lian <Minghuan.Lian@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.in>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 28, 2018 at 7:12 AM, Yinbo Zhu <yinbo.zhu@nxp.com> wrote:
> From: Rajesh Bhagat <rajesh.bhagat@freescale.com>

freescale.com addresses are no longer valid.

The From and the first Signed-off-by lines should match, so use
nxp.com here instead.

> Add "configure-gfladj" boolean property to USB3 node. This property

I don't find any dt-binding doc for this property.

> is used to determine whether frame length adjustent is required or
> not
>
> Signed-off-by: Rajesh Bhagat <rajesh.bhagat@nxp.com>
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>

You missed to add your Signed-off-by tag.
