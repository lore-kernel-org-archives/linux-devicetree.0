Return-Path: <caesar.wang@rock-chips.com>
Message-ID: <547D1E06.1040707@rock-chips.com>
Date: Tue, 02 Dec 2014 10:03:50 +0800
From: Caesar Wang <caesar.wang@rock-chips.com>
MIME-Version: 1.0
Subject: Re: [PATCH v12 0/3] ARM: rk3288: Add PM Domain support
References: <1416217842-4716-1-git-send-email-caesar.wang@rock-chips.com> <1454366.cVgT9MeyeC@diego> <CAAFQd5BvNKsuRmMkh7C9hYPQCwiDFXUuN2SwcxtfLu5KmHdymA@mail.gmail.com>
In-Reply-To: <CAAFQd5BvNKsuRmMkh7C9hYPQCwiDFXUuN2SwcxtfLu5KmHdymA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------010500060408020109010001"
To: Tomasz Figa <tfiga@chromium.org>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: khilman@kernel.org, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, dianders@chromium.org, linux-rockchip@lists.infradead.org, Ulf Hansson <ulf.hansson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, fzf@rock-chips.com, cf@rock-chips.com, chris.zhong@rock-chips.com, xxm@rock-chips.com, chm@rock-chips.com, djkurtz@chromium.org, "jinkun.hong" <jinkun.hong@rock-chips.com>, Jack Dai <jack.dai@rock-chips.com>
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------010500060408020109010001
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2014年12月01日 22:57, Tomasz Figa wrote:
> On Fri, Nov 28, 2014 at 6:57 PM, Heiko Stübner <heiko@sntech.de> wrote:
>> Am Montag, 17. November 2014, 17:50:38 schrieb Caesar Wang:
>>>      Add power domain drivers based on generic power domain for
>>>      Rockchip platform, and support RK3288.
>>>
>>>      https://chromium-review.googlesource.com/#/c/220253/9
>>>      This is the GPU driver, add the following information in DT,
>>>      and it can support the PMDOMAIN
>> I'm not sure what to do with this series. Kevin had concerns about the clocks
>> being part of the power-domains and I don't see them actually addressed and/or
>> Kevin being satisfied - actually he isn't even on the recipients list of this
>> version of the series.
>>
>>
>> @Ceasar: you should include people being part of important previous
>> conversations in new versions of patchsets - especially when they have voiced
>> concerns.
>>
Thanks Heiko.
OK, Sorry.
I  missed some important people, I will add them in next patch.


>>
>> I've added Tomasz whom I remember having previous experience on the Exynos
>> Powerdomains, so maybe he can add some other perspective - new ideas.
>>
> Thanks Heiko for adding me to this thread.
>
>> @Tomasz: this is the part of Kevin's concerns from v10 of the powerdomain
>> series:
>>
>> Am Donnerstag, 13. November 2014, 12:24:47 schrieben Kevin Hilman:
>>> Heiko Stübner <heiko@sntech.de> writes:
>>>> Am Dienstag, 11. November 2014, 08:53:13 schrieb Kevin Hilman:
>>>>> I still don't like having lists of clocks in the power-domain DT.
>>>>>
>>>>> DT is supposed to describe the hardware, and clocks are properties of
>>>>> devices, not power-domains, so the DT description should follow from
>>>>> that.
>>>> on the policy side one could argue that if the clock needs to be enabled
>>>> to
>>>> achieve sucessful domain state-changes, that it is also a property of the
>>>> domain itself in addition to the device.
>>> You could, but from a hardware perspective, the clock is a property of
>>> the device.
>>>
> Well, the system controller which control the power domains is also a
> device. In DT we do not represent the domains alone, but rather the
> system controller, which acts as a power domain provider. If it need
> certain clocks to do its work, then I believe it should have them
> listed in its node. However the dependencies between clocks and power
> domains are not clear to me either, so I don't have any strong opinion
> on whether this would be the best solution.
>
>>>> And on the pratical side we don't have drivers nor bindings for a big part
>>>> of the domain users - and this will probably be true for quite some time.
>>>> This of course makes it very impractical (or impossible) to
>>> This doesn't sound impossible at all.
>>>
>>> You have to collect the clocks anyways.  The only debate is whether to
>>> list them in the device node or the power-domain node.
>>>
>>> Even for devices without drivers, you just need a minimal node in the DT if
>>> which lists the clocks and has a phandle to the parent power domain.
>>>
>>> Sounds rather simple to me, and since the DT is supposed to describe the
>>> hardware, doing it this way makes looking at the DT actually help
>>> understand the hardware.
> If the dependency between clocks and power domain is kind of "all
> clocks of all devices in this domain should be enabled when performing
> operation on the domain" then IMHO it should be more reasonable to put
> the clocks only in nodes of respective devices and then follow the
> links from the domain to devices inside of it and retrieve the clocks
> from there, so that they don't have to be duplicated. , we don't
> like redundancy in DT.

