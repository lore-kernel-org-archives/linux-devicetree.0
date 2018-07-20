From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] usb: dwc3: rockchip: Fix PHY documentation links.
Date: Fri, 20 Jul 2018 08:17:05 -0600
Message-ID: <20180720141705.GA30482@rob-hp-laptop>
References: <20180710125848.15915-1-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180710125848.15915-1-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, kernel@collabora.com, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 10, 2018 at 02:58:48PM +0200, Enric Balletbo i Serra wrote:
> Commit 34962fb8070c ("docs: Fix more broken references") replaced the
> broken reference to rockchip,dwc3-usb-phy.txt binding for the Qualcomm
> DWC3 binding (qcom-dwc3-usb-phy.txt). That's wrong, so replace that
> reference for the correct ones.
> 
> Fixes: 34962fb8070c ("docs: Fix more broken references")
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
>  Documentation/devicetree/bindings/usb/rockchip,dwc3.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied.

Rob
