Return-Path: <robherring2@gmail.com>
Date: Mon, 17 Dec 2018 15:29:22 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 4/4] doc: usb: ci-hdrc-usb2: Add pinctrl properties
 for  HSIC pin groups
Message-ID: <20181217212922.GA27338@bogus>
References: <20181211020624.9433-1-peter.chen@nxp.com>
 <20181211020624.9433-5-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181211020624.9433-5-peter.chen@nxp.com>
To: Peter Chen <peter.chen@nxp.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "frieder.schrempf@exceet.de" <frieder.schrempf@exceet.de>, "festevam@gmail.com" <festevam@gmail.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, 11 Dec 2018 02:09:04 +0000, Peter Chen wrote:
> For USB HSIC, the data and strobe pin needs to be pulled down
> at default, we consider it as "idle" state. When the USB host
> is ready to be used, the strobe pin needs to be pulled up,
> we consider it as "active" state.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  .../devicetree/bindings/usb/ci-hdrc-usb2.txt       | 31 +++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
