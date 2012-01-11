From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH] ARM: vexpress: initial device tree support
Date: Wed, 11 Jan 2012 13:16:19 -1000
Message-ID: <4F0E1843.7030207@firmworks.com>
References: <1316596786-2539-1-git-send-email-dave.martin@linaro.org>
 <CAOZdJXXPJEaFO-ymvb_TsTJ6W2T7_aWXA=9RZprVmKBOn9cu8A@mail.gmail.com>
 <4F0B897A.20502@firmworks.com>
 <20120110122252.GA7180@jl-vm1.vm.bytemark.co.uk>
 <4F0CB485.9010106@freescale.com> <4F0CBD46.2010909@firmworks.com>
 <4F0CD7BC.7080409@freescale.com> <4F0D2F90.8020801@firmworks.com>
 <74CDBE0F657A3D45AFBB94109FB122FF177EE3A770@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF177EE3A770-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: =?ISO-8859-2?Q?Pawe=B3_Moll?= <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>, Rob Herring <rob.herring-CfjtxxwdHycX+EX/Zwu52A@public.gmane.org>, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 1/11/2012 10:29 AM, Stephen Warren wrote:
> Mitch Bradley wrote at Tuesday, January 10, 2012 11:43 PM:
>> On 1/10/2012 2:28 PM, Timur Tabi wrote:
>>> Mitch Bradley wrote:
> ...
>>>> That GPIO pin thing is annoying, but not sufficiently complex or common
>>>> that it warrants having a separate EDID driver.  You could define a
>>>> platform-specific property to tell your framebuffer driver that it needs
>>>> to do that GPIO thing.  It's a hack, but the GPIO thing is inherently a
>>>> hack, so there will be some ugliness somewhere as a result.
>>>
>>> I have two platform-specific functions, "enabled_edid" and "disable_edid", that I call before/after
>>> calling fb_ddc_read().  This seems to work well, and I already have a mechanism for calling platform-
>>> specific functions from the framebuffer driver.
>>>
>>> However, Stephen Warren said I should be using the I2C mux feature instead.
>>
>> I2C mux is a plausible solution, as is your enable/disable thing.  At
>> some level they are equivalent.  I2C mux is a formalization of your
>> solution, in which the mux device's select method must be written to
>> perform the function of your enable/disable edid functions.
>>
>> Either way, you need platform-dependent functions to do the switching,
>> and you need to select the appropriate channel.  Personally, I don't see
>> the advantage of using the mux device in this case.
>
> The main advantage I see is that you explicitly don't need any platform-
> specific functions to do the switching; you end up with platform-agnostic
> code (the I2C GPIO mux driver) and platform-specific configuration for
> that driver (the GPIO ID to use).


Oh, I didn't know about the I2C GPIO Mux driver.  I was looking at 
i2c-mux.c .  I now see gpio-i2cmux.c, which indeed seems to do the right 
thing.

> The display driver just talks to the
> I2C API for the DDC I2C bus, and doesn't do anything to switch between
> the busses; the I2C GPIO mux driver does all that internally. Thus, the
> display driver will work fine on boards that don't need this muxing with
> zero changes; the board simply wouldn't register the mux driver.
>
>> It's just adding
>> complexity with no payback.  If there were several channels that needed
>> to be accessed in an interspersed fashion, the mux device would  be much
>> cleaner.  But in this case, there is a single "back channel" that only
>> needs to be accessed once and can subsequently be ignored.
>
> Well, the EDID needs to be read on every hotplug event, so it's certainly
> not a one-time thing.
>
>> The video
>> driver can grab a lock, call enable_edid(), read out the EDID data into
>> an array, call disable_edid(), release the lock, and that is it.  The
>> other users of that I2C bus can ignore the hidden EDID.
>
> Other I2C users/devices also shouldn't be impacted by the mux; they
> would continue to use the existing I2C APIs for the bus their devices
> are attached to, and not know about the mux.

If other devices that are on the same bus as the EDID don't use the mux, 
how does one ensure that the GPIO is restored to the non-EDID
setting when the display driver is finished?

Perhaps I'm missing something, but it appears to me that the model is to 
set the correct GPIO state before each use, instead of a 
save-set-use-restore model.

In any case, if there is a good way to instantiate the GPIO mux device 
from the device tree, it certainly provides a ready-made solution.  Each 
device that is on the bus in question would have a device node that is a 
child of the GPIO mux node, and the display driver could have a 
phandle-valued property pointing to the mux node, plus a property 
declaring the selection value (or perhaps a single 2-cell property with 
phandle, selection-value).

> The overhead should be
> almost zero; the I2C GPIO mux driver could remember the previous bus
> selection and only modify it (gpio_set_value) when switching between
> busses. I guess there might be a small overhead to taking a lock to
> protect the bus selection; I'm not sure whether the I2C core serializes
> access already or you'd need to add this; check the existing I2C I2C
> bus mux implementation I guess.
>
