From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: timer: Add binding doc for nxp system  counter timer
Date: Sat, 06 Apr 2019 01:07:01 -0500
Message-ID: <5ca84207.1c69fb81.eee15.9249@mx.google.com>
References: <1554287101-16189-1-git-send-email-ping.bai@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554287101-16189-1-git-send-email-ping.bai@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacky Bai <ping.bai@nxp.com>
Cc: "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, 3 Apr 2019 10:20:25 +0000, Jacky Bai wrote:
> From: Bai Ping <ping.bai@nxp.com>
> 
> Add the binding doc for nxp system counter timer module.
> 
> Signed-off-by: Bai Ping <ping.bai@nxp.com>
> ---
> change v1->v2
>  - remove the blank line at EOF
> change v2->v3
>  - update the binding example based on the driver change
> ---
>  .../devicetree/bindings/timer/nxp,sysctr-timer.txt | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/nxp,sysctr-timer.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
