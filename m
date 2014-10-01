From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 0/3] ARM: rk3288 : Add PM Domain support
Date: Wed, 1 Oct 2014 13:07:50 -0700
Message-ID: <CAD=FV=VPT5qiyY==nJbb4DqKMBnj0i-_MhLRVG0ikar2qtP4=A@mail.gmail.com>
References: <1411899774-8484-1-git-send-email-jinkun.hong@rock-chips.com>
	<7hoatvvimd.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7hoatvvimd.fsf@deeprootsystems.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: "jinkun.hong" <jinkun.hong@rock-chips.com>, Russell King <linux@arm.linux.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>, Ulf Hansson <ulf.hansson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
List-Id: devicetree@vger.kernel.org

Kevin,

On Wed, Oct 1, 2014 at 9:51 AM, Kevin Hilman <khilman@kernel.org> wrote:
> +Geert, Ulf
>
> "jinkun.hong" <jinkun.hong@rock-chips.com> writes:
>
>> From: "jinkun.hong" <jinkun.hong@rock-chips.com>
>>
>> Use PM Domain framework to manage the clock.
>
> Which clock?  This changelog needs a more thorough description.


I think what he meant was:

Use the generic PM Domain framework for Rockchip

...but I agree that he could describe it more.


> Also,
> with this series alone, it's not clear how the power-domain transitions
> ever happen, since I don't see any devices hooked up to your power
> domains, or do I see your platform using runtime PM.  In order for this
> to be reviewed properely, it's important for reviewers to be able to see
> how this PM domain support will be used.

I noticed that too.  As the patchset currently stands it only ever disables...


> Also, remember that the DT is supposed to reflect the hardware, not the
> design choices of linux drivers.  Because of that, it's a little
> surprising to see clocks as properties of a power domain because clocks
> are usually properties of devices.

I haven't dug all the way into the hardware to figure out why (or if
this is really necessary), but right now the rockchip power domain
driver only leaves these clocks on during the powering on and powering
off of the power domain.  In other words to turn on the power domain:

1. Turn on all clocks
2. Flip the bit that sets the power domain on
3. Wait until hardware says power domain is on.
4. Turn off all the clocks.

...and to turn off:

1. Turn on all clocks
2. Flip the bit that sets the power domain off
3. Wait until hardware says power domain is off.
2. Turn off all the clocks.

...if the above is actually necessary when turning on and off power
domains then it seems like it is actually describing the hardware.

Maybe someone Jinkun can tell us why?

-Doug
