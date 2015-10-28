Return-Path: <sasukewxt@163.com>
Subject: Re: [PATCH v1 3/3] ARM64: dts: rk3368: Add mailbox device nodes
References: <201510280433.KeMm1w9H%fengguang.wu@intel.com>
From: Caesar Wang <sasukewxt@163.com>
Message-ID: <5630835F.5020907@163.com>
Date: Wed, 28 Oct 2015 16:12:15 +0800
MIME-Version: 1.0
In-Reply-To: <201510280433.KeMm1w9H%fengguang.wu@intel.com>
Content-Type: multipart/alternative;
 boundary="------------000305090409080700070704"
To: kbuild test robot <lkp@intel.com>
Cc: Caesar Wang <wxt@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Heiko Stuebner <heiko@sntech.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, frank.wang@rock-chips.com, Catalin Marinas <catalin.marinas@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, kbuild-all@01.org, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------000305090409080700070704
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi smart robot,

在 2015年10月28日 04:33, kbuild test robot 写道:
> Hi Caesar,
>
> [auto build test ERROR on rockchip/for-next -- if it's inappropriate base, please suggest rules for selecting the more suitable base]
>
> url:    https://github.com/0day-ci/linux/commits/Caesar-Wang/mailbox-rockchip-Add-mailbox-driver-for-Rockchip-platform/20151027-153608
> config: arm64-allyesconfig (attached as .config)
> reproduce:
>          wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # save the attached .config to linux build tree
>          make.cross ARCH=arm64
>
> All errors (new ones prefixed by >>):
>
>>> Error: arch/arm64/boot/dts/rockchip/rk3368.dtsi:490.3-4 syntax error
>     FATAL ERROR: Unable to parse input tree
>
Thanks for pointing out my figner wrong.

-	reg = <0x0 0xff6b0000 0x0 0x1000>,
+	reg = <0x0 0xff6b0000 0x0 0x1000>;


> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> [attachment]
>
> .config.gz
> download: http://u.163.com/t0/av3utwEyL
>
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


--------------000305090409080700070704
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hi smart robot,<br>
     <br>
    <div class="moz-cite-prefix">在 2015年10月28日 04:33, kbuild test robot
      写道:<br>
    </div>
    <blockquote
      cite="mid:201510280433.KeMm1w9H%25fengguang.wu@intel.com"
      type="cite">
      <pre wrap="">Hi Caesar,

[auto build test ERROR on rockchip/for-next -- if it's inappropriate base, please suggest rules for selecting the more suitable base]

url:    <a class="moz-txt-link-freetext" href="https://github.com/0day-ci/linux/commits/Caesar-Wang/mailbox-rockchip-Add-mailbox-driver-for-Rockchip-platform/20151027-153608">https://github.com/0day-ci/linux/commits/Caesar-Wang/mailbox-rockchip-Add-mailbox-driver-for-Rockchip-platform/20151027-153608</a>
config: arm64-allyesconfig (attached as .config)
reproduce:
        wget <a class="moz-txt-link-freetext" href="https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross">https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross</a> -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        make.cross ARCH=arm64 

All errors (new ones prefixed by &gt;&gt;):

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="">Error: arch/arm64/boot/dts/rockchip/rk3368.dtsi:490.3-4 syntax error
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="">   FATAL ERROR: Unable to parse input tree

</pre>
    </blockquote>
    Thanks for pointing out my figner wrong.<br>
    <pre wrap="">-	reg = &lt;0x0 0xff6b0000 0x0 0x1000&gt;,
+	reg = &lt;0x0 0xff6b0000 0x0 0x1000&gt;;
</pre>
    <br>
    <blockquote
      cite="mid:201510280433.KeMm1w9H%25fengguang.wu@intel.com"
      type="cite">
      <pre wrap="">
---
0-DAY kernel test infrastructure                Open Source Technology Center
<a class="moz-txt-link-freetext" href="https://lists.01.org/pipermail/kbuild-all">https://lists.01.org/pipermail/kbuild-all</a>                   Intel Corporation
[attachment]

.config.gz
download: <a class="moz-txt-link-freetext" href="http://u.163.com/t0/av3utwEyL">http://u.163.com/t0/av3utwEyL</a>

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
Linux-rockchip mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Linux-rockchip@lists.infradead.org">Linux-rockchip@lists.infradead.org</a>
<a class="moz-txt-link-freetext" href="http://lists.infradead.org/mailman/listinfo/linux-rockchip">http://lists.infradead.org/mailman/listinfo/linux-rockchip</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------000305090409080700070704--
