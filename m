From: Rob Herring <robh@kernel.org>
Subject: Re: [v5,1/2] dt-bindings: rtc: pcf85263/pcf85363: add some properties
Date: Fri, 27 Sep 2019 11:13:30 -0500
Message-ID: <20190927161330.GA22996@bogus>
References: <20190919014520.15500-1-biwen.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190919014520.15500-1-biwen.li@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: a.zummo@towertech.it, alexandre.belloni@bootlin.com, robh+dt@kernel.org, mark.rutland@arm.com, leoyang.li@nxp.com, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Biwen Li <biwen.li@nxp.com>, Martin Fuzzey <mfuzzey@parkeon.com>
List-Id: devicetree@vger.kernel.org

On Thu, 19 Sep 2019 09:45:19 +0800, Biwen Li wrote:
> Add some properties for pcf85263/pcf85363 as follows:
>   - nxp,rtc-interrupt-type: integer type
>   - nxp,rtc-interrupt-output-pin: string type
>   - quartz-load-femtofarads: integer type
>   - quartz-drive-strength-ohms: integer type
>   - nxp,quartz-low-jitter: bool type
>   - wakeup-source: bool type
> 
> Signed-off-by: Martin Fuzzey <mfuzzey@parkeon.com>
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
> Change in v5:
> 	- Replace nxp,quartz-drive-strength with
> 	  quartz-drive-strength-ohms
> 	- Select ohm unit for quartz drive strength
> 
> Change in v4:
> 	- Drop robust defines in include/dt-bindings/rtc/pcf85363.h
> 	- Add nxp,rtc-interrupt-type property
> 	- Replace interrupt-output-pin with nxp,rtc-interrupt-output-pin
> 
> Change in v3:
> 	- None
> 
> Change in v2:
> 	- Replace properties name
> 	  quartz-load-capacitance -> quartz-load-femtofarads
> 	  quartz-drive-strength -> nxp,quartz-drive-strength
> 	  quartz-low-jitter -> nxp,quartz-low-jitter
> 	- Replace drive strength name
> 	  PCF85263_QUARTZDRIVE_NORMAL -> PCF85263_QUARTZDRIVE_100ko
> 	  PCF85263_QUARTZDRIVE_LOW -> PCF85263_QUARTZDRIVE_60ko
> 	  PCF85263_QUARTZDRIVE_HIGH -> PCF85263_QUARTZDRIVE_500ko
> 	- Set default interrupt-output-pin as "INTA"
> 
>  .../devicetree/bindings/rtc/pcf85363.txt      | 44 ++++++++++++++++++-
>  include/dt-bindings/rtc/pcf85363.h            | 14 ++++++
>  2 files changed, 57 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/rtc/pcf85363.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
