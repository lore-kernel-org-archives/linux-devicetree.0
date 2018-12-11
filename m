From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: define vendor prefix for whwave, Inc.
Date: Tue, 11 Dec 2018 15:37:08 -0600
Message-ID: <20181211213708.GA15257@bogus>
References: <1542968084-3982-1-git-send-email-long17.cool@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1542968084-3982-1-git-send-email-long17.cool@163.com>
Sender: linux-kernel-owner@vger.kernel.org
To: zoro <long17.cool@163.com>
Cc: alexandre.belloni@bootlin.com, a.zummo@towertech.it, mark.rutland@arm.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 23, 2018 at 06:14:42PM +0800, zoro wrote:
> Introduce vendor prefix for whwave, Inc.
> for SD3078 rtc device.
> 
> Signed-off-by: zoro <long17.cool@163.com>

Need a full name.

> ---
>  .../devicetree/bindings/vendor-prefixes.txt        |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 4b1a2a8..7d2e9b01 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -423,6 +423,7 @@ vot	Vision Optical Technology Co., Ltd.
>  wd	Western Digital Corp.
>  wetek	WeTek Electronics, limited.
>  wexler	Wexler
> +whwave	Shenzhen whwave Electronics crop

crop or Corp?

>  wi2wi	Wi2Wi, Inc.
>  winbond Winbond Electronics corp.
>  winstar	Winstar Display Corp.
> -- 
> 1.7.9.5
> 
> 
