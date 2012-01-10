From: Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] ARM: vexpress: initial device tree support
Date: Tue, 10 Jan 2012 02:24:08 +0000
Message-ID: <4F0BA146.807@freescale.com>
References: <1316596786-2539-1-git-send-email-dave.martin@linaro.org>
 <CAOZdJXXPJEaFO-ymvb_TsTJ6W2T7_aWXA=9RZprVmKBOn9cu8A@mail.gmail.com>
 <4F0B897A.20502@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F0B897A.20502-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Content-Language: en-US
Content-ID: <4A4FCEB56925534EA39AC1C86DFDFF17-KZfg59tc24wqcZcGjlUOXw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: =?utf-8?B?UGF3ZcWCIE1vbGw=?= <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rob Herring <rob.herring-CfjtxxwdHycX+EX/Zwu52A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Mitch Bradley wrote:

> The way it works for many "graphics cards" is that the display hardware
> subsystem includes an I2C (also called "SMBUS") interface that connects to
> the EDID ROM on the monitor. In this model, the EDID interface is not a
> standalone device, but rather a feature of the display device.
>
> In that scenario, the EDID-reading code is just part of the display
> driver, so you don't need a separate device node.

On the system I'm supporting, the I2C bus is not part of the video 
hardware.  The EDID "device" is not even on a dedicated bus -- it's on a 
shared I2C bus with other devices.

> If the display hardware does not include a dedicated I2C interface
> intended for EDID, then I think what you need is a way to associate an
> external I2C interface with the display driver for that hardware. The
> interpretation of the data as EDID is not really part of the hardware
> interface, but rather a function of the display driver. Therefore, I think
> the right way to look at this is not to have a binding for "EDID
> interfaces", but rather a convention for associating a specific instance
> of an I2C interface with a display driver.

I don't think that's going to work for me.  Reading the EDID data is a 
platform function, not a video driver function.  I'm adding platform code 
to read the EDID data.

We can't really make it generic, either, even though it's using address 
0x50 like everyone else.  On my platform, for instance, I need to enable 
the EDID interface via an FPGA, perform the I2C read, and then disable the 
EDID interface.

> The obvious way to do that would be to have a property in the display
> driver whose value is the phandle of an i2c device node. The display
> driver can then use that to read and interpret the EDID bytes.

Hmmm.... now that I think about it, I can create platform-specific "EDID 
enable" and "EDID disable" functions, and let the video driver do the I2C 
load generically, using a phandle.

> In my opinion, pushing the EDID abstraction into a node by itself is not
> worthwhile.

Well, I have to create an I2C device node in order to get any I2C working.

> The EDID spec says that you read either 128 or 256 bytes from
> an I2C device at I2C address 0x50; you hardly need an abstraction for
> that, given that you have a "read from I2C" method.
> The right level of abstraction at the device node level is "this hardware
> implements an I2C bus master", for which there is already a binding. Then
> all you need is a reference to that device from a display device node.
>
> The display device driver will need to interpret the EDID data in an
> device-dependent manner. That is inherent in the fact that the driver for
> the given display hardware must map the EDID description of the monitor
> into display-hardware-dependent timing settings.
>
> Some I2C interfaces are implemented by bit-banging GPIOs, while others use
> dedicated hardware protocol engines. The display driver need not know or
> care about that, as it should be hidden by the i2c bus abstraction.

This gives me something to think about.  Thanks.

-- 
Timur Tabi
Linux kernel developer at Freescale
