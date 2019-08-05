From: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH v2 6/6] ARM: dts: mmp2: add OLPC XO 1.75 machine
Date: Mon, 5 Aug 2019 11:56:00 +0200 (CEST)
Message-ID: <1387772868.4330.1564998960018.JavaMail.zimbra@v3.sk>
References: <20190802103326.531250-1-lkundrak@v3.sk> <20190802103326.531250-7-lkundrak@v3.sk> <20190803085824.GB8224@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190803085824.GB8224@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

----- On Aug 3, 2019, at 10:58 AM, Pavel Machek pavel@ucw.cz wrote:

> On Fri 2019-08-02 12:33:26, Lubomir Rintel wrote:
>> This is a fairly complete description of an OLPC XO 1.75 laptop.
>> What's missing for now is the GPU, LCD controller, DCON, the panel and
>> audio.
> 
> Ok, but I need GPU/LCD/panel... that's my only output. Is video
> expected to work in 5.2? Does the firmware pass right device tree,
> including the GPU/LCD/DCON?

The firmware (and the dts) uses a simple-framebuffer. You won't get
any nifty features, but you'll get a framebuffer.

Hopefully we'll get a proper DRM video soon. The status is roughly
as follows:

LCDC: potentially supported by the Armada DRM driver. Patches sent to
Russell King some months ago, not there yet. I'd prefer not to nag him.

DCON: Russell dislikes the idea of a DRM bridge, DRM maintainers prefer
if the driver was not a DRM encoder driver. This seems to require
quite some work to fix [1].

[1] https://www.spinics.net/lists/dri-devel/msg201927.html

GPU: supported by the etnaviv driver, good enough for 2D acceleration
to work with xorg-x11-video-armada driver. 3D (weston and mutter alike)
is broken. To add this to the device tree, the clock and power needs
to be figured out.

> Is there config somewhere I could use?
> 
> Thanks a lot,
>								Pavel
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures)
> http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
