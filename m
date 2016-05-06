Return-Path: <sdharia@codeaurora.org>
Subject: Re: [PATCH V5 1/6] SLIMbus: Device management on SLIMbus
References: <2745420.JjpjMPLp2B@wuerfel> <20160429111710.GW3217@sirena.org.uk>
From: Sagar Dharia <sdharia@codeaurora.org>
Message-ID: <a2055867-e25e-2892-c3fd-1bec26999942@codeaurora.org>
Date: Fri, 6 May 2016 11:35:09 -0600
MIME-Version: 1.0
In-Reply-To: <20160429111710.GW3217@sirena.org.uk>
Content-Type: multipart/alternative;
 boundary="------------042F4EE460B0F4F6C169D71E"
To: Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, sheetal.tigadoli@gmail.com, linux-arm-msm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------042F4EE460B0F4F6C169D71E
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/2016 5:17 AM, Mark Brown wrote:
> On Thu, Apr 28, 2016 at 06:49:23PM +0200, Arnd Bergmann wrote:
>> On Thursday 28 April 2016 17:39:20 Mark Brown wrote:
>>> It's not just platforms that use these things though - there's things
>>> like the SolarFlare NICs where the firmware update mechanism essentially
>>> involves exposing a SPI flash as part of a PCI device and we just merged
>>> an ASoC driver for a video card which was reusing some existing IPs and
>>> chips.
>> That's of course fine: you essentially have a discoverable bus there,
>> and if we need something like that, we can always add it later to
>> any subsystem.
> No, the issue with those cases is that there are devices on discoverable
> buses that instantiate non-discoverable buses as part of the
> discoverable device so the implementation of the discoverable device is
> in part essentially a board file.
>
>> In contrast, the interface in the proposed slimbus subsystem seems
>> designed for board files, and is in the best case just dead code
>> that can be removed, or has a risk of being misused e.g. if some
>> device manufacturer decides to use a board file for this instead
>> of describing the slimbus slaves in DT.
> Which can be more of a pain than it should be if the code has been
> written to assume that all the world is DT.  That's the most problematic
> bit of this meme - I've seen people doing things like duplicating IP
> drivers inside larger devices because they don't think they're allowed
> to reuse the IP driver.  We can fix this sort of thing up when we notice
> it but we should also try to avoid people making the mistakes in the
> first place since it saves everyone a lot of effort.  With subsystems
> and to a lesser extent off SoC drivers we need to be careful about just
> blindly removing non-DT code and writing things so they're hard to use
> without DT.
>
> Like I say in this case I think the board file stuff is probably never
> going to get used so it's probably sensible to remove that code but it
> does need to be thought about.
I agree that the board-file stuff isn't going to be used and will remove it.
I will merge patch1 and patch2 and we can later add ACPI 
support/board-file support if needed.

Thanks for the comments
Sagar


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation


--------------042F4EE460B0F4F6C169D71E
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 4/29/2016 5:17 AM, Mark Brown wrote:<br>
    </div>
    <blockquote cite="mid:20160429111710.GW3217@sirena.org.uk"
      type="cite">
      <pre wrap="">On Thu, Apr 28, 2016 at 06:49:23PM +0200, Arnd Bergmann wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">On Thursday 28 April 2016 17:39:20 Mark Brown wrote:
</pre>
      </blockquote>
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="">It's not just platforms that use these things though - there's things
like the SolarFlare NICs where the firmware update mechanism essentially
involves exposing a SPI flash as part of a PCI device and we just merged
an ASoC driver for a video card which was reusing some existing IPs and
chips.
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">That's of course fine: you essentially have a discoverable bus there,
and if we need something like that, we can always add it later to
any subsystem.
</pre>
      </blockquote>
      <pre wrap="">
No, the issue with those cases is that there are devices on discoverable
buses that instantiate non-discoverable buses as part of the
discoverable device so the implementation of the discoverable device is
in part essentially a board file.

</pre>
      <blockquote type="cite">
        <pre wrap="">In contrast, the interface in the proposed slimbus subsystem seems
designed for board files, and is in the best case just dead code
that can be removed, or has a risk of being misused e.g. if some
device manufacturer decides to use a board file for this instead
of describing the slimbus slaves in DT.
</pre>
      </blockquote>
      <pre wrap="">
Which can be more of a pain than it should be if the code has been
written to assume that all the world is DT.  That's the most problematic
bit of this meme - I've seen people doing things like duplicating IP
drivers inside larger devices because they don't think they're allowed
to reuse the IP driver.  We can fix this sort of thing up when we notice
it but we should also try to avoid people making the mistakes in the
first place since it saves everyone a lot of effort.  With subsystems
and to a lesser extent off SoC drivers we need to be careful about just
blindly removing non-DT code and writing things so they're hard to use
without DT.

Like I say in this case I think the board file stuff is probably never
going to get used so it's probably sensible to remove that code but it
does need to be thought about.
</pre>
    </blockquote>
    I agree that the board-file stuff isn't going to be used and will
    remove it.<br>
    I will merge patch1 and patch2 and we can later add ACPI
    support/board-file support if needed.<br>
    <br>
    Thanks for the comments<br>
    Sagar<br>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation</pre>
  </body>
</html>

--------------042F4EE460B0F4F6C169D71E--