Thanks Tomasz for commnets.

Frankly,I agree your points,we can manager clocks in every devices of PM 
domains.

I remember jinkun havs submitted the newest v7 patch to fix it.
dts:  https://patchwork.kernel.org/patch/5144471/
driver: https://patchwork.kernel.org/patch/5144481/

But,this series patchs will  cause some problems.

Says:
we always be needed turn off clocks to save power when
the system enter suspend.So we need to enumerate the clocks are needed
to switch power doamin on and off .  I think the patch v7 will be an option
if devices of PM domains has the driver to manager the clocks. Now we only have the gpu and video driver.
but clocks for parts like the gpu (mali), hevc, vcodec (video
encoder/decoder), rga (2d stuff), iep, isp. These devices we need add the drives.

Otherwise,suspend/resume will fail. I know someone don't like to do so.
Maybe It is not perfect solution but just a workaround.
YUP,I believe someone can propose a better solution,but so far,I haven't a better way to solve it.  :-(


> Best regards,
> Tomasz
>
>
>


--------------010500060408020109010001
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <div class="moz-cite-prefix">On 2014年12月01日 22:57, Tomasz Figa
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAAFQd5BvNKsuRmMkh7C9hYPQCwiDFXUuN2SwcxtfLu5KmHdymA@mail.gmail.com"
      type="cite">
      <pre wrap="">On Fri, Nov 28, 2014 at 6:57 PM, Heiko Stübner <a class="moz-txt-link-rfc2396E" href="mailto:heiko@sntech.de">&lt;heiko@sntech.de&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">
Am Montag, 17. November 2014, 17:50:38 schrieb Caesar Wang:
</pre>
        <blockquote type="cite">
          <pre wrap="">    Add power domain drivers based on generic power domain for
    Rockchip platform, and support RK3288.

    <a class="moz-txt-link-freetext" href="https://chromium-review.googlesource.com/#/c/220253/9">https://chromium-review.googlesource.com/#/c/220253/9</a>
    This is the GPU driver, add the following information in DT,
    and it can support the PMDOMAIN
</pre>
        </blockquote>
        <pre wrap="">
I'm not sure what to do with this series. Kevin had concerns about the clocks
being part of the power-domains and I don't see them actually addressed and/or
Kevin being satisfied - actually he isn't even on the recipients list of this
version of the series.


@Ceasar: you should include people being part of important previous
conversations in new versions of patchsets - especially when they have voiced
concerns.

</pre>
      </blockquote>
    </blockquote>
    Thanks Heiko.<br>
    OK, Sorry.<br>
    I  missed some important people, I will add them in next patch.<br>
    <br>
    <br>
    <blockquote
cite="mid:CAAFQd5BvNKsuRmMkh7C9hYPQCwiDFXUuN2SwcxtfLu5KmHdymA@mail.gmail.com"
      type="cite">
      <blockquote type="cite">
        <pre wrap="">

I've added Tomasz whom I remember having previous experience on the Exynos
Powerdomains, so maybe he can add some other perspective - new ideas.

</pre>
      </blockquote>
      <pre wrap="">
Thanks Heiko for adding me to this thread.

</pre>
      <blockquote type="cite">
        <pre wrap="">
@Tomasz: this is the part of Kevin's concerns from v10 of the powerdomain
series:

Am Donnerstag, 13. November 2014, 12:24:47 schrieben Kevin Hilman:
</pre>
        <blockquote type="cite">
          <pre wrap="">Heiko Stübner <a class="moz-txt-link-rfc2396E" href="mailto:heiko@sntech.de">&lt;heiko@sntech.de&gt;</a> writes:
