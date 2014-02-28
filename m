Return-Path: <gabriel.fernandez@st.com>
Message-ID: <531094F3.7020604@st.com>
Date: Fri, 28 Feb 2014 14:53:55 +0100
From: Gabriel Fernandez <gabriel.fernandez@st.com>
MIME-Version: 1.0
Subject: Re: [PATCH v0 12/15] ARM: STi: DT: STiH416: 416 DT Entry for clockgen
 B/C/D/E/F
References: <1393514668-17440-1-git-send-email-gabriel.fernandez@st.com> <1393514668-17440-13-git-send-email-gabriel.fernandez@st.com> <20140227163643.GC24910@lee--X1>
In-Reply-To: <20140227163643.GC24910@lee--X1>
Content-Type: multipart/alternative;
	boundary="------------070407020107020701060800"
To: Lee Jones <lee.jones@linaro.org>
Cc: mturquette@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Pankaj Dev <pankaj.dev@st.com>
List-ID: <devicetree@vger.kernel.org>

--------------070407020107020701060800
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Lee,

On 02/27/2014 05:36 PM, Lee Jones wrote:
>> Patch adds DT entries for clockgen B/C/D/E/F
>>
>> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
> You need to add your Signed-off-by too.
ok
>
>> ---
>>   arch/arm/boot/dts/stih416-clock.dtsi | 170 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 170 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/stih416-clock.dtsi b/arch/arm/boot/dts/stih416-clock.dtsi
>> index f63b0a1..6b2e387 100644
>> --- a/arch/arm/boot/dts/stih416-clock.dtsi
>> +++ b/arch/arm/boot/dts/stih416-clock.dtsi
>> @@ -503,5 +503,175 @@
>>   						/* Remaining outputs unused */
>>   			};
>>   		};
> This doesn't look right. Have you indented one tab too far?
ok i have reworked tabulation on this patch
>
>> +                /*
>> +                 * Frequency synthesizers on the SASG2.
>> +                 *
>> +                 */
> Too many *'s
ok
>
> <snip>
>
>> +                CLK_S_VCC_HD: CLK_S_VCC_HD {
>> +                        #clock-cells = <0>;
>> +                        compatible = "st,stih416-clkgenc-vcc-hd", "st,clkgen-mux";
>> +                        reg = <0xfe8308b8 4>; /* SYSCFG2558 */
> 0x4
ok
>
>> +                /*
>> +                 * Add a dummy clock for the HDMI PHY for the VCC input mux
>> +                 */
>> +                CLK_S_TMDS_FROMPHY: CLK_S_TMDS_FROMPHY {
>> +                        #clock-cells = <0>;
>> +                        compatible = "fixed-clock";
>> +                        clock-frequency = <0>;
> What happens when the clock frequency is 0?
Nothing, this poses no problem.
This input clock is not managed by the driver.

>> +                };
>> +
>> +                CLOCKGEN_C_VCC: CLOCKGEN_C_VCC {
>> +                        #clock-cells = <1>;
>> +                        compatible = "st,stih416-clkgenc", "st,clkgen-vcc";
>> +                        reg = <0xfe8308ac 12>; /* SYSCFG2555,2556,2557 */
> 0x12, or 0x0C, whichever is appropriate.
ok
>
>> +                        clocks = <&CLK_S_VCC_HD>, <&CLOCKGEN_C 1>,
>> +                                 <&CLK_S_TMDS_FROMPHY>, <&CLOCKGEN_C 2>;
> One per line would probably be better, save confusing them for pairs.
ok
>
> <snip>
>
>> +		/*
>> +		 * Frequency synthesizers on the MPE42
>> +		 */
> Alignment.

ok i transform into 1 line : /* Frequency synthesizers on the MPE42*/

>
> <snip>
>
>> +                CLOCKGEN_F: CLOCKGEN_F {
>> +                        #clock-cells = <1>;
>> +                        compatible = "st,stih416-quadfs660-F", "st,quadfs";
>> +                        reg = <0xfd320878 0xF0>;
>> +
>> +                        clocks = <&CLK_SYSIN>;
>> +                        clock-output-names = "CLK_M_MAIN_VIDFS",
>> +                                             "CLK_M_HVA_FS",
>> +                                             "CLK_M_FVDP_VCPU",
>> +					     "CLK_M_FVDP_PROC_FS";
> Tabbing. Ensure you're using tabs (and not spaces) everywhere.
ok
>
> <snip>
>
>> +                        reg = <0xfd320910 4>; /* SYSCFG8580 */
> 0x...
>
> Do this for all of the below too.
ok
>
>
> <snip>
>
>> +                        clock-output-names  =
>> +                                "CLK_M_PIX_MAIN_PIPE",  "CLK_M_PIX_AUX_PIPE",
>> +                                "CLK_M_PIX_MAIN_CRU",   "CLK_M_PIX_AUX_CRU",
>> +                                "CLK_M_XFER_BE_COMPO",  "CLK_M_XFER_PIP_COMPO",
>> +                                "CLK_M_XFER_AUX_COMPO", "CLK_M_VSENS",
>> +                                "CLK_M_PIX_HDMIRX_0",   "CLK_M_PIX_HDMIRX_1";
>> +                };
>>   	};
>>   };
ok
> Something strange going on with these.
>


