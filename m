Return-Path: <SRS0=CWE3=BX=huawei.com=chenyu56@kernel.org>
Subject: Re: [RFC 2/3] USB: dwc3: Modify dwc3 code for support usb of Hikey960
References: <20171024060610.10712-1-chenyu56@huawei.com>
 <20171024060610.10712-3-chenyu56@huawei.com> <87a80hgdgf.fsf@linux.intel.com>
From: Chen Yu <chenyu56@huawei.com>
Message-ID: <bbf80ebf-13c6-b589-6b38-6b09ce4119bb@huawei.com>
Date: Tue, 24 Oct 2017 18:19:17 +0800
MIME-Version: 1.0
In-Reply-To: <87a80hgdgf.fsf@linux.intel.com>
Content-Type: multipart/alternative;
	boundary="------------4B210542CF7B02035ECC57D8"
To: Felipe Balbi <balbi@kernel.org>, xuwei5@hisilicon.com, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, arnd@arndb.de, olof@lixom.net, timur@codeaurora.org, khilman@baylibre.com, gregory.clement@free-electrons.com, narmstrong@baylibre.com, yamada.masahiro@socionext.com, robh@kernel.org, heiko@sntech.de, damm+renesas@opensource.se, krzk@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: wangbinghui@hisilicon.com, suzhuangluan@hisilicon.com, yangdi10@hisilicon.com, "lirui39@hisilicon.com" <lirui39@hisilicon.com>
List-ID: <devicetree@vger.kernel.org>

--------------4B210542CF7B02035ECC57D8
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Felipe


On 2017/10/24 16:25, Felipe Balbi wrote:
> Hi,
>
> Yu Chen<chenyu56@huawei.com>  writes:
>> >The usb controller of Kirin960 is DesignWare Cores SuperSpeed USB 3.0 Controller.
>> >The patch modifies dwc3 for support Kirin960 and adds codes for a USB Hub on board Hikey960.
>> >
>> >Signed-off-by: Yu Chen
> <chenyu56@huawei.com>
> >Signed-off-by: Ning Fan<fanning4@hisilicon.com>
> >Signed-off-by: Di Yang<yangdi10@hisilicon.com>
> >Signed-off-by: Rui Li<lirui39@hisilicon.com>
> I think Linaro, recently, added support for chargers to mainline. You
> should use what they did.
>
> I'm gonna stop here. There's no way I'm going through this much code in
> a single patch. Specially since 90% of it is either completely
> unnecessary or should be done using already-existing generic APIs.
>
> Sorry, no cookie today.

Thanks a lot for your comments!
These codes have been tested on Hikey960 board and work well. But indeed the codes can be simplified and
made comply with already-existing architecture.
We will work on these codes according to your reviews and make parted patch next time.

Thanks,
Yu Chen

--------------4B210542CF7B02035ECC57D8
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>Hi, Felipe<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 2017/10/24 16:25, Felipe Balbi
      wrote:<br>
    </div>
    <blockquote cite="mid:87a80hgdgf.fsf@linux.intel.com" type="cite">
      <pre wrap="">Hi,

Yu Chen <a moz-do-not-send="true" class="moz-txt-link-rfc2396E" href="mailto:chenyu56@huawei.com">&lt;chenyu56@huawei.com&gt;</a> writes:
</pre>
      <blockquote type="cite" style="color: #000000;">
        <pre wrap=""><span class="moz-txt-citetags">&gt; </span>The usb controller of Kirin960 is DesignWare Cores SuperSpeed USB 3.0 Controller.
<span class="moz-txt-citetags">&gt; </span>The patch modifies dwc3 for support Kirin960 and adds codes for a USB Hub on board Hikey960.
<span class="moz-txt-citetags">&gt;</span>
<span class="moz-txt-citetags">&gt; </span>Signed-off-by: Yu Chen </pre>
      </blockquote>
      <pre wrap=""><a moz-do-not-send="true" class="moz-txt-link-rfc2396E" href="mailto:chenyu56@huawei.com">&lt;chenyu56@huawei.com&gt;</a>
<span class="moz-txt-citetags">&gt; </span>Signed-off-by: Ning Fan <a moz-do-not-send="true" class="moz-txt-link-rfc2396E" href="mailto:fanning4@hisilicon.com">&lt;fanning4@hisilicon.com&gt;</a>
<span class="moz-txt-citetags">&gt; </span>Signed-off-by: Di Yang <a moz-do-not-send="true" class="moz-txt-link-rfc2396E" href="mailto:yangdi10@hisilicon.com">&lt;yangdi10@hisilicon.com&gt;</a>
<span class="moz-txt-citetags">&gt; </span>Signed-off-by: Rui Li <a moz-do-not-send="true" class="moz-txt-link-rfc2396E" href="mailto:lirui39@hisilicon.com">&lt;lirui39@hisilicon.com&gt;</a></pre>
      <pre wrap="">I think Linaro, recently, added support for chargers to mainline. You
should use what they did.

I'm gonna stop here. There's no way I'm going through this much code in
a single patch. Specially since 90% of it is either completely
unnecessary or should be done using already-existing generic APIs.

Sorry, no cookie today.</pre>
    </blockquote>
    <br>
    Thanks a lot for your comments!<br>
    These codes have been tested on Hikey960 board and work well. But
    indeed the codes can be simplified and<br>
    made comply with already-existing architecture.<br>
    We will work on these codes according to your reviews and make
    parted patch next time.<br>
    <br>
    Thanks,<br>
    Yu Chen<br>
  </body>
</html>

--------------4B210542CF7B02035ECC57D8--
