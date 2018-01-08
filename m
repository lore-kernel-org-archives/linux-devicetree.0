From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6 0/2] Documentation and driver of logicoreIP
Date: Mon, 8 Jan 2018 13:43:33 +0100
Message-ID: <5529878b-9ef3-86b7-4c35-0aad79aa44c8@xilinx.com>
References: <CAK8P3a0z6HF8Rg08HUj7_T+7ZxxnHoReiu68bNzF6CnEooQSdA@mail.gmail.com>
 <1513881186-26020-1-git-send-email-dshah@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513881186-26020-1-git-send-email-dshah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dhaval Shah <dhaval.shah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, pombredanne-od1rfyK75/E@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, Dhaval Shah <dshah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 21.12.2017 19:33, Dhaval Shah wrote:
> 1st patch provide Device Tree binding document for logicoreIP
> 2nd patch provide the xlnx_vcu logicoreIP driver, Kconfig changes
> and Makefile changes for the driver.
> 
> Dhaval Shah (2):
>   dt-bindings: misc: Add DT bindings to xlnx_vcu driver
>   misc: xlnx_vcu: Add Xilinx ZYNQMP VCU logicoreIP init driver
> 
>  .../devicetree/bindings/soc/xilinx/xlnx,vcu.txt    |  31 +
>  drivers/soc/xilinx/Kconfig                         |  15 +
>  drivers/soc/xilinx/Makefile                        |   1 +
>  drivers/soc/xilinx/xlnx_vcu.c                      | 630 +++++++++++++++++++++
>  4 files changed, 677 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu.txt
>  create mode 100644 drivers/soc/xilinx/xlnx_vcu.c
> 

It looks like there is no any other concern regarding these patches
that's why I have applied them.

Thanks,
Michal
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