--------------070407020107020701060800
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hi Lee,<br>
    <br>
    <div class="moz-cite-prefix">On 02/27/2014 05:36 PM, Lee Jones
      wrote:<br>
    </div>
    <blockquote cite="mid:20140227163643.GC24910@lee--X1" type="cite">
      <blockquote type="cite">
        <pre wrap="">Patch adds DT entries for clockgen B/C/D/E/F

Signed-off-by: Pankaj Dev <a class="moz-txt-link-rfc2396E" href="mailto:pankaj.dev@st.com">&lt;pankaj.dev@st.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="">
You need to add your Signed-off-by too.</pre>
    </blockquote>
    ok<br>
    <blockquote cite="mid:20140227163643.GC24910@lee--X1" type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">---
 arch/arm/boot/dts/stih416-clock.dtsi | 170 +++++++++++++++++++++++++++++++++++
 1 file changed, 170 insertions(+)

diff --git a/arch/arm/boot/dts/stih416-clock.dtsi b/arch/arm/boot/dts/stih416-clock.dtsi
index f63b0a1..6b2e387 100644
--- a/arch/arm/boot/dts/stih416-clock.dtsi
+++ b/arch/arm/boot/dts/stih416-clock.dtsi
@@ -503,5 +503,175 @@
 						/* Remaining outputs unused */
 			};
 		};
</pre>
      </blockquote>
      <pre wrap="">
This doesn't look right. Have you indented one tab too far?</pre>
    </blockquote>
    ok i have reworked tabulation on this patch<br>
    <blockquote cite="mid:20140227163643.GC24910@lee--X1" type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+                /*
+                 * Frequency synthesizers on the SASG2.
+                 *
+                 */
</pre>
      </blockquote>
      <pre wrap="">
Too many *'s</pre>
    </blockquote>
    ok<br>
    <blockquote cite="mid:20140227163643.GC24910@lee--X1" type="cite">
      <pre wrap="">

&lt;snip&gt;

