From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] rtc: ds1374: Add trickle charger device tree binding
Date: Mon, 24 Apr 2017 19:16:39 +0200
Message-ID: <20170424171639.6vv5hxrejylloh3b@piout.net>
References: <1492468810-17224-1-git-send-email-mdf@kernel.org>
 <20170420155634.gs7qkufw7j4mfqpx@rob-hp-laptop>
 <20170420172538.GA13892@tyrael.amer.corp.natinst.com>
 <CAAtXAHfNuRXninLWySAOdtV99ih4PBt=JPszn3UkNa08OvXLFQ@mail.gmail.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBCKYNX7Y3IMBBAXG7DDQKGQEPYN45ZA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAAtXAHfNuRXninLWySAOdtV99ih4PBt=JPszn3UkNa08OvXLFQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, rtc-linux <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 22/04/2017 at 10:54:23 -0700, Moritz Fischer wrote:
> On Thu, Apr 20, 2017 at 10:25 AM, Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > On Thu, Apr 20, 2017 at 10:56:34AM -0500, Rob Herring wrote:
> >> On Mon, Apr 17, 2017 at 03:40:10PM -0700, Moritz Fischer wrote:
> >> > Introduce a device tree binding for specifying the trickle charger
> >> > configuration for ds1374. This is based on the code for ds13390.
> >> >
> >> > Signed-off-by: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> > ---
> >> >  .../devicetree/bindings/rtc/dallas,ds1374.txt      | 18 ++++++++
> >> >  drivers/rtc/rtc-ds1374.c                           | 54 ++++++++++++++++++++++
> >> >  2 files changed, 72 insertions(+)
> >> >  create mode 100644 Documentation/devicetree/bindings/rtc/dallas,ds1374.txt
> >> >
> >> > diff --git a/Documentation/devicetree/bindings/rtc/dallas,ds1374.txt b/Documentation/devicetree/bindings/rtc/dallas,ds1374.txt
> >> > new file mode 100644
> >> > index 0000000..4cf5bd7
> >> > --- /dev/null
> >> > +++ b/Documentation/devicetree/bindings/rtc/dallas,ds1374.txt
> >> > @@ -0,0 +1,18 @@
> >> > +* Dallas DS1374            I2C Real-Time Clock / WDT
> >>
> >> Please remove from trivial-devices.txt, too. (which is moving in 4.12
> >> BTW)
> >
> > Ok, I'll redo this on top of b7e252fcddfa573bb1ee275b53bba6cef85671d4
> > (Documentation: devicetree: move trivial-devices out of I2C realm) then.
> 
> Follow up question, right now one selects between WDT and ALARM mode with
> a CONFIG_RTC_DRV_DS1374_WDT=y statically at compile time.
> 
> I'd like to add a 'dallas,mode = <DS1374_WDT>;' or
> dallas,enable-watchdog property
> to the binding, same goes for the ability to remap the WDT reset output to the
> interrupt pin (which is currently not supported, but my hardware needs this).
> 
> Would be the right way to add the remapping something like
> 'dallas,remap-reset-to-int' ?
> 
> Ideas? This change would obviously break people's setups where they
> select one or
> the other behavior via the build time option. Is that acceptable seen
> that relying on
> build time CONFIG_FOO seems like a bad assumption to begin with?
> 
> A bit of background: I currently started cleaning up a bunch of issues
> in this driver,
> like refactoring it to use the watchdog framework instead of open
> coding everything,
> make setting the timeout actually work (right now it the timeout to
> tick conversion is
> hosed).
> 

I think I would do something with MFD as you were suggesting on IRC. You
can have a look at the flexcom driver (atmel-flexcom.c) which is simply
selecting a mode and then using whatever IP driver already existed
(UART, I2C or SPI).

I didn't have a close look but maybe that fits. Then, as you are
concerned wtih backward compatibility, you could enforce the mode from
the MFD driver, depending on the CONFIG_RTC_DRV_DS1374_WDT value.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
