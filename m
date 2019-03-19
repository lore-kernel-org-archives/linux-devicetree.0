From: Sergey Suloev <ssuloev@orpaltech.com>
Subject: Re: [PATCH v8 02/15] drm/sun4i: tcon: Compute DCLK dividers based on
 format, lanes
Date: Tue, 19 Mar 2019 15:17:30 +0300
Message-ID: <7dab458e-7fad-2dbe-bbae-bd3cdf89dcb4@orpaltech.com>
References: <20190311133637.18334-1-jagan@amarulasolutions.com>
 <20190311133637.18334-3-jagan@amarulasolutions.com>
 <20190311153847.oz6ruqmptaq2befn@flea>
 <CAMty3ZChz=s7gdQyX9KnsAp1t5FrpouXGK74-r0SKJ89yJN67Q@mail.gmail.com>
 <20190319105307.omowzyhqu33e3pzy@flea>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1526517722=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190319105307.omowzyhqu33e3pzy@flea>
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
To: Maxime Ripard <maxime.ripard@bootlin.com>, Jagan Teki <jagan@amarulasolutions.com>
Cc: devicetree <devicetree@vger.kernel.org>, Michael Trimarchi <michael@amarulasolutions.com>, David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-amarula@amarulasolutions.com, linux-clk <linux-clk@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.
--===============1526517722==
Content-Type: multipart/alternative;
 boundary="------------75921FD4313A9A1DFBF21BEB"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------75921FD4313A9A1DFBF21BEB
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Hi, guys,

On 3/19/19 1:53 PM, Maxime Ripard wrote:
> On Mon, Mar 11, 2019 at 09:36:27PM +0530, Jagan Teki wrote:
>> On Mon, Mar 11, 2019 at 9:08 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>>> On Mon, Mar 11, 2019 at 07:06:24PM +0530, Jagan Teki wrote:
>>>> pll-video => pll-mipi => tcon0 => tcon0-pixel-clock is the typical
>>>> MIPI clock topology in Allwinner DSI controller.
>>>>
>>>> TCON dotclock driver is computing the desired DCLK divider based on
>>>> panel pixel clock along with input DCLK min, max divider values from
>>>> tcon driver and that would eventually set the pll-mipi clock rate.
>>>>
>>>> The current code allows the TCON clock divider to have a default 4
>>>> for min, max ranges that would fail to compute the desired pll-mipi
>>>> rate while supporting new panels.
>>>>
>>>> So, add the computation logic 'format/lanes' to dclk min and max dividers
>>>> and instead of default 4. This computation logic align with Allwinner A64
>>>> BSP, hoping that would work even for A33.
>>> Last time we discussed this, we found out that this wasn't the case,
>>> even in the BSP.
>> This was the case for BSP to compute pll-mipi not for TCON_DSI clock
>> register, SUN4I_TCON0_DCLK_REG, which marked the divider 4 by default.
>>
>>> What compelling evidence have you found that makes you say otherwise?
>> divider 4 isn't worked, this I would mentioned before as well.
> Maybe you mentionned it before, but it's nowhere to be found in your
> commit log.
>
>> Tested this on 4 different panels, and below are the desired divider values
>> and pll-mipi clock rate with respect to pixel clock frequency.
>>
>> - 55MHz pixel clock with 4-lane panel, and the desired DSI clock divider
>>    is 6 with the output parent clock rate of 330MHz.
>> - 30MHz pixel clock with 4-lane panel, and the desired DSI clock divider
>>    is 6 with parent clock rate of 180MHz.
>> - 27.5Mhz pixel clock with 2-lane pane, and the desired DSI clock divider
>>    is 12 with the output parent clock rate of 330MHz.
>> - 147MHz pixel clock with 4-lane panel, and the desired DSI clock divider
>>    is 6 with the output parent clock rate of 882MHz.
>>
>> BSP trying to use this format/lane to compute dsi divider that in-turn
>> using pll-mipi set_rate but TCON0_DCLK_REG keep constant 4.
> Feel free to reply to
> http://lists.infradead.org/pipermail/linux-arm-kernel/2019-February/629596.html
>
> And correct whatever is said there that isn't what is happening.


excuse me if my message is out of topic.

I just want let you know  that the code

tcon->dclk_min_div = SUN6I_DSI_TCON_DIV;
tcon->dclk_max_div = SUN6I_DSI_TCON_DIV;

where SUN6I_DSI_TCON_DIV = 4  isn't working with my 2-lane panel: I am 
always getting the error:

  [CRTC:38:crtc-0] vblank wait timed out

As soon as I set

