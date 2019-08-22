From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [v7,2/2] dt-bindings: rtc: add bindings for FlexTimer Module
Date: Thu, 22 Aug 2019 23:12:33 +0200
Message-ID: <20190822211233.GD27031@piout.net>
References: <20190813030157.48590-1-biwen.li@nxp.com>
 <20190813030157.48590-2-biwen.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190813030157.48590-2-biwen.li@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Biwen Li <biwen.li@nxp.com>
Cc: a.zummo@towertech.it, leoyang.li@nxp.com, robh+dt@kernel.org, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, xiaobo.xie@nxp.com, jiafei.pan@nxp.com, ran.wang_1@nxp.com, mark.rutland@arm.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 13/08/2019 11:01:57+0800, Biwen Li wrote:
> The patch adds bindings for FlexTimer Module
> 
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
> Change in v7:
>     - delete aliases
> 
> Change in v6:
>     - correct subject
>     - delete note
>     - remove reg property about IP Powerdown exception register
> 
> Change in v5:
>     - None
> 
> Change in v4:
>     - add note about dts and kernel options
>     - add aliases in example
> 
> Change in v3:
> 	- remove reg-names property
> 	- correct cells number
> 
> Change in v2:
> 	- replace ls1043a with ls1088a as example
> 	- add rcpm node and fsl,rcpm-wakeup property
> 
>  .../bindings/rtc/rtc-fsl-ftm-alarm.txt        | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
