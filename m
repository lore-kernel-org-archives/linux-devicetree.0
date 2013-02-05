From: "Vishwanathrao Badarkhe, Manish" <manishv.b-l0cyMroinI0@public.gmane.org>
Subject: RE: [PATCH V2 1/6] pinctrl: pinctrl-single: use arch_initcall and
 module_exit
Date: Tue, 5 Feb 2013 06:36:34 +0000
Message-ID: <A4887BF146CD57468F700B415D2F47015828C7@DBDE01.ent.ti.com>
References: <1359445134-13323-1-git-send-email-manishv.b@ti.com>
 <1359445134-13323-2-git-send-email-manishv.b@ti.com>
 <CACRpkdbf7TwrjfT2rhqQFGc3yh_Nt117RtzQO2y6g5Ddx5Ay_w@mail.gmail.com>
 <20130201170906.GE22517@atomide.com> <20130201171124.GF22517@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130201171124.GF22517-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org" <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "khilman-1D3HCaltpLuhEniVeURVKkEOCMrvLtNR@public.gmane.org" <khilman-1D3HCaltpLuhEniVeURVKkEOCMrvLtNR@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "Nori, Sekhar" <nsekhar-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "hs-ynQEQJNshbs@public.gmane.org" <hs-ynQEQJNshbs@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 01, 2013 at 22:41:24, Tony Lindgren wrote:
> * Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> [130201 09:12]:
> > * Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> [130129 03:03]:
> > > On Tue, Jan 29, 2013 at 8:38 AM, Vishwanathrao Badarkhe, Manish 
> > > <manishv.b-l0cyMroinI0@public.gmane.org> wrote:
> > > 
> > > > Currently, I2C driver gets probed before pinctrl driver.
> > > > To achieve I2C pin muxing via pinctrl driver before I2C probe get 
> > > > called, register pinctrl driver in arch_initcall.
> > > > Also, add module_exit to unregister pinctrl driver.
> > > >
> > > > Signed-off-by: Vishwanathrao Badarkhe, Manish <manishv.b-l0cyMroinI0@public.gmane.org>
> > > 
> > > So your I2C driver is not returning -EPROBE_DEFER if it cannot find 
> > > its pins?
> > > 
> > > Hm, well I can live with this, if Tony ACKs it.
> > 
> > Hmm pinctrl is before i2c in drivers/Makefile.
> > Making initcalls happen earlier and earlier is usually the wrong way 
> > to go. Sounds like there's some other issue here that needs to be 
> > fixed instead.
> 
> Let me guess: The i2c driver is wrongly set to run with arch_initcall?
>  

Hi Tony

No, Currently i2c driver is set to subsys_initcall. I have seen some
problem while using pin control grab functionality. Please see detailed
explanation as below.

Hi Linus

I am using auto grab pin control facility to do pin muxing of I2C0 
pins and seen problem as below:

Currently, probe of I2C0 driver gets called before pin control driver. 
Hence, while calling I2C0 probe because of unavailability of  
pin control node information, its probe get deferred giving following 
messages:

"i2c_davinci i2c_davinci.1: could not find pctldev for node /soc/pinmux@1c14120
/pinmux_i2c0_pins, deferring probe"

As I2C0 is in deferred list (as auto grab patch handle this), its probe 
get called once again, During this second time probe of I2C0, I have 
observed following crash:

"Unable to handle kernel paging request at virtual address fffffe07"

As per code analysis of auto grab functionality, I have seen in 
"pinctrl_bind_pin" function, pin control handle (dpi->p) is returned by 
"devm_pinctrl_get" function.

Pin control handle is assigned with error pointer during 1st time probing of 
I2C0 (as pin control information is not available at this time). 
During 2nd time probing (deferred probe) of I2C0, same pin control handle 
(which was get assigned during 1st probe) is getting used instead of getting 
updated to correct pin control handle which leads to system crash.

I made following changes, in order to update "dip->p" pointer with 
correct value:

-       if (!dpi->p) {
+       if (IS_ERR_OR_NULL(dpi->p)) {
                dpi->p = devm_pinctrl_get(dev);
-               if (IS_ERR_OR_NULL(dpi->p)) {
-                       int ret = PTR_ERR(dpi->p);
-
-                       dev_dbg(dev, "no pinctrl handle\n");
-                       /* Only return deferrals */
-                       if (ret == -EPROBE_DEFER)
-                               return ret;
-                       return 0;
-               }
+               ret = PTR_ERR(dpi->p);
+               dev_dbg(dev, "no pinctrl handle\n");
+               /* Only return deferrals */
+               if (ret == -EPROBE_DEFER)
+                       return ret;
+               return 0;

Is this intended change? or am I missing something in order to use this auto grab
functionality?

With the above change, now deferred probing is working fine and there is no need
to register pin control driver in arch_initcall.


Regards, 
Manish
