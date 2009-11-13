From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 3/3] mpc52xx/wdt: WDT uses GPT api
Date: Thu, 12 Nov 2009 23:21:15 -0700
Message-ID: <fa686aa40911122221s24efdcc9k1daf63b600e7b429@mail.gmail.com>
References: <fa686aa40911101159y7bef3f9bte74e9aeb5c6e864b@mail.gmail.com>
	<1257884778.14374.5@antares> <20091112213630.GE19336@infomag.iguana.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20091112213630.GE19336-flHiHfN8CTwhDM6iD19NGrNAH6kLmebB@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Linux PPC Development <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 12, 2009 at 2:36 PM, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org> wrote:
> Hi All,
>
>>> Can the WDT functionality just be merged entirely into
>>> arch/powerpc/platforms/52xx/mpc52xx_gpt.c, eliminating the need for
>>> this file entirely? =A0I think I'd rather have all the GPT "built in"
>>> behaviour handled by a single driver.
>>
>> I also thought about it, as it has IMHO the cleaner code, and it would h=
ave the extra benefit that the gpt-wdt api doesn't need to be public.
>>
>> However, the reasons I hesitated to do so are:
>> - I don't want to remove a file someone else wrote (even it doesn't work=
);
>> - WDT code is shifted from drivers/watchdog to arch/powerpc/platforms/52=
xx which might not be the "logical" place from the directory layout's pov;
>> - a file living in arch/powerpc/platforms/52xx depends upon config optio=
ns set from drivers/watchdog/Kconfig which may be confusing.
>>
>> You see these are more political/cosmetical questions, so I would prefer=
 to leave the decision to the maintainers (i.e. you and Wim). =A0Preparing =
a fully merged driver is actually a matter of minutes!
>
> My opinion: it is harder to maintain the watchdog code if it is being mov=
ed away from drivers/watchdog.
> I need to check the code before I comment any further on this, but my fir=
st thought is: why don't you do it with platform resources like other devic=
es are doing? This way you can keep the platform code under arch and the wa=
tchdog itself under drivers/watchdog/. You can look at the following driver=
s as an example: adx_wdt.c ar7_wdt.c at32ap700x_wdt.c coh901327_wdt.c davin=
ci_wdt.c mpcore_wdt.c mv64x60_wdt.c nuc900_wdt.c omap_wdt.c pnx4008_wdt.c r=
c32434_wdt.c s3c2410_wdt.c txx9wdt.c .

In actual fact, it is a single device with multiple functions, some of
which can be used at the same time.  The driver for the device
determines what the device instance supports and registers the
appropriate interfaces.  There is a GPIO controller, a PWM controller,
a general purpose timer, and the watchdog.  Because of the
multifunction nature of the device, there are subtle interactions
between the functions that the driver needs to maintain.  I don't want
to export functions from the driver which will only be used by a
watchdog instance.  I also don't want the added code and complexity of
a secondary probe path.  It is simpler and less code to roll all the
behaviour up into the one driver single driver that gets probed once.

>From the maintenance perspective, having the main driver in
arch/powerpc and the watchdog bit in drivers/watchdog doesn't really
help much anyway because anything that changes the internal driver API
(between the core and watchdog bits) will require cross-maintainer
changes.  ie. do changes go through my tree because they touch
arch/powerpc, or do they go through yours because they touch
drivers/watchdog?  I'd much rather all the internal details be
contained within a single driver.

Besides, there is already precedence for very arch-specific drivers
living under arch/*/.  find ./arch -name *gpio*

Cheers,
g.


-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