</pre>
          <blockquote type="cite">
            <pre wrap="">Am Dienstag, 11. November 2014, 08:53:13 schrieb Kevin Hilman:
</pre>
            <blockquote type="cite">
              <pre wrap="">I still don't like having lists of clocks in the power-domain DT.

DT is supposed to describe the hardware, and clocks are properties of
devices, not power-domains, so the DT description should follow from
that.
</pre>
            </blockquote>
            <pre wrap="">
on the policy side one could argue that if the clock needs to be enabled
to
achieve sucessful domain state-changes, that it is also a property of the
domain itself in addition to the device.
</pre>
          </blockquote>
          <pre wrap="">
You could, but from a hardware perspective, the clock is a property of
the device.

</pre>
        </blockquote>
      </blockquote>
      <pre wrap="">
Well, the system controller which control the power domains is also a
device. In DT we do not represent the domains alone, but rather the
system controller, which acts as a power domain provider. If it need
certain clocks to do its work, then I believe it should have them
listed in its node. However the dependencies between clocks and power
domains are not clear to me either, so I don't have any strong opinion
on whether this would be the best solution.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="">And on the pratical side we don't have drivers nor bindings for a big part
of the domain users - and this will probably be true for quite some time.
This of course makes it very impractical (or impossible) to
</pre>
          </blockquote>
          <pre wrap="">
This doesn't sound impossible at all.

You have to collect the clocks anyways.  The only debate is whether to
list them in the device node or the power-domain node.

Even for devices without drivers, you just need a minimal node in the DT if
which lists the clocks and has a phandle to the parent power domain.

Sounds rather simple to me, and since the DT is supposed to describe the
hardware, doing it this way makes looking at the DT actually help
understand the hardware.
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <blockquote
cite="mid:CAAFQd5BvNKsuRmMkh7C9hYPQCwiDFXUuN2SwcxtfLu5KmHdymA@mail.gmail.com"
      type="cite">
      <pre wrap="">
If the dependency between clocks and power domain is kind of "all
clocks of all devices in this domain should be enabled when performing
operation on the domain" then IMHO it should be more reasonable to put
the clocks only in nodes of respective devices and then follow the
links from the domain to devices inside of it and retrieve the clocks
from there, so that they don't have to be duplicated. , we don't
like redundancy in DT.
</pre>
    </blockquote>
    <br>
    Thanks Tomasz for commnets.<br>
    <br>
    Frankly,I agree your points,we can manager clocks in every devices
    of PM domains.<br>
    <br>
    I remember jinkun havs submitted the newest v7 patch to fix it.<br>
    dts:  <a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/patch/5144471/">https://patchwork.kernel.org/patch/5144471/</a><br>
    driver: <a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/patch/5144481/">https://patchwork.kernel.org/patch/5144481/</a><br>
    <br>
    But,this series patchs will  cause some problems.<br>
    <pre wrap="">Says:
we always be needed turn off clocks to save power when
the system enter suspend.So we need to enumerate the clocks are needed
to switch power doamin on and off .  I think the patch v7 will be an option 
if devices of PM domains has the driver to manager the clocks. Now we only have the gpu and video driver.
but clocks for parts like the gpu (mali), hevc, vcodec (video
encoder/decoder), rga (2d stuff), iep, isp. These devices we need add the drives.

Otherwise,<meta http-equiv="content-type" content="text/html; charset=utf-8">suspend/resume will fail. I know someone don't like to do so.
Maybe It is not perfect solution but just a workaround.
YUP,I believe someone can propose a better solution,but so far,I haven't a better way to solve it.<span class="moz-smiley-s2"><span> :-( </span></span>
<pre style="font-size: 12px; white-space: pre-wrap; max-width: 80em; padding-left: 0.7em; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"></pre></pre>
    <br>
    <blockquote
cite="mid:CAAFQd5BvNKsuRmMkh7C9hYPQCwiDFXUuN2SwcxtfLu5KmHdymA@mail.gmail.com"
      type="cite">
      <pre wrap="">
Best regards,
Tomasz



</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------010500060408020109010001--
