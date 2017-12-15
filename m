From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 1/5] extcon: usbc-cros-ec: add support to notify USB
 type cables.
Date: Fri, 15 Dec 2017 08:14:53 +0000
Message-ID: <20171215081453.6jwjdetwe655imqo@dell>
References: <CGME20171213103241epcas2p412031074459fa3893388ffca4f894abc@epcas2p4.samsung.com>
 <20171213103219.1464-1-enric.balletbo@collabora.com>
 <5A33702D.60004@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5A33702D.60004@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, groeck@chromium.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>
List-Id: devicetree@vger.kernel.org

> On 2017년 12월 13일 19:32, Enric Balletbo i Serra wrote:
> > From: Benson Leung <bleung@chromium.org>
> > 
> > Extend the driver to notify host and device type cables and the presence
> > of power.
> > 
> > Signed-off-by: Benson Leung <bleung@chromium.org>
> > Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> > ---
> > Changes since v1:
> >  - Use the BIT macro. Requested by Lee Jones.
> >  - Add the Reviewed-by: Chanwoo Choi.
> > 
> >  drivers/extcon/extcon-usbc-cros-ec.c | 142 ++++++++++++++++++++++++++++++++++-
> >  include/linux/mfd/cros_ec_commands.h |  17 +++++
> >  2 files changed, 155 insertions(+), 4 deletions(-)

> Looks good to me. After reviewing the Lee Jones,
> I'll take it on next branch.

If you take it, you need to send me a pull-request to an immutable
branch.

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
