From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 8/9 v2] usb: usb251xb: Add max power/current dts property
 support
Date: Wed, 20 Sep 2017 15:52:55 -0500
Message-ID: <20170920205255.5txbub3y6v6avolh@rob-hp-laptop>
References: <20170915233113.17855-1-fancer.lancer@gmail.com>
 <20170916104220.3742-1-fancer.lancer@gmail.com>
 <20170916104220.3742-9-fancer.lancer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170916104220.3742-9-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Serge Semin <fancer.lancer@gmail.com>
Cc: richard.leitner@skidata.com, gregkh@linuxfoundation.org, mark.rutland@arm.com, Sergey.Semin@t-platforms.ru, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Sep 16, 2017 at 01:42:19PM +0300, Serge Semin wrote:
> This parameters may be varied in accordance with hardware specifics.
> So lets add the corresponding settings to the usb251x driver dts
> specification.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/usb251xb.txt   |  6 ++++++
>  drivers/usb/misc/usb251xb.c                          | 20 ++++++++++++++++----
>  2 files changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
> index 3d84626d3..dd59a32e7 100644
> --- a/Documentation/devicetree/bindings/usb/usb251xb.txt
> +++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
> @@ -44,6 +44,12 @@ Optional properties :
>  	device connected.
>   - sp-disabled-ports : Specifies the ports which will be self-power disabled
>   - bp-disabled-ports : Specifies the ports which will be bus-power disabled
> + - sp-max-{power,current} : Indicates the power/current consumed by hub from
> +	an upstream port (VBUS) when operation as a self-powered hub. The value
> +	is given in mA in a 0 - 100 range (default is 1mA).
> + - bp-max-{power,current} : Indicates the power/current consumed by hub from
> +	an upstream port (VBUS) when operation as a bus-powered hub. The value
> +	is given in mA in a 0 - 510 range (default is 100mA).

These need units as defined in property-units.txt.

Why do you need power and current? Can't you calculate power?

>   - power-on-time-ms : Specifies the time it takes from the time the host
>  	initiates the power-on sequence to a port until the port has adequate
>  	power. The value is given in ms in a 0 - 510 range (default is 100ms).
