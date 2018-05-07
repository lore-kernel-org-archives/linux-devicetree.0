Return-Path: <robherring2@gmail.com>
Date: Mon, 7 May 2018 10:58:52 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 01/14] dt-bindings: connector: add properties for typec
Message-ID: <20180507155852.GA7962@rob-hp-laptop>
References: <1525307094-27402-1-git-send-email-jun.li@nxp.com>
 <1525307094-27402-2-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1525307094-27402-2-git-send-email-jun.li@nxp.com>
To: Li Jun <jun.li@nxp.com>
Cc: gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net, a.hajda@samsung.com, cw00.choi@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, gsomlo@gmail.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

On Thu, May 03, 2018 at 08:24:41AM +0800, Li Jun wrote:
> Add bingdings supported by current typec driver, so user can pass
> all those properties via dt.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  .../bindings/connector/usb-connector.txt           | 44 +++++++++++++++
>  include/dt-bindings/usb/pd.h                       | 62 ++++++++++++++++++++++
>  2 files changed, 106 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.txt b/Documentation/devicetree/bindings/connector/usb-connector.txt
> index e1463f1..4b19de6d0 100644
> --- a/Documentation/devicetree/bindings/connector/usb-connector.txt
> +++ b/Documentation/devicetree/bindings/connector/usb-connector.txt
> @@ -15,6 +15,33 @@ Optional properties:
>  - type: size of the connector, should be specified in case of USB-A, USB-B
>    non-fullsize connectors: "mini", "micro".
>  
> +Optional properties for usb-c-connector:
> +- power-role: should be one of "source", "sink" or "dual"(DRP) if typec
> +  connector has power support.
> +- try-power-role: preferred power role if "dual"(DRP) can support Try.SNK
> +  or Try.SRC, should be "sink" for Try.SNK or "source" for Try.SRC.
> +- data-role: should be one of "host", "device", "dual"(DRD) if typec
> +  connector supports USB data.

Need to define what are the defaults on these if the properties aren't 
present (ideally, those would be the common case)?

Rob
