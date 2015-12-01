From: Thomas Kaiser <Thomas.Kaiser-HBiBh4CdNZE5WgrkcBd8vg@public.gmane.org>
Subject: Re: Re: [PATCH] ARM: dts: sun7i: Add dts file for the
 lamobo-r1 board
Date: Tue, 01 Dec 2015 08:01:25 +0100
Message-ID: <D2830123.E6258%Thomas.Kaiser@kaiser-edv.de>
References: <1448046713-13579-1-git-send-email-hdegoede@redhat.com>
 <20151122195925.GR32142@lukather>
 <5652CE10.1020808@redhat.com>
 <D279EE2F.E5EF6%Thomas.Kaiser@kaiser-edv.de>
 <20151130190329.GD3664@lukather>
Reply-To: thomas.kaiser-HBiBh4CdNZE5WgrkcBd8vg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDQ6N3ODDQIM3C7VWICRUBFA4MQIE-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20151130190329.GD3664@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jelle de Jong <jelledejong-OIcJOM8/mISwoUgIn9SVlA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Maxime Ripard wrote:

>Quite the opposite actually, it would allow people that want to
>deviate from the standard to do so while allowing people that
>want to follow that standard to do so as well.

Well, the majority of people that buy boards because of this specific
26/40 pin header can't do that. They expect that everything works as with
the Raspberry Pi (a few GPIOs here, I2C there and so on) and will simply
have to give up if they (or let's better say the distro they use) switched
to mainline kernel and nothing works any longer _as expected_.

These people don't know where device trees grow and also don't care. They
expect compatibility to a 'de facto' standard and the hardware vendors
producing boards with this specific 26/40 pin header try to be compliant
to that by modifying pin definitions in the OS images they provide or
recommend. So maybe it simply doesn't matter how this stuff is defined
since it gets patched back in in every 'distro' ready for the average user.

At least that's the case for the Lamobo R1 we're talking about. As said
before: No one will use that board without also applying the OpenWRT
patchset to be able to use the internal switch IC. So I doubt anybody will
use the .dts we're talking here about since the OS images people will use
already include their own:

    http://linux-sunxi.org/Lamobo_R1#Images

Best regards,

Thomas
