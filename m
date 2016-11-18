From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv0 1/1] fbdev: add Intel FPGA FRAME BUFFER driver
Date: Fri, 18 Nov 2016 12:56:55 -0600
Message-ID: <CAL_JsqK2Emqub_JKiXYQUPzxRbws5w=SGUTyZx+qaEExV9V3_A@mail.gmail.com>
References: <1479287278-5192-1-git-send-email-hean.loong.ong@intel.com>
 <20161118140903.q33zx7bk5nergq45@rob-hp-laptop> <20161118141547.465c431e@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161118141547.465c431e-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: One Thousand Gnomes <gnomes-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>
Cc: "Ong, Hean Loong" <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 18, 2016 at 8:15 AM, One Thousand Gnomes
<gnomes-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org> wrote:
>> AIUI, we're not taking new FB drivers. This should be a DRM driver
>> instead.
>
> Yes - clone one of the dumb DRM drivers, or if you've got any little bits
> of acceleration (even rolling the display) then it's possibly worth
> accelerating for text mode.
>
>> > +- max-width: The width of the framebuffer in pixels.
>> > +- max-height: The height of the framebuffer in pixels.
>> > +- bits-per-color: only "8" is currently supported
>>
>> These are not h/w properties.
>
> How are the max ones not hardware properties ?

Because the way they are used is setting the mode, not some check of
the max when the mode is set. If this is synthesized for only one
size, then that would be different, but we have bindings for modes.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
