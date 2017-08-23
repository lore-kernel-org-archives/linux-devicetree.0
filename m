From: wlf <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: usb: add DT binding for RK3328 dwc3
 controller
Date: Wed, 23 Aug 2017 20:22:42 +0800
Message-ID: <4406bd06-8b2b-9e30-f0b4-b41596622782@rock-chips.com>
References: <1503322566-31489-1-git-send-email-william.wu@rock-chips.com>
 <1503322566-31489-2-git-send-email-william.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1503322566-31489-2-git-send-email-william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Balbi & Gregkh,

在 2017年08月21日 21:36, William Wu 写道:
> Adds the device tree bindings description for RK3328 and
> compatible USB DWC3 controller.
>
> Signed-off-by: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> Changes in v3:
> - Add this for separate usb dt-bindings patch.
>
> Changes in v2:
> - None
>
>   Documentation/devicetree/bindings/usb/rockchip,dwc3.txt | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt b/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt
> index 0536a93..d6b2e47 100644
> --- a/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt
> @@ -1,7 +1,9 @@
>   Rockchip SuperSpeed DWC3 USB SoC controller
>   
>   Required properties:
> -- compatible:	should contain "rockchip,rk3399-dwc3" for rk3399 SoC
> +- compatible:	should be one of the following:
> +  - "rockchip,rk3399-dwc3": for rk3399 SoC
> +  - "rockchip,rk3328-dwc3", "rockchip,rk3399-dwc3": for rk3328 SoC
>   - clocks:	A list of phandle + clock-specifier pairs for the
>   		clocks listed in clock-names
>   - clock-names:	Should contain the following:
         Could you help to reviewed this patch? According to Heiko's 
suggestion, this patch
         need to be submitted to usb tree or at least get an Ack from you.

         Thank you!

-- 
吴良峰 William.Wu
福建省福州市铜盘路软件大道89号软件园A区21号楼
No.21 Building, A District, No.89,software Boulevard Fuzhou,Fujian, PRC
手机: 13685012275
座机: 0591-83991906-8520
邮件:wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
