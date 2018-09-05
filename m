From: Sergey Suloev <ssuloev@orpaltech.com>
Subject: Re: [PATCH v4 02/11] clk: sunxi-ng: a64: Add max. rate constraint to
 video PLLs
Date: Wed, 5 Sep 2018 13:17:48 +0300
Message-ID: <5f350a8f-b73e-a866-b22c-76b9176d3be1@orpaltech.com>
References: <20180904044053.15425-1-icenowy@aosc.io>
 <20180904044053.15425-3-icenowy@aosc.io>
 <20180905071645.ibhcuq5coc6gl6k3@flea>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1366032647=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180905071645.ibhcuq5coc6gl6k3@flea>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>, Icenowy Zheng <icenowy@aosc.io>
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>, linux-sunxi@googlegroups.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Jagan Teki <jagan@amarulasolutions.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.
--===============1366032647==
Content-Type: multipart/alternative;
 boundary="------------DAE953FD6AED7CFFE08B834C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------DAE953FD6AED7CFFE08B834C
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Hi,
On 09/05/2018 10:16 AM, Maxime Ripard wrote:
> On Tue, Sep 04, 2018 at 12:40:44PM +0800, Icenowy Zheng wrote:
>> Video PLLs on A64 can be set to higher rate that it is actually
>> supported by HW.
>>
>> Limit maximum rate to 1008 MHz. This is the maximum allowed rate by BSP
>> clock driver. Interestengly, user manual specifies maximum frequency to
>> be 600 MHz. Historically, this data was wrong in some user manuals for
>> other SoCs, so more faith is put in BSP clock driver.
>>
>> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Applied, thanks!
> Maxime
>
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
what source tree this patch is supposed to apply for ?
I can't find  the SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX declaration 
in 4.19

Thank you
Sergey

--------------DAE953FD6AED7CFFE08B834C
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hi,<br>
    <div class="moz-cite-prefix">On 09/05/2018 10:16 AM, Maxime Ripard
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20180905071645.ibhcuq5coc6gl6k3@flea">
      <pre wrap="">On Tue, Sep 04, 2018 at 12:40:44PM +0800, Icenowy Zheng wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Video PLLs on A64 can be set to higher rate that it is actually
supported by HW.

Limit maximum rate to 1008 MHz. This is the maximum allowed rate by BSP
clock driver. Interestengly, user manual specifies maximum frequency to
be 600 MHz. Historically, this data was wrong in some user manuals for
other SoCs, so more faith is put in BSP clock driver.

Signed-off-by: Icenowy Zheng <a class="moz-txt-link-rfc2396E" href="mailto:icenowy@aosc.io">&lt;icenowy@aosc.io&gt;</a>
</pre>
      </blockquote>
      <pre wrap="">
Applied, thanks!
Maxime

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
linux-arm-kernel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-arm-kernel@lists.infradead.org">linux-arm-kernel@lists.infradead.org</a>
<a class="moz-txt-link-freetext" href="http://lists.infradead.org/mailman/listinfo/linux-arm-kernel">http://lists.infradead.org/mailman/listinfo/linux-arm-kernel</a>
</pre>
    </blockquote>
    what source tree this patch is supposed to apply for ?<br>
    I can't find  the SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX
    declaration in 4.19<br>
    <br>
    Thank you<br>
    Sergey<br>
  </body>
</html>

--------------DAE953FD6AED7CFFE08B834C--

--===============1366032647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1366032647==--