tcon->dclk_min_div = tcon->dclk_max_div = bpp/lanes, i.e. 12

the error disappears.


> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--------------75921FD4313A9A1DFBF21BEB
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi, guys,<br>
    </p>
    <div class="moz-cite-prefix">On 3/19/19 1:53 PM, Maxime Ripard
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20190319105307.omowzyhqu33e3pzy@flea">
      <pre class="moz-quote-pre" wrap="">On Mon, Mar 11, 2019 at 09:36:27PM +0530, Jagan Teki wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Mon, Mar 11, 2019 at 9:08 PM Maxime Ripard <a class="moz-txt-link-rfc2396E" href="mailto:maxime.ripard@bootlin.com">&lt;maxime.ripard@bootlin.com&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
On Mon, Mar 11, 2019 at 07:06:24PM +0530, Jagan Teki wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">pll-video =&gt; pll-mipi =&gt; tcon0 =&gt; tcon0-pixel-clock is the typical
MIPI clock topology in Allwinner DSI controller.

TCON dotclock driver is computing the desired DCLK divider based on
panel pixel clock along with input DCLK min, max divider values from
tcon driver and that would eventually set the pll-mipi clock rate.

The current code allows the TCON clock divider to have a default 4
for min, max ranges that would fail to compute the desired pll-mipi
rate while supporting new panels.

So, add the computation logic 'format/lanes' to dclk min and max dividers
and instead of default 4. This computation logic align with Allwinner A64
BSP, hoping that would work even for A33.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Last time we discussed this, we found out that this wasn't the case,
even in the BSP.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
This was the case for BSP to compute pll-mipi not for TCON_DSI clock
register, SUN4I_TCON0_DCLK_REG, which marked the divider 4 by default.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">What compelling evidence have you found that makes you say otherwise?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
divider 4 isn't worked, this I would mentioned before as well.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Maybe you mentionned it before, but it's nowhere to be found in your
commit log.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Tested this on 4 different panels, and below are the desired divider values
and pll-mipi clock rate with respect to pixel clock frequency.

- 55MHz pixel clock with 4-lane panel, and the desired DSI clock divider
  is 6 with the output parent clock rate of 330MHz.
- 30MHz pixel clock with 4-lane panel, and the desired DSI clock divider
  is 6 with parent clock rate of 180MHz.
- 27.5Mhz pixel clock with 2-lane pane, and the desired DSI clock divider
  is 12 with the output parent clock rate of 330MHz.
- 147MHz pixel clock with 4-lane panel, and the desired DSI clock divider
  is 6 with the output parent clock rate of 882MHz.

BSP trying to use this format/lane to compute dsi divider that in-turn
using pll-mipi set_rate but TCON0_DCLK_REG keep constant 4.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Feel free to reply to
<a class="moz-txt-link-freetext" href="http://lists.infradead.org/pipermail/linux-arm-kernel/2019-February/629596.html">http://lists.infradead.org/pipermail/linux-arm-kernel/2019-February/629596.html</a>

And correct whatever is said there that isn't what is happening.
</pre>
    </blockquote>
    <p><br>
    </p>
    <p>excuse me if my message is out of topic.</p>
    <p>I just want let you know  that the code <br>
    </p>
    <p>tcon-&gt;dclk_min_div = SUN6I_DSI_TCON_DIV;<br>
      tcon-&gt;dclk_max_div = SUN6I_DSI_TCON_DIV;</p>
    <p>where SUN6I_DSI_TCON_DIV = 4  isn't working with my 2-lane panel:
      I am always getting the error:</p>
    <p> [CRTC:38:crtc-0] vblank wait timed out<br>
    </p>
    <p>As soon as I set <br>
    </p>
    <p>tcon-&gt;dclk_min_div = tcon-&gt;dclk_max_div = bpp/lanes, i.e.
      12<br>
    </p>
    <p>the error disappears.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20190319105307.omowzyhqu33e3pzy@flea">
      <pre class="moz-quote-pre" wrap="">
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
<a class="moz-txt-link-freetext" href="https://bootlin.com">https://bootlin.com</a>
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
linux-arm-kernel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-arm-kernel@lists.infradead.org">linux-arm-kernel@lists.infradead.org</a>
<a class="moz-txt-link-freetext" href="http://lists.infradead.org/mailman/listinfo/linux-arm-kernel">http://lists.infradead.org/mailman/listinfo/linux-arm-kernel</a>
</pre>
    </blockquote>
  </body>
</html>

--------------75921FD4313A9A1DFBF21BEB--

--===============1526517722==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1526517722==--
