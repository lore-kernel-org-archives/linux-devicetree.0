Return-Path: <robherring2@gmail.com>
Date: Tue, 24 Apr 2018 09:33:27 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH/RFC 01/11] Documentation: of: Add device-connection-id
 property
Message-ID: <20180424143327.u5a76hbdk3g7wlhr@rob-hp-laptop>
References: <1524039005-30618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1524039005-30618-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1524039005-30618-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: gregkh@linuxfoundation.org, mark.rutland@arm.com, frowand.list@gmail.com, heikki.krogerus@linux.intel.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, p.zabel@pengutronix.de, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Apr 18, 2018 at 05:09:55PM +0900, Yoshihiro Shimoda wrote:
> This patch adds a new property for device connection framework.

What's the "device connection framework" and what does it have to do 
with DT?

> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/devicetree/bindings/graph.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/graph.txt b/Documentation/devicetree/bindings/graph.txt
> index 0415e2c..fca0030 100644
> --- a/Documentation/devicetree/bindings/graph.txt
> +++ b/Documentation/devicetree/bindings/graph.txt
> @@ -125,4 +125,4 @@ Optional endpoint properties
>  ----------------------------
>  
>  - remote-endpoint: phandle to an 'endpoint' subnode of a remote device node.
> -
> +- device-connection-id: string for device connection.

Why do we need this?

> -- 
> 1.9.1
> 
