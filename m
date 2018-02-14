From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 2/2] vfio: platform: Add generic DT reset support
Date: Wed, 14 Feb 2018 10:43:27 +0100
Message-ID: <CAMuHMdULCdVCY7k5ZHX66poxRMTJZ3B1KvDrCzBmtkEipC=CMw@mail.gmail.com>
References: <1518539815-13774-1-git-send-email-geert+renesas@glider.be>
 <1518539815-13774-3-git-send-email-geert+renesas@glider.be> <ed556509-1460-3e05-b161-f476090ff480@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ed556509-1460-3e05-b161-f476090ff480-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Auger Eric <eric.auger-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Baptiste Reynal <b.reynal-lrHrjnjw1UfHK3s98zE1ajGjJy/sRE9J@public.gmane.org>, Alex Williamson <alex.williamson-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, KVM list <kvm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Eric,

On Wed, Feb 14, 2018 at 10:09 AM, Auger Eric <eric.auger-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> On 13/02/18 17:36, Geert Uytterhoeven wrote:
>> Vfio-platform requires reset support, provided either by ACPI, or, on DT
>> platforms, by a device-specific reset driver matching against the
>> device's compatible value.
>>
>> On many SoCs, devices are connected to an SoC-internal reset controller,
>> and can be reset in a generic way.  Hence add support to reset such
>> devices using the reset controller subsystem, provided the reset
>> hierarchy is described correctly in DT using the "resets" property.
>
> I first acknowledge I am not familiar with what those reset controllers
> do in practice. My fear is that we may rely on generic SW pieces that
> may not be adapted to passthrough constraints. We must guarantee that
> any DMA access attempted by the devices are stopped and any interrupts
> gets stopped. Can we guarantee that the reset controller always induce
> that? Otherwise we may leave the door opened to badly reset assigned
> devices.

An on-SoC reset controller is basically a block controlling signals to the
reset inputs of the individual on-SoC devices.
On Renesas ARM SoCs, this allows to do a full reset of the attached device.

Of course the exact semantics depend on the actual SoC.
If e.g. DMA and interrupts are not stopped for a specific device on a
specific SoC, it still needs a device-specific reset driver, matching against
the appropriate compatible value, cfr. the quoted paragraph below.

You could add a whitelist for of_machine_is_compatible() or
of_device_is_compatible(), but that will grow large fast.

>> Devices that require a more complex reset procedure can still
>> provide a device-specific reset driver, as that takes precedence.

>> @@ -138,6 +152,8 @@ static void vfio_platform_put_reset(struct vfio_platform_device *vdev)
>>
>>       if (vdev->of_reset)
>>               module_put(vdev->reset_module);
>> +
> if (vdev->reset_control) ?
> reset_control_put seems to only check IS_ERR()

    void reset_control_put(struct reset_control *rstc)
    {
            if (IS_ERR_OR_NULL(rstc))
                    return;

So it does handle NULL.

>> +     reset_control_put(vdev->reset_control);

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
