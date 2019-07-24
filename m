From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] extcon: arizona: Update binding example to use
 available defines
Date: Wed, 24 Jul 2019 19:16:32 +0900
Message-ID: <55bef964-1680-27ef-2bd9-c44de2ee07fc@samsung.com>
References: <CGME20190724094922epcas5p3382c6fedfd2c450fc975223cef1de319@epcas5p3.samsung.com>
        <20190724094914.19284-1-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190724094914.19284-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: myungjoo.ham@samsung.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, patches@opensource.cirrus.com
List-Id: devicetree@vger.kernel.org

On 19. 7. 24. 오후 6:49, Charles Keepax wrote:
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  Documentation/devicetree/bindings/extcon/extcon-arizona.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-arizona.txt b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> index 7f3d94ae81ffb..208daaff0be4f 100644
> --- a/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> +++ b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> @@ -72,5 +72,5 @@ codec: wm8280@0 {
>  		1 2 1 /* MICDET2 MICBIAS2 GPIO=high */
>  	>;
>  
> -	wlf,gpsw = <0>;
> +	wlf,gpsw = <ARIZONA_GPSW_OPEN>;
>  };
> 

Applied it. Thanks.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
