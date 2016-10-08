From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] dt: bindings: i2c/trivial-devices.txt: Add 2 iio
 supported accelerometers
Date: Sat, 8 Oct 2016 18:02:44 +0100
Message-ID: <d2dc4bdc-236b-b66d-8fd6-11ab077747bd@kernel.org>
References: <20161008123426.8991-1-hdegoede@redhat.com>
 <20161008123426.8991-2-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161008123426.8991-2-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/10/16 13:34, Hans de Goede wrote:
> Add compatible strings for 2 accelerometers which follow the trivial
> i2c device bindings and have been supported by the iio subsystem for
> a while now.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Applied and pushed out as testing for the autobuilders to ignore it ;)

Thanks,

Jonathan
> ---
>  Documentation/devicetree/bindings/i2c/trivial-devices.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/trivial-devices.txt b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
> index fbbad64..ce9db50 100644
> --- a/Documentation/devicetree/bindings/i2c/trivial-devices.txt
> +++ b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
> @@ -44,6 +44,7 @@ epson,rx8025		High-Stability. I2C-Bus INTERFACE REAL TIME CLOCK MODULE
>  epson,rx8581		I2C-BUS INTERFACE REAL TIME CLOCK MODULE
>  fsl,mag3110		MAG3110: Xtrinsic High Accuracy, 3D Magnetometer
>  fsl,mc13892		MC13892: Power Management Integrated Circuit (PMIC) for i.MX35/51
> +fsl,mma7660		MMA7660FC: 3-Axis Orientation/Motion Detection Sensor
>  fsl,mma8450		MMA8450Q: Xtrinsic Low-power, 3-axis Xtrinsic Accelerometer
>  fsl,mpl3115		MPL3115: Absolute Digital Pressure Sensor
>  fsl,mpr121		MPR121: Proximity Capacitive Touch Sensor Controller
> @@ -57,6 +58,7 @@ maxim,max1237		Low-Power, 4-/12-Channel, 2-Wire Serial, 12-Bit ADCs
>  maxim,max6625		9-Bit/12-Bit Temperature Sensors with I²C-Compatible Serial Interface
>  mc,rv3029c2		Real Time Clock Module with I2C-Bus
>  mcube,mc3230		mCube 3-axis 8-bit digital accelerometer
> +memsic,mxc6225		MEMSIC 2-axis 8-bit digital accelerometer
>  microchip,mcp4531-502	Microchip 7-bit Single I2C Digital Potentiometer (5k)
>  microchip,mcp4531-103	Microchip 7-bit Single I2C Digital Potentiometer (10k)
>  microchip,mcp4531-503	Microchip 7-bit Single I2C Digital Potentiometer (50k)
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
