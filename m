From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH] ARM: vexpress: initial device tree support
Date: Mon, 09 Jan 2012 14:42:34 -1000
Message-ID: <4F0B897A.20502@firmworks.com>
References: <1316596786-2539-1-git-send-email-dave.martin@linaro.org>
 <CAOZdJXXPJEaFO-ymvb_TsTJ6W2T7_aWXA=9RZprVmKBOn9cu8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAOZdJXXPJEaFO-ymvb_TsTJ6W2T7_aWXA=9RZprVmKBOn9cu8A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: =?ISO-8859-2?Q?Pawe=B3_Moll?= <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rob Herring <rob.herring-CfjtxxwdHycX+EX/Zwu52A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 1/9/2012 1:26 PM, Tabi Timur-B04825 wrote:
> On Wed, Sep 21, 2011 at 4:19 AM, Dave Martin<dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>  wrote:
>>
>>       * edid -- It should be possible to have a fairly generic binding
>>         for EDID interfaces, but none seems to exist yet.  Discussion
>>         is needed regarding what form this should take.
>>
>>         This might more appropriately be called "ddc" (or some
>>         variation on that), since EDID seems only to describe the
>>         format of the ID data retrievable via this interface; not the
>>         interface itself.
>
> Has there been any progress on this issue?  I'm looking to add EDID
> support to a PowerPC device tree.  A TI developer is using
> "ti,eeprom", but I'm not sure that's a good choice.
>

The way it works for many "graphics cards" is that the display hardware 
subsystem includes an I2C (also called "SMBUS") interface that connects 
to the EDID ROM on the monitor.  In this model, the EDID interface is 
not a standalone device, but rather a feature of the display device.

In that scenario, the EDID-reading code is just part of the display 
driver, so you don't need a separate device node.

If the display hardware does not include a dedicated I2C interface 
intended for EDID, then I think what you need is a way to associate an 
external I2C interface with the display driver for that hardware.  The 
interpretation of the data as EDID is not really part of the hardware 
interface, but rather a function of the display driver.  Therefore, I 
think the right way to look at this is not to have a binding for "EDID 
interfaces", but rather a convention for associating a specific instance 
of an I2C interface with a display driver.

The obvious way to do that would be to have a property in the display 
driver whose value is the phandle of an i2c device node.  The display 
driver can then use that to read and interpret the EDID bytes.

In my opinion, pushing the EDID abstraction into a node by itself is not 
worthwhile.  The EDID spec says that you read either 128 or 256 bytes 
from an I2C device at I2C address 0x50; you hardly need an abstraction 
for that, given that you have a "read from I2C" method.
The right level of abstraction at the device node level is "this 
hardware implements an I2C bus master", for which there is already a 
binding.  Then all you need is a reference to that device from a display 
device node.

The display device driver will need to interpret the EDID data in an 
device-dependent manner.  That is inherent in the fact that the driver 
for the given display hardware must map the EDID description of the 
monitor into display-hardware-dependent timing settings.

Some I2C interfaces are implemented by bit-banging GPIOs, while others 
use dedicated hardware protocol engines.  The display driver need not 
know or care about that, as it should be hidden by the i2c bus abstraction.
