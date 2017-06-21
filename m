Return-Path: <SRS0=CCsS=52=rock-chips.com=huangtao@kernel.org>
Subject: Re: [PATCH 1/6] ARM: dts: rockchip: add basic dtsi file for RK3229
 SoC
References: <1497510980-23207-1-git-send-email-frank.wang@rock-chips.com>
 <25831201.s5BUplWuV7@diego>
 <354e6995-cc80-660b-41c4-535be85564c4@rock-chips.com>
 <1880551.X2BOMRmHZh@diego>
 <CAFLEztTZPeqbE++uRS-jXYUb7KzSik7=5v8+p07L788HWvwQqg@mail.gmail.com>
From: "Huang, Tao" <huangtao@rock-chips.com>
Message-ID: <e2f33dbc-d62a-a059-6ffa-3e3f5920b984@rock-chips.com>
Date: Wed, 21 Jun 2017 15:05:46 +0800
MIME-Version: 1.0
In-Reply-To: <CAFLEztTZPeqbE++uRS-jXYUb7KzSik7=5v8+p07L788HWvwQqg@mail.gmail.com>
Content-Type: text/html; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Jacob Chen <jacobchen110@gmail.com>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
Cc: Frank Wang <frank.wang@rock-chips.com>, robh+dt@kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, charles.chen@rock-chips.com, kevan.lan@rock-chips.com, wmc@rock-chips.com, =?UTF-8?B?6ZmI5YGl5rSq?= <chenjh@rock-chips.com>, Kever Yang <kever.yang@rock-chips.com>
List-ID: <devicetree@vger.kernel.org>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hi Jacob and Heiko:<br>
    <div class="moz-cite-prefix">On 2017年06月21日 12:11, Jacob Chen wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAFLEztTZPeqbE++uRS-jXYUb7KzSik7=5v8+p07L788HWvwQqg@mail.gmail.com">
      <div dir="ltr">Hi,<br>
        <br>
        2017-06-20 18:48 GMT+08:00 Heiko Stübner &lt;<a
          href="mailto:heiko@sntech.de" moz-do-not-send="true">heiko@sntech.de</a>&gt;:<br>
        &gt; Hi Frank,<br>
        &gt;<br>
        &gt; Am Dienstag, 20. Juni 2017, 15:13:00 CEST schrieb Frank
        Wang:<br>
        &gt;&gt; Hi Heiko,<br>
        &gt;&gt;<br>
        &gt;&gt; On 2017/6/19 20:30, Heiko Stübner wrote:<br>
        &gt;&gt; &gt; Hi Frank,<br>
        &gt;&gt; &gt;<br>
        &gt;&gt; &gt; Am Montag, 19. Juni 2017, 18:34:27 CEST schrieb
        Frank Wang:<br>
        &gt;&gt; &gt;&gt; On 2017/6/18 2:12, Heiko Stuebner wrote:<br>
        &gt;&gt; &gt;&gt;&gt; Am Donnerstag, 15. Juni 2017, 15:16:15
        CEST schrieb Frank Wang:<br>
        &gt;&gt; &gt;&gt;&gt;&gt; Due to some tiny differences between
        RK3228 and RK3229, this patch<br>
        &gt;&gt; &gt;&gt;&gt;&gt; adds a basic dtsi file which includes
        a new CPU opp table and PSCI<br>
        &gt;&gt; &gt;&gt;&gt;&gt; brought up support for RK3229.<br>
        &gt;&gt; &gt;&gt;&gt;&gt;<br>
        &gt;&gt; &gt;&gt;&gt;&gt; Signed-off-by: Frank Wang&lt;<a
          href="mailto:frank.wang@rock-chips.com" moz-do-not-send="true">frank.wang@rock-chips.com</a>&gt;<br>
        &gt;&gt; &gt;<br>
        &gt;&gt; &gt; [...]<br>
        &gt;&gt; &gt;<br>
        &gt;&gt; &gt;&gt;&gt;&gt; +        psci {<br>
        &gt;&gt; &gt;&gt;&gt;&gt; +                compatible =
        "arm,psci-1.0", "arm,psci-0.2";<br>
        &gt;&gt; &gt;&gt;&gt;&gt; +                method = "smc";<br>
        &gt;&gt; &gt;&gt;&gt;&gt; +        };<br>
        &gt;&gt; &gt;&gt;&gt;&gt; +};<br>
        &gt;&gt; &gt;&gt;&gt;&gt; +<br>
        &gt;&gt; &gt;&gt;&gt;&gt; +&amp;cpu0 {<br>
        &gt;&gt; &gt;&gt;&gt;&gt; +        enable-method = "psci";<br>
        &gt;&gt; &gt;&gt;&gt;&gt; +};<br>
        &gt;&gt; &gt;&gt;&gt;<br>
        &gt;&gt; &gt;&gt;&gt; Hmm, I don't really understand this.<br>
        &gt;&gt; &gt;&gt;&gt; What method of core-bringup does the
        rk3228 use? In the current<br>
        &gt;&gt; &gt;&gt;&gt; rk322x.dtsi there is no enable-method at
        all defined.<br>
        &gt;&gt; &gt;&gt;<br>
        &gt;&gt; &gt;&gt; For non-security, the same with rk3036 SoC, we
        use rk3036-smp method to<br>
        &gt;&gt; &gt;&gt; bring-up cores, and for security, we use
        arm-psci method.<br>
        &gt;&gt; &gt;&gt; As security become more and more important and
        required, we would prefer<br>
        &gt;&gt; &gt;&gt; using arm-psci method, and it is also an easy
        way to use.<br>
        &gt;&gt; &gt;&gt;<br>
        &gt;&gt; &gt;&gt;&gt; So is the rk3228 firmware using a
        different method than the rk3229?<br>
        &gt;&gt; &gt;&gt;<br>
        &gt;&gt; &gt;&gt; No, they are the same. How about I move these
        changes to rk322x.dtsi?<br>
        &gt;&gt; &gt;<br>
        &gt;&gt; &gt; yep, that is what I was getting at with my
        question ;-)<br>
        &gt;&gt; &gt;<br>
        &gt;&gt; &gt;&gt;&gt; And out of curiosity as this is a arm32
        without atf, is the psci<br>
        &gt;&gt; &gt;&gt;&gt; implementation (for uboot?) you're using
        available somewhere?<br>
        &gt;&gt; &gt;&gt;<br>
        &gt;&gt; &gt;&gt; Ah, it is included in op-tee :-)<br>
        &gt;&gt; &gt;<br>
        &gt;&gt; &gt; Is that super secret or will this be part of the
        official op-tee [0]<br>
        &gt;&gt; &gt; at some point (Similar to the ATF stuff on arm64)?<br>
        &gt;&gt;<br>
        &gt;&gt; Hmm, the op-tee itself must keep secure, but the psci
        part in it can be<br>
        &gt;&gt; extracted to public, although it may have a bit of
        secure risk.<br>
        &gt;&gt; Due to Rockchip have amended the frame of op-tee to
        support psci, we can<br>
        &gt;&gt; try to upstream these changes to official op-tee or
        push them to source<br>
        &gt;&gt; codes of Rockchip in git-hub.<br>
        &gt;<br>
        &gt; I just want to make sure, people can actually create a
        working system<br>
        &gt; with this, as there is mainline u-boot support for the
        rk3228/rk3229 in<br>
        &gt; the works - hopefully also with SPL support later on.<br>
        &gt; So I'm wondering how this is supposed to be setup?<br>
        &gt;<br>
        &gt; On arm64 we now have the SPL load the ATF, which in turn
        loads uboot, so I<br>
        &gt; guess the mechanism for the op-tee would be somehow
        similar? And there all<br>
        &gt; necessary components are available to build everything from
        source.<br>
        &gt;<br>
        &gt; I really don't care about all the other super-secret stuff
        happening in<br>
        &gt; that op-tee thingy, but I really want people to be able to
        build a complete<br>
        &gt; firmware on their machine, without having to rely on
        arbitary binary blobs.<br>
        &gt;<br>
        &gt; Which is something companies adopting Rockchip socs seem to
        rely on<br>
        &gt; a lot these days ;-) .<br>
        &gt;<br>
        &gt;<br>
        &gt; One alternative I can think of, would be to also create a
        u-boot psci<br>
        &gt; implementation for arm32, like sunxi [0] and others use for
        example.<br>
        &gt; That way people could choose where their psci should come
        from (u-boot<br>
        &gt; itself or the op-tee).<br>
        &gt;<br>
        &gt;<br>
        &gt; Heiko<br>
        &gt;<br>
        &gt; [0] <a
