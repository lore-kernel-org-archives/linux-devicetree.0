Return-Path: <wxt@rock-chips.com>
Subject: Re: [PATCH v1 2/2] ARM: dts: rockchip: Add the OTP gpio pinctrl
References: <1445395380-5365-1-git-send-email-wxt@rock-chips.com>
 <1445395380-5365-3-git-send-email-wxt@rock-chips.com>
 <CAD=FV=WbnWXD1HCON-VHfqSqtp=GFwbsj+g2G8A159CEaEiFYQ@mail.gmail.com>
From: Caesar Wang <wxt@rock-chips.com>
Message-ID: <562717CD.3040601@rock-chips.com>
Date: Wed, 21 Oct 2015 12:42:53 +0800
MIME-Version: 1.0
In-Reply-To: <CAD=FV=WbnWXD1HCON-VHfqSqtp=GFwbsj+g2G8A159CEaEiFYQ@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------060300010608050700010904"
To: Doug Anderson <dianders@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Eduardo Valentin <edubezval@gmail.com>, Russell King <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------060300010608050700010904
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Doug,

在 2015年10月21日 12:25, Doug Anderson 写道:
> Caesar,
>
> On Tue, Oct 20, 2015 at 7:43 PM, Caesar Wang <wxt@rock-chips.com> wrote:
>> We need the OTP pin is gpio state before resetting the TSADC controller,
>> since the tshut polarity will generate a high signal.
> It might or might not be "high" depending on polarity, right?  It's
> just possible that it could glitch during probe.  Other than that nit,
> this seems fine to me.

I think the description is right,   maybe need other decriptions.
The tshut *polarity* is low in a short period of time when the TSADC 
controller is reset.

In other words,

If T < (setting temperature), the OTP output the High Signal. ------> if the otp out polarity is high, the TSHUT will work.
If T > (setting temperature), the OTP output the Low Signal.


> If it's not too much trouble it'd be nice if you could spin with the
> description change.  Otherwise:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
>
>

-- 
Yours,
Caesar


--------------060300010608050700010904
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Doug,<br>
    <br>
    <div class="moz-cite-prefix">在 2015年10月21日 12:25, Doug Anderson 写道:<br>
    </div>
    <blockquote
cite="mid:CAD=FV=WbnWXD1HCON-VHfqSqtp=GFwbsj+g2G8A159CEaEiFYQ@mail.gmail.com"
      type="cite">
      <pre wrap="">Caesar,

On Tue, Oct 20, 2015 at 7:43 PM, Caesar Wang <a class="moz-txt-link-rfc2396E" href="mailto:wxt@rock-chips.com">&lt;wxt@rock-chips.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">We need the OTP pin is gpio state before resetting the TSADC controller,
since the tshut polarity will generate a high signal.
</pre>
      </blockquote>
      <pre wrap="">
It might or might not be "high" depending on polarity, right?  It's
just possible that it could glitch during probe.  Other than that nit,
this seems fine to me.
</pre>
    </blockquote>
    <br>
    I think the description is right,   maybe need other decriptions.<br>
    The tshut <b>polarity</b> is low in a short period of time when the
    TSADC controller is reset.<br>
    <br>
    In other words,<br>
    <pre wrap="">If T &lt; (setting temperature), the OTP output the High Signal. ------&gt; if the otp out polarity is high, the TSHUT will work.
If T &gt; (setting temperature), the OTP output the Low Signal.</pre>
    <br>
    <blockquote
cite="mid:CAD=FV=WbnWXD1HCON-VHfqSqtp=GFwbsj+g2G8A159CEaEiFYQ@mail.gmail.com"
      type="cite">
      <pre wrap="">
If it's not too much trouble it'd be nice if you could spin with the
description change.  Otherwise:

Reviewed-by: Douglas Anderson <a class="moz-txt-link-rfc2396E" href="mailto:dianders@chromium.org">&lt;dianders@chromium.org&gt;</a>



</pre>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
Yours, 
Caesar
</pre>
  </body>
</html>

--------------060300010608050700010904--
