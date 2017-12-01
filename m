From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 2/2] drm/tinydrm: add driver for ILI9225 panels
Date: Fri, 1 Dec 2017 15:03:30 +0100
Message-ID: <CACRpkdYRQoTyzTOK=8n7sawDZAWS3sXRDdDdFpxhZKuV+DE5oQ@mail.gmail.com>
References: <1510113136-6788-1-git-send-email-david@lechnology.com> <1510113136-6788-3-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1510113136-6788-3-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, Stefano Babic <sbabic@denx.de>
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 8, 2017 at 4:52 AM, David Lechner <david@lechnology.com> wrote:

> This adds a new driver for display panels based on the Ilitek ILI9225
> controller.
>
> This was developed for a no-name panel with a red PCB that is commonly
> marketed for Arduino. See <https://github.com/Nkawu/TFT_22_ILI9225>.
>
> I really did try very hard to find a make and model for this panel, but
> there doesn't seem to be one, so the best I can do is offer the picture
> in the link above for identification.
>
> Signed-off-by: David Lechner <david@lechnology.com>

Can you explain why tinydrm is not putting its panel drivers in
drivers/gpu/drm/panel?

I guess everybody knows except me, it's usually like that :(

I am anyways working on a driver for Ilitek 9322 that I want
to land in drivers/gpu/drm/panel. Here is the last iteration:
https://lists.freedesktop.org/archives/dri-devel/2017-August/150205.html
Yeah I got sidetracked. OK I will get to it now.

There are some similarities with the code I'm seeing here
but I believe they are essentially different. But it will be hard
to share code if you put the driver in the tinydrm framework.

I guess you have also seen:
drivers/video/backlight/ili922x.c
?

Stefano Babic who wrote the backlight driver is available for
reviewing, so includ him in follow-ups (added to To: line).

I'm putting you on CC as I'm rewriting it a bit after the DT
maintainers review, will try to repost ASAP.

Yours,
Linus Walleij
