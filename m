From: Kyle Moffett <Kyle.D.Moffett-X8CqP27nNzzQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 0/3] New "gpio-poweroff" driver to turn off platform
 devices with GPIOs
Date: Fri,  2 Dec 2011 15:37:58 -0500
Message-ID: <1322858281-17831-1-git-send-email-Kyle.D.Moffett@boeing.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello all,

I'm working on support for some custom hardware of ours, and part of
the support code is the ability for the software to shutdown the power
supply using GPIOs (via an I2C GPIO controller).

I previously had this in my platform code, but it seemed generically
useful, so I split it out into a separate module for others to use.

The first two patches are generic of_gpio enhancements, providing some
new library functions for requesting lots of GPIOs at once.

The third patch is the actual driver itself.  The driver can be used to
instantiate a platform device as a whole-machine-poweroff device as we
use it on our hardware.  Alternatively it can instantiate multiple
platform devs at specific locations on the device tree which trigger
from the platform_driver->shutdown() callback.

For architectures which are still stuck in the dark ages, this driver
also supports being instantiated via legacy platform_data.

The OpenFirmware binding documentation is added in the third patch.
Since this is my first cut, it's a little rough, so please be gentle.

I'm interested to know what you all think.

Cheers,
Kyle Moffett

--
Interested in my work on the Debian "powerpcspe" port?
I'm keeping a blog here: http://pureperl.blogspot.com/
