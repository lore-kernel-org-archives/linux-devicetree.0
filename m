Return-Path: <caesar.upstream@gmail.com>
Subject: Re: [PATCH v3 10/10] arm64: dts: Enable the Thermal on R88 board
References: <201511082118.g4TUWjlz%fengguang.wu@intel.com>
From: Caesar Wang <caesar.upstream@gmail.com>
Message-ID: <563F58BC.3050409@gmail.com>
Date: Sun, 8 Nov 2015 22:14:20 +0800
MIME-Version: 1.0
In-Reply-To: <201511082118.g4TUWjlz%fengguang.wu@intel.com>
Content-Type: multipart/alternative;
 boundary="------------070707050606060407050601"
To: kbuild test robot <lkp@intel.com>
Cc: Caesar Wang <wxt@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, kbuild-all@01.org, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------070707050606060407050601
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2015年11月08日 21:42, kbuild test robot 写道:
> Hi Caesar,
>
> [auto build test ERROR on: soc-thermal/next]
> [also build test ERROR on: next-20151106]
> [cannot apply to: rockchip/for-next v4.3]
>
> url:    https://github.com/0day-ci/linux/commits/Caesar-Wang/Better-compatible-for-the-rockchip-thermal-and-support-RK3368-SoCs/20151108-173308
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/evalenti/linux-soc-thermal next
> config: arm64-defconfig (attached as .config)
> reproduce:
>          wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # save the attached .config to linux build tree
>          make.cross ARCH=arm64
>
> All errors (new ones prefixed by >>):
>
>>> Error: arch/arm64/boot/dts/rockchip/rk3368-r88.dts:345.1-7 syntax error
>     FATAL ERROR: Unable to parse input tree

Missing a ';'
--- a/arch/arm64/boot/dts/rockchip/rk3368-r88.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3368-r88.dts
@@ -340,7 +340,7 @@
         rockchip,hw-tshut-mode = <0>; /* tshut mode 0:CRU 1:GPIO */
         rockchip,hw-tshut-polarity = <0>; /* tshut polarity 0:LOW 1:HIGH */
         status = "okay";
-}
+};

Sorry for that,  my make scripts is rk3368-evb.dtsi（in local file for 
sdk board) no include r88 to build.:-(

Many thanks.
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> [attachment]
>
> .config.gz
> download: http://u.163.com/t0/X4h6Ssaywr
>
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


-- 
Thanks,
Caesar


--------------070707050606060407050601
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">在 2015年11月08日 21:42, kbuild test robot
      写道:<br>
    </div>
    <blockquote
      cite="mid:201511082118.g4TUWjlz%25fengguang.wu@intel.com"
      type="cite">
      <pre wrap="">Hi Caesar,

[auto build test ERROR on: soc-thermal/next]
[also build test ERROR on: next-20151106]
[cannot apply to: rockchip/for-next v4.3]

url:    <a class="moz-txt-link-freetext" href="https://github.com/0day-ci/linux/commits/Caesar-Wang/Better-compatible-for-the-rockchip-thermal-and-support-RK3368-SoCs/20151108-173308">https://github.com/0day-ci/linux/commits/Caesar-Wang/Better-compatible-for-the-rockchip-thermal-and-support-RK3368-SoCs/20151108-173308</a>
base:   <a class="moz-txt-link-freetext" href="https://git.kernel.org/pub/scm/linux/kernel/git/evalenti/linux-soc-thermal">https://git.kernel.org/pub/scm/linux/kernel/git/evalenti/linux-soc-thermal</a> next
config: arm64-defconfig (attached as .config)
reproduce:
        wget <a class="moz-txt-link-freetext" href="https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross">https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross</a> -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        make.cross ARCH=arm64 

All errors (new ones prefixed by &gt;&gt;):

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="">Error: arch/arm64/boot/dts/rockchip/rk3368-r88.dts:345.1-7 syntax error
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="">   FATAL ERROR: Unable to parse input tree</pre>
    </blockquote>
    <br>
    Missing a ';' <br>
    --- a/arch/arm64/boot/dts/rockchip/rk3368-r88.dts<br>
    +++ b/arch/arm64/boot/dts/rockchip/rk3368-r88.dts<br>
    @@ -340,7 +340,7 @@<br>
            rockchip,hw-tshut-mode = &lt;0&gt;; /* tshut mode 0:CRU
    1:GPIO */<br>
            rockchip,hw-tshut-polarity = &lt;0&gt;; /* tshut polarity
    0:LOW 1:HIGH */<br>
            status = "okay";<br>
    -}<br>
    +};<br>
    <br>
    Sorry for that,  my make scripts is rk3368-evb.dtsi（in local file
    for sdk board) no include r88 to build.<span class="moz-smiley-s2"><span>
        :-( </span></span><br>
    <br>
    Many thanks.<br>
    <blockquote
      cite="mid:201511082118.g4TUWjlz%25fengguang.wu@intel.com"
      type="cite">
      <pre wrap="">

---
0-DAY kernel test infrastructure                Open Source Technology Center
<a class="moz-txt-link-freetext" href="https://lists.01.org/pipermail/kbuild-all">https://lists.01.org/pipermail/kbuild-all</a>                   Intel Corporation
[attachment]

.config.gz
download: <a class="moz-txt-link-freetext" href="http://u.163.com/t0/X4h6Ssaywr">http://u.163.com/t0/X4h6Ssaywr</a>

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
    <br>
    <pre class="moz-signature" cols="72">-- 
Thanks,
Caesar</pre>
  </body>
</html>

--------------070707050606060407050601--
