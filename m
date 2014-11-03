Return-Path: <yk@rock-chips.com>
Message-ID: <5457A21E.7090205@rock-chips.com>
Date: Mon, 03 Nov 2014 23:41:18 +0800
From: Kever Yang <kever.yang@rock-chips.com>
MIME-Version: 1.0
Subject: Re: [PATCH v7 0/3] ARM: rk3288 : Add PM Domain support
References: <1414135761-3406-1-git-send-email-jinkun.hong@rock-chips.com> <CAD=FV=UzgS2JtNhUB+0gbMvpW76C=12=y+ij0p6Xpbk_vAs0ww@mail.gmail.com> <20141031183213.GF32331@dtor-ws>
In-Reply-To: <20141031183213.GF32331@dtor-ws>
Content-Type: multipart/alternative;
 boundary="------------040008000303060200020107"
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Doug Anderson <dianders@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Russell King <linux@arm.linux.org.uk>, Heiko Stuebner <heiko@sntech.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "jinkun.hong" <jinkun.hong@rock-chips.com>, Linus Walleij <linus.walleij@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris <zyw@rock-chips.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------040008000303060200020107
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 11/01/2014 02:32 AM, Dmitry Torokhov wrote:
>> >I haven't been following all of the changes here, but I'll say that I
>> >just spent a bunch of time figuring out why my system wasn't properly
>> >going into suspend using your patchset after I picked up Kever's patch
>> >to disable unused clocks
>> >(https://patchwork.kernel.org/patch/5202291/).
>> >
>> >It turns out that if I go back to patch v2 of your series that suspend
>> >works great.  ...but not with v7.
>> >
>> >I got to this point because I started bisecting clocks.  I realized
>> >that I needed to leave on "aclk_vepu", "aclk_vdpu", "aclk_rga_pre",
>> >"sclk_rga", "aclk_hevc", ..., ...  As I kept finding more clocks they
>> >kept looking more and more like your list from the v2 dtsi and it
>> >became obvious.
>> >
>> >
>> >I guess that things are not properly being turned off properly due to
>> >the reason you stated in<https://lkml.org/lkml/2014/10/28/1279>.
>> >Specifically we need all the relevant clocks on in order to power
>> >things on and off.
> I guess since the platform requirement is to have all clocks on during
> power domain power transitions
That's true, I'm not sure if Jingkun have make himself clear, but
it is recommend to have all clocks on during power on/off a
power domain.

According to rk3288 trm 4.6.1, obviously we need clock for  power
domain switch, although I'm not sure we need _all _clock on,
but it is safe to have all clock on. And we won't get risk with power
lost of clock management when we turn on all the clocks for
power domain switch, because we always operate the clocks
in pairs and disable the clock after domain power off.
>   the easiest way is indeed to list all
> relevant clocks in power domain description instead of trying to fetch
> them from devices that compose power domain. I believe it is more
> correct because:
>
> 1. Placing a device into power domain is done at probe time so
> inherently not all clocks are enumerated when first device is being
> probed and we trun the power to the domain.
>
> 2. We may not have drivers for all devices enabled on a given product
> and so not all device will not be bound to a driver which cause them be
> detached from their power domain.
Do you mean we should get the clock management for powerdomain
in V2 back?

Hi Greet, Ulf, Kevin,
      do you agree?

- Kever


--------------040008000303060200020107
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hi Dmitry,<br>
    <br>
    <div class="moz-cite-prefix">On 11/01/2014 02:32 AM, Dmitry Torokhov
      wrote:<br>
    </div>
    <blockquote cite="mid:20141031183213.GF32331@dtor-ws" type="cite">
      <blockquote type="cite" style="color: #000000;">
        <pre wrap=""><span class="moz-txt-citetags">&gt; </span>I haven't been following all of the changes here, but I'll say that I
<span class="moz-txt-citetags">&gt; </span>just spent a bunch of time figuring out why my system wasn't properly
<span class="moz-txt-citetags">&gt; </span>going into suspend using your patchset after I picked up Kever's patch
<span class="moz-txt-citetags">&gt; </span>to disable unused clocks
<span class="moz-txt-citetags">&gt; </span>(<a moz-do-not-send="true" class="moz-txt-link-freetext" href="https://patchwork.kernel.org/patch/5202291/">https://patchwork.kernel.org/patch/5202291/</a>).
<span class="moz-txt-citetags">&gt; </span>
<span class="moz-txt-citetags">&gt; </span>It turns out that if I go back to patch v2 of your series that suspend
<span class="moz-txt-citetags">&gt; </span>works great.  ...but not with v7.
<span class="moz-txt-citetags">&gt; </span>
<span class="moz-txt-citetags">&gt; </span>I got to this point because I started bisecting clocks.  I realized
<span class="moz-txt-citetags">&gt; </span>that I needed to leave on "aclk_vepu", "aclk_vdpu", "aclk_rga_pre",
<span class="moz-txt-citetags">&gt; </span>"sclk_rga", "aclk_hevc", ..., ...  As I kept finding more clocks they
<span class="moz-txt-citetags">&gt; </span>kept looking more and more like your list from the v2 dtsi and it
<span class="moz-txt-citetags">&gt; </span>became obvious.
<span class="moz-txt-citetags">&gt; </span>
<span class="moz-txt-citetags">&gt; </span>
<span class="moz-txt-citetags">&gt; </span>I guess that things are not properly being turned off properly due to
<span class="moz-txt-citetags">&gt; </span>the reason you stated in <a moz-do-not-send="true" class="moz-txt-link-rfc2396E" href="https://lkml.org/lkml/2014/10/28/1279">&lt;https://lkml.org/lkml/2014/10/28/1279&gt;</a>.
<span class="moz-txt-citetags">&gt; </span>Specifically we need all the relevant clocks on in order to power
<span class="moz-txt-citetags">&gt; </span>things on and off.
</pre>
      </blockquote>
      <pre wrap="">I guess since the platform requirement is to have all clocks on during
power domain power transitions</pre>
    </blockquote>
    That's true, I'm not sure if Jingkun have make himself clear, but<br>
    it is recommend to have all clocks on during power on/off a <br>
    power domain.<br>
    <br>
    According to rk3288 trm 4.6.1, obviously we need clock for� power<br>
    domain switch, although I'm not sure we need� <u>all </u>clock on,<br>
    but it is safe to have all clock on. And we won't get risk with
    power<br>
    lost of clock management when we turn on all the clocks for <br>
    power domain switch, because we always operate the clocks <br>
    in pairs and disable the clock after domain power off.<br>
    <blockquote cite="mid:20141031183213.GF32331@dtor-ws" type="cite">
      <pre wrap=""> the easiest way is indeed to list all
relevant clocks in power domain description instead of trying to fetch
them from devices that compose power domain. I believe it is more
correct because:

1. Placing a device into power domain is done at probe time so
inherently not all clocks are enumerated when first device is being
probed and we trun the power to the domain.

2. We may not have drivers for all devices enabled on a given product
and so not all device will not be bound to a driver which cause them be
detached from their power domain.
</pre>
    </blockquote>
    Do you mean we should get the clock management for powerdomain<br>
    in V2 back?<br>
    <br>
    Hi Greet, Ulf, Kevin,<br>
    ���� do you agree?<br>
    <br>
    - Kever<br>
    <br>
  </body>
</html>

--------------040008000303060200020107--
