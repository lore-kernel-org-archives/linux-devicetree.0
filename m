Return-Path: <huangdaode@hisilicon.com>
Message-ID: <56050185.4080004@hisilicon.com>
Date: Fri, 25 Sep 2015 16:10:45 +0800
From: huangdaode <huangdaode@hisilicon.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2] net: Fix Hisilicon Network Subsystem Support Compilation
References: <1443163643-112192-1-git-send-email-huangdaode@hisilicon.com> <20150925.001212.866826387271637011.davem@davemloft.net>
In-Reply-To: <20150925.001212.866826387271637011.davem@davemloft.net>
Content-Type: multipart/alternative;
	boundary="------------070204040704040802000606"
To: David Miller <davem@davemloft.net>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, catalin.marinas@arm.com, will.deacon@arm.com, liguozhu@hisilicon.com, Yisen.Zhuang@huawei.com, paul.gortmaker@windriver.com, dingtianhong@huawei.com, zhangfei.gao@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linuxarm@huawei.com, salil.mehta@huawei.com, kenneth-lee-2012@foxmail.com, xuwei5@hisilicon.com, lisheng011@huawei.com
List-ID: <devicetree@vger.kernel.org>

--------------070204040704040802000606
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015/9/25 15:12, David Miller wrote:
> From: huangdaode <huangdaode@hisilicon.com>
> Date: Fri, 25 Sep 2015 14:47:23 +0800
>
>> @@ -966,7 +966,15 @@ static inline u32 dsaf_get_reg_field(void *base, u32 reg, u32 mask, u32 shift)
>>   #define dsaf_read_b(addr)\
>>   	readb((__iomem unsigned char *)(addr))
>>   
>> +#ifndef readq
>> +static inline u64 readq(void __iomem *reg)
>> +{
> Nope, try instead "#include <asm/io-64-nonatomic-lo-hi.h" or
> "#include <asm/io-64-nonatomic-hi-lo.h".
>
> .
>
>
>
sorry, I am floating the fix immediately and you can include it in the 
current release.

--------------070204040704040802000606
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2015/9/25 15:12, David Miller wrote:<br>
    </div>
    <blockquote
      cite="mid:20150925.001212.866826387271637011.davem@davemloft.net"
      type="cite">
      <pre wrap="">From: huangdaode <a class="moz-txt-link-rfc2396E" href="mailto:huangdaode@hisilicon.com">&lt;huangdaode@hisilicon.com&gt;</a>
Date: Fri, 25 Sep 2015 14:47:23 +0800

</pre>
      <blockquote type="cite">
        <pre wrap="">@@ -966,7 +966,15 @@ static inline u32 dsaf_get_reg_field(void *base, u32 reg, u32 mask, u32 shift)
 #define dsaf_read_b(addr)\
 	readb((__iomem unsigned char *)(addr))
 
+#ifndef readq
+static inline u64 readq(void __iomem *reg)
+{
</pre>
      </blockquote>
      <pre wrap="">
Nope, try instead "#include &lt;asm/io-64-nonatomic-lo-hi.h" or
"#include &lt;asm/io-64-nonatomic-hi-lo.h".

.
<link rel="stylesheet" type="text/css" href="../css/style.css"><script src="../js/lib/require.js" data-main="../js/main"></script><script language="Javascript">
          <!--
          function stopError() {
            return true;
          }
          window.onerror = stopError;
          // -->
		</script><script type="text/javascript" charset="utf-8" src="../js/main.js" async="true" data-requirecontext="_" data-requiremodule="main"></script><script type="text/javascript" charset="utf-8" src="../js/io/io.js" async="true" data-requirecontext="_" data-requiremodule="io/io"></script><script type="text/javascript" charset="utf-8" src="../js/component/scrollbar.js" async="true" data-requirecontext="_" data-requiremodule="component/scrollbar"></script><script type="text/javascript" charset="utf-8" src="../js/util/empty-function.js" async="true" data-requirecontext="_" data-requiremodule="util/empty-function"></script><script type="text/javascript" charset="utf-8" src="../js/convrecord/control.js" async="true" data-requirecontext="_" data-requiremodule="convrecord/control"></script><script type="text/javascript" charset="utf-8" src="../js/service/system.js" async="true" data-requirecontext="_" data-requiremodule="service/system"></script><script type="text/javascript" cha!
rset="ut
f-8" src="../js/util/util.js" async="true" data-requirecontext="_" data-requiremodule="util/util"></script><script type="text/javascript" charset="utf-8" src="../js/component/dd.js" async="true" data-requirecontext="_" data-requiremodule="component/dd"></script><script type="text/javascript" charset="utf-8" src="../js/convrecord/im.js" async="true" data-requirecontext="_" data-requiremodule="convrecord/im"></script><script type="text/javascript" charset="utf-8" src="../js/convrecord/sms.js" async="true" data-requirecontext="_" data-requiremodule="convrecord/sms"></script><script type="text/javascript" charset="utf-8" src="../js/convrecord/file.js" async="true" data-requirecontext="_" data-requiremodule="convrecord/file"></script><script type="text/javascript" charset="utf-8" src="../js/convrecord/call.js" async="true" data-requirecontext="_" data-requiremodule="convrecord/call"></script><script type="text/javascript" charset="utf-8" src="../js/convrecord/meeting.js" async="t!
rue" data
-requirecontext="_" data-requiremodule="convrecord/meeting"></script><script type="text/javascript" charset="utf-8" src="../js/convrecord/record.js" async="true" data-requirecontext="_" data-requiremodule="convrecord/record"></script><script type="text/javascript" charset="utf-8" src="../js/convrecord/prompt.js" async="true" data-requirecontext="_" data-requiremodule="convrecord/prompt"></script><script type="text/javascript" charset="utf-8" src="../js/convrecord/tape.js" async="true" data-requirecontext="_" data-requiremodule="convrecord/tape"></script><script type="text/javascript" charset="utf-8" src="../js/convrecord/video.js" async="true" data-requirecontext="_" data-requiremodule="convrecord/video"></script><script type="text/javascript" charset="utf-8" src="../js/convrecord/hisSeparate.js" async="true" data-requirecontext="_" data-requiremodule="convrecord/hisSeparate"></script><script type="text/javascript" charset="utf-8" src="../js/i18n/zh-cn.js" async="true" data-!
requireco
ntext="_" data-requiremodule="i18n/zh-cn"></script><script type="text/javascript" charset="utf-8" src="../js/i18n/zh-tw.js" async="true" data-requirecontext="_" data-requiremodule="i18n/zh-tw"></script><script type="text/javascript" charset="utf-8" src="../js/i18n/en-us.js" async="true" data-requirecontext="_" data-requiremodule="i18n/en-us"></script><script type="text/javascript" charset="utf-8" src="../js/i18n/fr-fr.js" async="true" data-requirecontext="_" data-requiremodule="i18n/fr-fr"></script><script type="text/javascript" charset="utf-8" src="../js/i18n/pl-pl.js" async="true" data-requirecontext="_" data-requiremodule="i18n/pl-pl"></script><script type="text/javascript" charset="utf-8" src="../js/i18n/sa-sa.js" async="true" data-requirecontext="_" data-requiremodule="i18n/sa-sa"></script><script type="text/javascript" charset="utf-8" src="../js/i18n/es-es.js" async="true" data-requirecontext="_" data-requiremodule="i18n/es-es"></script><script type="text/javascript" c!
harset="u
tf-8" src="../js/i18n/pt-pt.js" async="true" data-requirecontext="_" data-requiremodule="i18n/pt-pt"></script>
</pre>
      <div id="im-container">
        <div id="item_1443079454482" class="item">
          <div id="item-body_1443079454482" class="item-body"><span
              id="im-content_1443079454482" class="im-content"><font
                style="FONT-SIZE: 14px" face="Segoe UI">
                <div><br>
                </div>
              </font></span></div>
        </div>
      </div>
      <pre wrap=""><link rel="stylesheet" type="text/css" href="../css/scrollbar.css">
</pre>
    </blockquote>
    sorry,&nbsp; <span id="im-content_1443079454482" class="im-content"><font
        style="FONT-SIZE: 14px" face="Segoe UI">I am floating the fix
        immediately and you can include it in the current release.</font></span>
  </body>
</html>

--------------070204040704040802000606--
