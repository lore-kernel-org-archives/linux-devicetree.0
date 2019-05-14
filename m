From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 3/6] dt-bindings: usb: mtu3: add properties about USB
 Role Switch
Date: Tue, 14 May 2019 13:17:43 -0500
Message-ID: <20190514181743.GA21612@bogus>
References: <1557823643-8616-1-git-send-email-chunfeng.yun@mediatek.com>
 <1557823643-8616-4-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1557823643-8616-4-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Biju Das <biju.das@bp.renesas.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, 14 May 2019 16:47:20 +0800, Chunfeng Yun wrote:
> Now the USB Role Switch is supported, so add properties about it,
> and modify some description related.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v5 changes
>  1. modify decription about extcon and vbus-supply properties
>  2. make this patch depend on [1]
> 
>  [1]: [v3] dt-binding: usb: add usb-role-switch property
>       https://patchwork.kernel.org/patch/10934835/
> 
> v4: no changes
> v3: no changes
> 
> v2 changes:
>   1. fix typo
>   2. refer new binding about connector property
> ---
>  .../devicetree/bindings/usb/mediatek,mtu3.txt          | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
