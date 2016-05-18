From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] [media] media: i2c/ov5645: add the device tree
 binding document
Date: Wed, 18 May 2016 18:16:37 -0500
Message-ID: <20160518231637.GA31413@rob-hp-laptop>
References: <1463572208-8826-1-git-send-email-todor.tomov@linaro.org>
 <1463572208-8826-2-git-send-email-todor.tomov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1463572208-8826-2-git-send-email-todor.tomov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
To: Todor Tomov <todor.tomov@linaro.org>
Cc: pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, mchehab@osg.samsung.com, hverkuil@xs4all.nl, geert@linux-m68k.org, matrandg@cisco.com, linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
List-Id: devicetree@vger.kernel.org

On Wed, May 18, 2016 at 02:50:07PM +0300, Todor Tomov wrote:
> Add the document for ov5645 device tree binding.
> 
> Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
> ---
>  .../devicetree/bindings/media/i2c/ov5645.txt       | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5645.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5645.txt b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> new file mode 100644
> index 0000000..8799000
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> @@ -0,0 +1,56 @@
> +* Omnivision 1/4-Inch 5Mp CMOS Digital Image Sensor
> +
> +The Omnivision OV5645 is a 1/4-Inch CMOS active pixel digital image sensor with
> +an active array size of 2592H x 1944V. It is programmable through a serial SCCB

s/SCCB/I2C/ because that is the more common name.

> +interface.
> +
> +Required Properties:
> +- compatible: value should be "ovti,ov5645"
> +- clocks: reference to the xclk clock
> +- clock-names: should be "xclk"
> +- assigned-clocks: reference to the xclk clock

This should be optional as it only makes sense if there is more than one 
option.

> +- assigned-clock-rates: should be "23880000"

Doesn't this depend on the board? Most parts take a range of 
frequencies. The driver should know what the range is and request a rate 
within this range.

> +
> +Optional Properties:
> +- reset-gpios: Chip reset GPIO
> +- pwdn-gpios: Chip power down GPIO

Use enable-gpios as it is more common and would just be the inverse of 
this.

Both need to specify the polarity.

> +- dovdd-supply: Chip IO regulator
> +- dvdd-supply: Chip core regulator
> +- avdd-supply: Chip analog regulator
> +
> +The device node must contain one 'port' child node for its digital output
> +video port, in accordance with the video interface bindings defined in
> +Documentation/devicetree/bindings/media/video-interfaces.txt.
