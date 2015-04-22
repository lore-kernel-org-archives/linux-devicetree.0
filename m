From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: A question on device initialization ordering
Date: Wed, 22 Apr 2015 10:09:37 +0200
Message-ID: <CAMuHMdUiCHLDk=tn=3TsFj_0Cv3C8ZVFXMNEtJ1V2q9RGn7EgQ@mail.gmail.com>
References: <5535EC16.4030609@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5535EC16.4030609-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joshua Scott <Joshua.Scott-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chris Packham <Chris.Packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Joshua,

On Tue, Apr 21, 2015 at 8:20 AM, Joshua Scott
<Joshua.Scott-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org> wrote:
> I have a question about the order in which devices are initialized.
>
> The simpler case is this: A device X needs to be taken out of reset by
> another device Y before it can be used.
>
> To get this to work, one option is to modify the driver for Y to use
> arch_initcall instead of device_initcall. This results in it being run
> first, so that the other device X is out of reset by the time it is
> initialized.
>
> Is it possible within the devicetree to specify that one device must be
> initialized before attempting to initialize another (to avoid needing to
> modify the driver)?
>
>
>
> A chicken-and-egg case: What if two devices use a common driver, but one
> must first be used to bring the other out of reset? Eg: A GPIO expander
> that is held in reset by another GPIO expander.
>
> The goal would be to:
>   1. Initialize the first GPIO expander
>   2. Run a driver that takes the second expander out of reset using the
> first
>   3. Initialize the second GPIO expander (which uses the same driver as
> the first).
>
> In this case, because the drivers for step 1 and step 3 are the same
> driver, it is not possible to adjust the _initcall of the driver for
> step 2 to be in-between them.
>
> Is there a way to describe this situation in a devicetree such that the
> driver for step 2 gets run in-between when the first and second GPIO
> expanders are initialized?

If the devices that need to be initialized last are on a child bus, you have to
describe that child bus in DT, and it should just work.

If all devices are on the same bus, you could add a phandle pointing to
the node for device Y to the node for device X. The driver checks the
phandle, and returns -EPROBE_DEFER if it doesn't point to an initialized
device yet. That does impact the binding of device X, and requires code
changes to the driver for device X.

If this is a generic feature that's required on several devices, it doesn't
make sense to change the bindings and driver code for all affected drivers
(the driver may be used on another SoC that doesn't have the requirement), you
have to group the devices somehow and handle it in a more generic way.
Perhaps using PM Domains?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
