From: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 3/3] drm/tilcdc: Add drm bridge support for attaching
 drm bridge drivers
Date: Tue, 15 Nov 2016 18:36:34 +0100
Message-ID: <CAMpxmJVcMa-wfXf1BUXvkZ78v_yWorEka1mkGd3wZ88oyL58Kw@mail.gmail.com>
References: <cover.1479142062.git.jsarha@ti.com> <12cd62cc9ea0f79d0f399c76bfa715125a0816ce.1479142062.git.jsarha@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <12cd62cc9ea0f79d0f399c76bfa715125a0816ce.1479142062.git.jsarha-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
Cc: linux-drm <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, daniel-/w4YWyX8dFk@public.gmane.org, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2016-11-14 17:54 GMT+01:00 Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>:
> Adds drm bride support for attaching drm bridge drivers to tilcdc. The
> decision whether a video port leads to an external encoder or bridge
> is made simply based on remote device's compatible string. The code
> has been tested with BeagleBone-Black with and without BeagleBone
> DVI-D Cape Rev A3 using ti-tfp410 driver.
>
> Signed-off-by: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
> ---

Hi Jyri,

thanks a lot for doing this.

One issue I see with this patch is that tilcdc doesn't seem to support
deferred probe correctly (if modules are built-in). The following
happens on my setup:

The dump-vga-dac module is loaded first, but the i2c0 is not ready yet
- probe returns EPROBE_DEFER and it's propagated to tilcdc probe.

    [drm] Initialized
    dumb-vga-dac vga_bridge: Couldn't retrieve i2c bus

Then the i2c bus is initialized and dump-vga-dac probe succeeds, but
the second probe of tilcdc gives me:

    [drm:drm_debugfs_init] *ERROR* Cannot create /sys/kernel/debug/dri/64
    [drm:drm_minor_register] *ERROR* DRM: Failed to initialize
/sys/kernel/debug/dri.
    tilcdc: probe of da8xx_lcdc.0 failed with error -1

I was able to work around this issue by loading modules in correct order.

I then tried testing the patch with a da850-lcdk, but I don't get
anything on the display (no signal), even though the LCDC seems to
work fine (modetest and dmesg messages work just like when using the
tilcdc panel). Also: I see the EDID info is correctly retrieved from
the display.

Could you take a look at my DT[1] and see if you find it correct?

Best regards,
Bartosz Golaszewski

[1] http://pastebin.com/dfUX7PyL
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
