From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V5 1/4] dt-bindings: memory-controllers: freescale: add
 MMDC  binding doc
Date: Tue, 12 Mar 2019 08:09:45 -0500
Message-ID: <20190312130945.GA31098@bogus>
References: <1552357127-1283-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1552357127-1283-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Tue, 12 Mar 2019 02:24:08 +0000, Anson Huang wrote:
> Freescale MMDC (Multi Mode DDR Controller) driver is supported
> since i.MX6Q, but not yet documented, this patch adds binding
> doc for MMDC module driver.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V4:
> 	- update mmdc1 example.
> ---
>  .../bindings/memory-controllers/fsl/mmdc.txt       | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/fsl/mmdc.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
