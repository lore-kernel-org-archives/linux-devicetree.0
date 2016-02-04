Return-Path: <caesar.upstream@gmail.com>
Subject: Re: [PATCH 7/8] ARM: dts: rockchip: enable the tsadc for rk3228 evb
References: <201602040923.uH3zLqrT%fengguang.wu@intel.com>
From: Caesar Wang <caesar.upstream@gmail.com>
Message-ID: <56B2ADA8.6000508@gmail.com>
Date: Thu, 4 Feb 2016 09:47:20 +0800
MIME-Version: 1.0
In-Reply-To: <201602040923.uH3zLqrT%fengguang.wu@intel.com>
Content-Type: multipart/alternative;
 boundary="------------080501070609030401040603"
To: kbuild test robot <lkp@intel.com>
Cc: Caesar Wang <wxt@rock-chips.com>, huangtao@rock-chips.com, devicetree@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Russell King <linux@arm.linux.org.uk>, Heiko Stuebner <heiko@sntech.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, zhangqing@rock-chips.com, linux-kernel@vger.kernel.org, edubezval@gmail.com, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, kbuild-all@01.org, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------080501070609030401040603
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Mr,robot

Thanks for the auto tests.

在 2016年02月04日 09:34, kbuild test robot 写道:
> Hi Caesar,
>
> [auto build test ERROR on rockchip/for-next]
> [also build test ERROR on v4.5-rc2 next-20160203]
> [if your patch is applied to the wrong git tree, please drop us a note to help improving the system]
>
> url:    https://github.com/0day-ci/linux/commits/Caesar-Wang/Support-and-fixes-the-rk3228-SoCS-for-thermal/20160203-121829
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
> config: arm-multi_v7_defconfig (attached as .config)
> reproduce:
>          wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # save the attached .config to linux build tree
>          make.cross ARCH=arm
>
> Note: the linux-review/Caesar-Wang/Support-and-fixes-the-rk3228-SoCS-for-thermal/20160203-121829 HEAD 661e15b9e9c05d7a350ca8928be2b89e5c36b4d6 builds fine.
>        It only hurts bisectibility.
>
> All errors (new ones prefixed by >>):
>
>>> Error: arch/arm/boot/dts/rk3228-evb.dts:64.1-7 Label or path tsadc not found

Since this patch is depend om PATCH[8/8].
(https://patchwork.kernel.org/patch/8197741/)

>     FATAL ERROR: Syntax error parsing input tree
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> [attachment]
>
> .config.gz
> download: http://u.163.com/t0/lFRyviaZlgm
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


--------------080501070609030401040603
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hi Mr,robot<br>
    <br>
    Thanks for the auto tests.<br>
    <br>
    <div class="moz-cite-prefix">在 2016年02月04日 09:34, kbuild test robot
      写道:<br>
    </div>
    <blockquote
      cite="mid:201602040923.uH3zLqrT%25fengguang.wu@intel.com"
      type="cite">
      <pre wrap="">Hi Caesar,

[auto build test ERROR on rockchip/for-next]
[also build test ERROR on v4.5-rc2 next-20160203]
[if your patch is applied to the wrong git tree, please drop us a note to help improving the system]

url:    <a class="moz-txt-link-freetext" href="https://github.com/0day-ci/linux/commits/Caesar-Wang/Support-and-fixes-the-rk3228-SoCS-for-thermal/20160203-121829">https://github.com/0day-ci/linux/commits/Caesar-Wang/Support-and-fixes-the-rk3228-SoCS-for-thermal/20160203-121829</a>
base:   <a class="moz-txt-link-freetext" href="https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git">https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git</a> for-next
config: arm-multi_v7_defconfig (attached as .config)
reproduce:
        wget <a class="moz-txt-link-freetext" href="https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross">https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross</a> -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        make.cross ARCH=arm 

Note: the linux-review/Caesar-Wang/Support-and-fixes-the-rk3228-SoCS-for-thermal/20160203-121829 HEAD 661e15b9e9c05d7a350ca8928be2b89e5c36b4d6 builds fine.
      It only hurts bisectibility.

All errors (new ones prefixed by &gt;&gt;):

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="">Error: arch/arm/boot/dts/rk3228-evb.dts:64.1-7 Label or path tsadc not found</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <br>
    Since this patch is depend om PATCH[8/8].<br>
    (<a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/patch/8197741/">https://patchwork.kernel.org/patch/8197741/</a>)<br>
    <br>
    <blockquote
      cite="mid:201602040923.uH3zLqrT%25fengguang.wu@intel.com"
      type="cite">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="">
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="">   FATAL ERROR: Syntax error parsing input tree

---
0-DAY kernel test infrastructure                Open Source Technology Center
<a class="moz-txt-link-freetext" href="https://lists.01.org/pipermail/kbuild-all">https://lists.01.org/pipermail/kbuild-all</a>                   Intel Corporation
[attachment]

.config.gz
download: <a class="moz-txt-link-freetext" href="http://u.163.com/t0/lFRyviaZlgm">http://u.163.com/t0/lFRyviaZlgm</a>

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

--------------080501070609030401040603--