href="http://git.denx.de/?p=u-boot.git;a=blob;f=arch/arm/cpu/armv7/sunxi/psci.c"
          moz-do-not-send="true">http://git.denx.de/?p=u-boot.git;a=blob;f=arch/arm/cpu/armv7/sunxi/psci.c</a><br>
        &gt;<br>
        &gt;&gt;<br>
        &gt;&gt;<br>
        &gt;&gt; BR.<br>
        &gt;&gt; Frank<br>
        &gt;&gt;<br>
        &gt;&gt; &gt; Heiko<br>
        &gt;&gt; &gt;<br>
        &gt;&gt; &gt; [0]<a
          href="https://github.com/OP-TEE/optee_os/tree/master/core/arch/arm"
          moz-do-not-send="true">https://github.com/OP-TEE/optee_os/tree/master/core/arch/arm</a><br>
        &gt;<br>
        &gt;<br>
        <div><br>
        </div>
        <div>😀 Implement psci in upstream u-boot  sounds a good idea. </div>
        <div><br>
        </div>
        <div>I don't like the bundled solution, like if I want  to
          enable <span
            style="color:rgb(0,0,0);font-family:sans-serif;font-size:12.8px"> </span><span
style="color:rgb(0,0,0);font-family:sans-serif;font-size:12.8px">power
            management in my board,  i have to use OP-TEE, then i have
            to use vendor u-boot, then vendor kernel, </span><span
            style="color:rgb(0,0,0);font-family:sans-serif;font-size:12.8px">rootfs,
            tools......</span></div>
        <div><br>
        </div>
      </div>
    </blockquote>
    No. The kernel only depends on PSCI. Anyone can implement PSCI
    firmware through<br>
    OPTEE/Trusty/U-Boot/UEFI or other open source implementation. We
    don't limit<br>
    people use vendor software or not. As Frank said, we will open
    source OPTEE which<br>
    support PSCI for our chips.<br>
    BTW people can implement SMP/suspend function builtin in kernel as
    usual. We just<br>
    hope use PSCI by default, so we can support TEE more easy as arm64.<br>
    <br>
  </body>
</html>
