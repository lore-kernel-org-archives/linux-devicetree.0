Return-Path: <sboyd@codeaurora.org>
Message-ID: <541249B8.301@codeaurora.org>
Date: Thu, 11 Sep 2014 18:17:44 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] clocksource: arch_timer: Allow the device tree to
 specify the physical timer
References: <1410452204-7277-1-git-send-email-dianders@chromium.org> <20140911164710.GW6158@arm.com> <5411D528.4050605@arm.com> <CAD=FV=XMmizxJFPj0FEhJ7Gk4ZcQaUJDxf_Qq5kGKSvxDFVmzg@mail.gmail.com> <5411DA67.2040402@arm.com> <CAD=FV=UQfo4J3P4wGjOhQZQ5KXKgYAdjPsi1ykKZxQw-FwJz8w@mail.gmail.com> <5411DF5D.8060906@arm.com> <54123697.4070804@codeaurora.org> <CAPz6YkUTXU9_b2BU5QghKTHVTJ3ngVX9EOzsMWnjigtV9TioHw@mail.gmail.com>
In-Reply-To: <CAPz6YkUTXU9_b2BU5QghKTHVTJ3ngVX9EOzsMWnjigtV9TioHw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------000003020603090500040908"
To: Sonny Rao <sonnyrao@chromium.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Doug Anderson <dianders@chromium.org>, Will Deacon <Will.Deacon@arm.com>, "olof@lixom.net" <olof@lixom.net>, Catalin Marinas <Catalin.Marinas@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, Sudeep Holla <Sudeep.Holla@arm.com>, Christopher Covington <cov@codeaurora.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Nathan Lynch <Nathan_Lynch@mentor.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------000003020603090500040908
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/11/14 17:14, Sonny Rao wrote:
> On Thu, Sep 11, 2014 at 4:56 PM, Stephen Boyd <sboyd@codeaurora.org
> <mailto:sboyd@codeaurora.org>> wrote:
>
>
>     Where does this platform jump to when a CPU comes up? Is it
>     rockchip_secondary_startup()? I wonder if that path could have this
>     little bit of assembly to poke the cntvoff in monitor mode and
>     then jump
>     to secondary_startup()? Before we boot any secondary CPUs we could
>     also
>     read the cntvoff for CPU0 in the platform specific layer (where we
>     know
>     we're running in secure mode) and then use that value as the "reset"
>     value for the secondaries. Or does this platform boot up in secure
>     mode
>     some times and non-secure mode other times?
>
>
> Yes, In our case, with our firmware, we will go through some internal
> Rom code and then jump to rockchip_secondary_startup, but I don't
> think it's correct to force all users of this SoC to do it that way.

What's being forced? The way internal rom jumps to sram? Is there any
other way that secondary CPUs come out of reset on this SoC? From
looking at the code it seems like the only path is internal rom jumps to
sram (where rockchip_secondary_trampoline lives) which jumps to
rockchip_secondary_startup() which then does an invalidate and jump to
secondary_startup(). Linux controls everything besides the internal rom.
Is something different in your case?

>  If there were a reasonable way to determine for sure that we are in
> secure mode, then yes we could do what you're suggesting, and I'd be
> happy to code that up.
>
> I think the problem is that there isn't a great way to determine
> whether we're in secure mode or not, and this is maybe by design?  I
> don't particularly understand that design choice.  It would be nice to
> hear some rationale from ARM folks.
>

I'm thinking we would have a different boot-method for secure vs.
non-secure and then we would know to configure cntvoff or not based on
the boot method. Isn't that a reasonable way of knowing what should be
done? It seems like we can at least modify the DT for this SoC.

I still wonder if there is such a bootloader/hypervisor/rom that's
putting this SoC into non-secure mode and not configuring cntvoff.
Doug's comments seem to suggest that the whole world would be different
if this were true. Maybe Heiko knows?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation


--------------000003020603090500040908
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 09/11/14 17:14, Sonny Rao wrote:<br>
    </div>
    <blockquote
cite="mid:CAPz6YkUTXU9_b2BU5QghKTHVTJ3ngVX9EOzsMWnjigtV9TioHw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">On Thu, Sep 11, 2014 at 4:56 PM,
            Stephen Boyd <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:sboyd@codeaurora.org" target="_blank">sboyd@codeaurora.org</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex"><span
                class=""><br>
              </span>Where does this platform jump to when a CPU comes
              up? Is it<br>
              rockchip_secondary_startup()? I wonder if that path could
              have this<br>
              little bit of assembly to poke the cntvoff in monitor mode
              and then jump<br>
              to secondary_startup()? Before we boot any secondary CPUs
              we could also<br>
              read the cntvoff for CPU0 in the platform specific layer
              (where we know<br>
              we're running in secure mode) and then use that value as
              the "reset"<br>
              value for the secondaries. Or does this platform boot up
              in secure mode<br>
              some times and non-secure mode other times?<br>
            </blockquote>
            <div><br>
            </div>
            <div>Yes, In our case, with our firmware, we will go through
              some internal Rom code and then jump to
              rockchip_secondary_startup, but I don't think it's correct
              to force all users of this SoC to do it that way. </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    What's being forced? The way internal rom jumps to sram? Is there
    any other way that secondary CPUs come out of reset on this SoC?
    From looking at the code it seems like the only path is internal rom
    jumps to sram (where rockchip_secondary_trampoline lives) which
    jumps to rockchip_secondary_startup() which then does an invalidate
    and jump to secondary_startup(). Linux controls everything besides
    the internal rom. Is something different in your case?<br>
    <br>
    <blockquote
cite="mid:CAPz6YkUTXU9_b2BU5QghKTHVTJ3ngVX9EOzsMWnjigtV9TioHw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div> If there were a reasonable way to determine for sure
              that we are in secure mode, then yes we could do what
              you're suggesting, and I'd be happy to code that up.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <blockquote
cite="mid:CAPz6YkUTXU9_b2BU5QghKTHVTJ3ngVX9EOzsMWnjigtV9TioHw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>I think the problem is that there isn't a great way to
              determine whether we're in secure mode or not, and this is
              maybe by design?  I don't particularly understand that
              design choice.  It would be nice to hear some rationale
              from ARM folks.</div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    I'm thinking we would have a different boot-method for secure vs.
    non-secure
    and then we would know to configure cntvoff or not based on the boot
    method. Isn't that a reasonable way of knowing what should be done?
    It seems like we can at least modify the DT for this SoC. <br>
    <br>
    I still wonder if there is such a bootloader/hypervisor/rom that's
    putting this SoC into non-secure mode and not configuring cntvoff.
    Doug's comments seem to suggest that the whole world would be
    different if this were true. Maybe Heiko knows?<br>
    <pre class="moz-signature" cols="72">-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation</pre>
  </body>
</html>

--------------000003020603090500040908--
