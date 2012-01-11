From: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] ARM: vexpress: initial device tree support
Date: Tue, 10 Jan 2012 18:28:44 -0600
Message-ID: <4F0CD7BC.7080409@freescale.com>
References: <1316596786-2539-1-git-send-email-dave.martin@linaro.org>
 <CAOZdJXXPJEaFO-ymvb_TsTJ6W2T7_aWXA=9RZprVmKBOn9cu8A@mail.gmail.com>
 <4F0B897A.20502@firmworks.com>
 <20120110122252.GA7180@jl-vm1.vm.bytemark.co.uk>
 <4F0CB485.9010106@freescale.com> <4F0CBD46.2010909@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F0CBD46.2010909-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
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
Cc: =?UTF-8?B?UGF3ZcWCIE1vbGw=?= <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>, Rob Herring <rob.herring-CfjtxxwdHycX+EX/Zwu52A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Mitch Bradley wrote:
> It seems to me that having the framebuffer driver handle the EDID 
> "driver" function is exactly the right thing.  The framebuffer driver is 
> the only thing that cares about EDID information.  Given a phandle 
> reference to an I2C interface, the "driver" is just "call the I2C read 
> routine" - plus, in your case, toggling the GPIO pin.

Do you think I should have the I2C probe function read the EDID data, and then store it in some global variable?  That won't work if I have multiple video controllers, since I won't know which EDID data goes with which video controller.  I tried adding a call to i2c_add_driver() in my framebuffer driver, but the I2C probe function was called *after* the framebuffer's probe function, so that doesn't help me.  

> That GPIO pin thing is annoying, but not sufficiently complex or common 
> that it warrants having a separate EDID driver.  You could define a 
> platform-specific property to tell your framebuffer driver that it needs 
> to do that GPIO thing.  It's a hack, but the GPIO thing is inherently a 
> hack, so there will be some ugliness somewhere as a result.

I have two platform-specific functions, "enabled_edid" and "disable_edid", that I call before/after calling fb_ddc_read().  This seems to work well, and I already have a mechanism for calling platform-specific functions from the framebuffer driver.

However, Stephen Warren said I should be using the I2C mux feature instead.  

-- 
Timur Tabi
Linux kernel developer at Freescale
