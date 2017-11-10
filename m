From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v1 0/2] DRM driver for ILI9225 display panels
Date: Fri, 10 Nov 2017 13:33:27 +0100
Message-ID: <9e56b9ae-2615-4cf2-c072-937f593e8fb7@tronnes.org>
References: <1510113136-6788-1-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1510113136-6788-1-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi David, nice to see a new driver.

Den 08.11.2017 04.52, skrev David Lechner:
> This is a new driver for ILI9225 based display panels.
>
> There are a couple of things that stand out:
>
> 1.  Despite my best efforts, I could not find a name for this display[1], so I
>      have made up a generic name for it. If someone recognizes this and has a
>      name for it, please speak up. The best documentation I could find was
>      here[2].
>
> 2.  There is quite a bit of one-off code copied from mipi-dbi.c. Based on the
>      feedback from a previous patch series, I'm guessing that we don't want to
>      modify mipi-dbi.c to accommodate the ILI9225 controller because the ILI9225
>      controller does not use standard MIPI commands. ILI9225 has it's own
>      non-standard command set, but other than that, it pretty much matches the
>      generic mipi-dbi driver in all regards.

Yes you're right, I don't want non MIPI code in mipi-dbi, but we can
try and make it flexible for usage with DBI like interfaces.

>      Code that could be easily shared:
>
>      a.  ili9225_buf_copy() is exactly the same as mipi_dbi_buf_copy()
>          - ili9225_buf_copy() is used in ili9225_fb_dirty()
>          - mipi_dbi_buf_copy() is static in mipi-dbi.c

You can export mipi_dbi_buf_copy().

>      b.  ili9225_spi_cmd_max_speed() is exactly the same as
>          mipi_dbi_spi_cmd_max_speed()
>          - ili9225_spi_cmd_max_speed() is used in ili9225_command() below, so
>            would not need to be copied if mipi_dbi_typec3_command() could be
>            shared
>          - mipi_dbi_spi_cmd_max_speed() is static in mipi-dbi.c

Same here, you can export the function.

>      c.  ili9225_command() is nearly the same as mipi_dbi_typec3_command()
>          - a few unused lines were removed so I didn't have to copy even more
>            code, but these would not be an issue if code was shared
>          - cmd == ILI9225_WRITE_DATA_TO_GRAM instead of
>            cmd == MIPI_DCS_WRITE_MEMORY_START
>
>      d.  ili9225_spi_init() is nearly the same as mipi_dbi_spi_init()
>          - a few unused lines were removed so I didn't have to copy even more
>            code, but these would not be an issue if code was shared
>          - mipi->command = ili9225_command instead of
>            mipi->command = mipi_dbi_typec3_command
>          - this function would not need to be copied if mipi_dbi_typec3_command()
>            was modified to work with the ILI9225 command set too

Looks like you can use mipi_dbi_spi_init() and reassign afterwards:
     mipi_dbi_spi_init();
     mipi->command = ili9225_command;

>      e.  ili9225_init() is nearly the same as mipi_dbi_init()
>          - only difference is ili9225_fb_funcs instead of mipi_dbi_fb_funcs

When we get framebuffer flushing trough atomic modeset, we'll use a generic
fb_dirty and at that point it will be possible to use mipi_dbi_init().
The actual flushing will happen in the update callback I guess.

> 3.  I haven't tried it, but I believe that it is possible to implement
>      DRM_FORMAT_RGB888 directly instead of simulating DRM_FORMAT_XRGB8888.
>      I don't know if there would be any real benefit to doing this. I am not
>      familiar enough with userspace programs/libraries to know if this mode is
>      universally used. And, it will only physically be 18-bit color instead of
>      24-bit but will increase the amount of data transferred by 50% (3 bytes per
>      pixel instead of 2). Implementing this would have a side effect of making
>      the one-off shared code (described above) more than one-off though.

I have tried it on a display and I couldn't really tell the difference
between 16-bit and 18-bit colors, with X windows at least. And as you
say it's terrible for the framerate.

I'll look closer through the driver later today and see if I have more
comments.

Side note:
This controller can also do something called 24-bit 4 wire SPI. It uses a
Start byte the same way that the (only) SPI mode on ILI9320 and ILI9325 do.
I did a test implementation for ILI9325 where I used regmap as the register
abstraction: https://github.com/notro/tinydrm/blob/master/tinydrm-ili9325.c

Noralf.

> [1]: https://github.com/Nkawu/TFT_22_ILI9225
> [2]: http://www.hotmcu.com/22-176x220-tft-lcd-with-spi-interface-p-316.html
>
> David Lechner (2):
>    dt-bindings: Add binding for Ilitek ILI9225 display panels
>    drm/tinydrm: add driver for ILI9225 panels
>
>   .../devicetree/bindings/display/ilitek,ili9225.txt |  25 +
>   MAINTAINERS                                        |   6 +
>   drivers/gpu/drm/tinydrm/Kconfig                    |  10 +
>   drivers/gpu/drm/tinydrm/Makefile                   |   1 +
>   drivers/gpu/drm/tinydrm/ili9225.c                  | 547 +++++++++++++++++++++
>   5 files changed, 589 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9225.txt
>   create mode 100644 drivers/gpu/drm/tinydrm/ili9225.c
>
> --
> 2.7.4
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
