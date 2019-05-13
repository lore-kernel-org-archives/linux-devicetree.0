From: Rob Herring <robh@kernel.org>
Subject: Re: [v3 PATCH] dt-binding: usb: add usb-role-switch property
Date: Mon, 13 May 2019 12:28:47 -0500
Message-ID: <20190513172847.GA15347@bogus>
References: <c3596e996c9ab39c6b9bc14b93309244c4a55014.1557306151.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c3596e996c9ab39c6b9bc14b93309244c4a55014.1557306151.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Biju Das <biju.das@bp.renesas.com>, Yu Chen <chenyu56@huawei.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Min Guo <min.guo@mediatek.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>
List-Id: devicetree@vger.kernel.org

On Wed, 8 May 2019 17:17:44 +0800, Chunfeng Yun wrote:
> Add a property usb-role-switch to tell the driver that use
> USB Role Switch framework to handle the role switch,
> it's useful when the driver has already supported other ways,
> such as extcon framework etc.
> 
> Cc: Biju Das <biju.das@bp.renesas.com>
> Cc: Yu Chen <chenyu56@huawei.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v3:
>     add property type, modify description suggested by Heikki
> 
> v2:
>     describe it in terms of h/w functionality suggested by Rob
> 
> v1:
>     the property is discussed in:
>     [v2,2/7] dt-bindings: usb: renesas_usb3: add usb-role-switch property
>     https://patchwork.kernel.org/patch/10852497/
> 
>     Mediatek and Hisilicon also try to use it:
>     [v4,3/6] dt-bindings: usb: mtu3: add properties about USB Role Switch
>     https://patchwork.kernel.org/patch/10918385/
>     [v4,6/6] usb: mtu3: register a USB Role Switch for dual role mode
>     https://patchwork.kernel.org/patch/10918367/
> 
>     [v6,10/13] usb: dwc3: Registering a role switch in the DRD code
>     https://patchwork.kernel.org/patch/10909981/
> ---
>  Documentation/devicetree/bindings/usb/generic.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