</pre>
      <blockquote type="cite">
        <pre wrap="">+                CLK_S_VCC_HD: CLK_S_VCC_HD {
+                        #clock-cells = &lt;0&gt;;
+                        compatible = "st,stih416-clkgenc-vcc-hd", "st,clkgen-mux";
+                        reg = &lt;0xfe8308b8 4&gt;; /* SYSCFG2558 */
</pre>
      </blockquote>
      <pre wrap="">
0x4</pre>
    </blockquote>
    ok<br>
    <blockquote cite="mid:20140227163643.GC24910@lee--X1" type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+                /*
+                 * Add a dummy clock for the HDMI PHY for the VCC input mux
+                 */
+                CLK_S_TMDS_FROMPHY: CLK_S_TMDS_FROMPHY {
+                        #clock-cells = &lt;0&gt;;
+                        compatible = "fixed-clock";
+                        clock-frequency = &lt;0&gt;;
</pre>
      </blockquote>
      <pre wrap="">
What happens when the clock frequency is 0?</pre>
    </blockquote>
    <div id="gt-src-tools">
      <div id="gt-src-tools-l">
        <div style="display: inline-block;" id="gt-input-tool">
          <div id="itamenu"><span class="ita-kd-inputtools-div"></span></div>
        </div>
      </div>
    </div>
    <div id="gt-res-content" class="almost_half_cell">
      <div dir="ltr" style="zoom:1">
        <div id="tts_button" style="" class=""><object
            type="application/x-shockwave-flash"
            data="//ssl.gstatic.com/translate/sound_player2.swf"
            id="tts" height="18" width="18"></object></div>
        <span id="result_box" class="short_text" lang="en"><span
            class="hps">Nothing, this</span> <span class="hps">poses no</span>
          <span class="hps">problem.</span></span></div>
    </div>
    This input clock is not managed by the driver.<br>
    <br>
    <blockquote cite="mid:20140227163643.GC24910@lee--X1" type="cite">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">+                };
+
+                CLOCKGEN_C_VCC: CLOCKGEN_C_VCC {
+                        #clock-cells = &lt;1&gt;;
+                        compatible = "st,stih416-clkgenc", "st,clkgen-vcc";
+                        reg = &lt;0xfe8308ac 12&gt;; /* SYSCFG2555,2556,2557 */
</pre>
      </blockquote>
      <pre wrap="">
0x12, or 0x0C, whichever is appropriate.</pre>
    </blockquote>
    ok<br>
    <blockquote cite="mid:20140227163643.GC24910@lee--X1" type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+                        clocks = &lt;&amp;CLK_S_VCC_HD&gt;, &lt;&amp;CLOCKGEN_C 1&gt;,
+                                 &lt;&amp;CLK_S_TMDS_FROMPHY&gt;, &lt;&amp;CLOCKGEN_C 2&gt;;
</pre>
      </blockquote>
      <pre wrap="">
One per line would probably be better, save confusing them for pairs.</pre>
    </blockquote>
    ok<br>
    <blockquote cite="mid:20140227163643.GC24910@lee--X1" type="cite">
      <pre wrap="">

&lt;snip&gt;

</pre>
      <blockquote type="cite">
        <pre wrap="">+		/*
+		 * Frequency synthesizers on the MPE42
+		 */
</pre>
      </blockquote>
      <pre wrap="">
Alignment.</pre>
    </blockquote>
    <br>
    ok i transform into 1 line : /* Frequency synthesizers on the
    MPE42*/
    <pre wrap="">
</pre>
    <blockquote cite="mid:20140227163643.GC24910@lee--X1" type="cite">
      <pre wrap="">

&lt;snip&gt;

</pre>
      <blockquote type="cite">
        <pre wrap="">+                CLOCKGEN_F: CLOCKGEN_F {
+                        #clock-cells = &lt;1&gt;;
+                        compatible = "st,stih416-quadfs660-F", "st,quadfs";
+                        reg = &lt;0xfd320878 0xF0&gt;;
+
+                        clocks = &lt;&amp;CLK_SYSIN&gt;;
+                        clock-output-names = "CLK_M_MAIN_VIDFS",
+                                             "CLK_M_HVA_FS",
+                                             "CLK_M_FVDP_VCPU",
+					     "CLK_M_FVDP_PROC_FS";
</pre>
      </blockquote>
      <pre wrap="">
Tabbing. Ensure you're using tabs (and not spaces) everywhere.</pre>
    </blockquote>
    ok<br>
    <blockquote cite="mid:20140227163643.GC24910@lee--X1" type="cite">
      <pre wrap="">

&lt;snip&gt;

</pre>
      <blockquote type="cite">
        <pre wrap="">+                        reg = &lt;0xfd320910 4&gt;; /* SYSCFG8580 */
</pre>
      </blockquote>
      <pre wrap="">
0x...

Do this for all of the below too.</pre>
    </blockquote>
    ok<br>
    <blockquote cite="mid:20140227163643.GC24910@lee--X1" type="cite">
      <pre wrap="">


&lt;snip&gt;

</pre>
      <blockquote type="cite">
        <pre wrap="">+                        clock-output-names  =
+                                "CLK_M_PIX_MAIN_PIPE",  "CLK_M_PIX_AUX_PIPE",
+                                "CLK_M_PIX_MAIN_CRU",   "CLK_M_PIX_AUX_CRU",
+                                "CLK_M_XFER_BE_COMPO",  "CLK_M_XFER_PIP_COMPO",
+                                "CLK_M_XFER_AUX_COMPO", "CLK_M_VSENS",
+                                "CLK_M_PIX_HDMIRX_0",   "CLK_M_PIX_HDMIRX_1";
+                };
 	};
 };
</pre>
      </blockquote>
    </blockquote>
    ok<br>
    <blockquote cite="mid:20140227163643.GC24910@lee--X1" type="cite">
      <pre wrap="">
Something strange going on with these.

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------070407020107020701060800--
