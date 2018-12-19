From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 2/3] dt-bindings: display: bridge: lvds-transmitter: add
 pwdn-gpios
Date: Wed, 19 Dec 2018 10:12:56 +0100
Message-ID: <f0686eeb-14af-6525-6c55-9cc8bdc5730e@samsung.com>
References: <20181218231850.3572-1-peda@axentia.se>
        <CGME20181218231950epcas3p4d5bc243137aa464b0424365dfde9d238@epcas3p4.samsung.com>
        <20181218231850.3572-3-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181218231850.3572-3-peda@axentia.se>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Archit Taneja <architt@codeaurora.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 19.12.2018 00:19, Peter Rosin wrote:
> Add optional property to specify a power-down GPIO.
> The pwdn-gpios name is already in use by the thine,thc63lvdm83d
> binding, so go with that.
>
> Signed-off-by: Peter Rosin <peda@axentia.se>
> ---
>  Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> index f9e7dd666f58..47941d39f92f 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> @@ -31,6 +31,9 @@ Required properties:
>    device-specific version corresponding to the device first
>    followed by the generic version.
>  
> +Optional properties:
> +- pwdn-gpios: Power-down control GPIO
> +


Since naming is not enforced by any datasheet I would propose something
more popular with less twisted logic. Maybe:

- enable-gpios: ... (active high).


Regards

Andrzej


>  Required nodes:
>  
>  This device has two video ports. Their connections are modeled using the OF
