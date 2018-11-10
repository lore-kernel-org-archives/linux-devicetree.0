From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 1/3] dt-bindings: define vendor prefix for whwave, Inc.
Date: Sat, 10 Nov 2018 13:19:08 +0100
Message-ID: <20181110121908.GF29768@piout.net>
References: <1541839433-28811-1-git-send-email-long17.cool@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1541839433-28811-1-git-send-email-long17.cool@163.com>
Sender: linux-kernel-owner@vger.kernel.org
To: zoro <long17.cool@163.com>
Cc: a.zummo@towertech.it, robh+dt@kernel.org, mark.rutland@arm.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

On 10/11/2018 16:43:51+0800, zoro wrote:
> Introduce vendor prefix for whwave, Inc.
> for SD3078 rtc device.
> 
> Signed-off-by: zoro <long17.cool@163.com>
> ---
>  .../devicetree/bindings/vendor-prefixes.txt        |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 4b1a2a8..3d59d6a 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -440,3 +440,4 @@ zidoo	Shenzhen Zidoo Technology Co., Ltd.
>  zii	Zodiac Inflight Innovations
>  zte	ZTE Corp.
>  zyxel	ZyXEL Communications Corp.
> +whwave	Shenzhen whwave Electronics crop

This file must be sorted alphabetically.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
