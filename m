Return-Path: <phil@raspberrypi.org>
Subject: Re: [PATCH v5 0/6] bcm2835: auxiliar device support for spi
References: <1441359711-2800-1-git-send-email-kernel@martin.sperl.org>
 <87h9n4weg8.fsf@eliezer.anholt.net> <55F1A651.5090102@tronnes.org>
 <8B777380-A2A1-475E-8A1C-942BF28EE160@martin.sperl.org>
From: Phil Elwell <phil@raspberrypi.org>
Message-ID: <55F1B69F.1010505@raspberrypi.org>
Date: Thu, 10 Sep 2015 17:58:07 +0100
MIME-Version: 1.0
In-Reply-To: <8B777380-A2A1-475E-8A1C-942BF28EE160@martin.sperl.org>
Content-Type: multipart/alternative;
	boundary="------------070201010405030201070908"
To: Martin Sperl <kernel@martin.sperl.org>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Cc: Eric Anholt <eric@anholt.net>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Russell King <linux@arm.linux.org.uk>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--------------070201010405030201070908
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

Noralf pointed me at fixed-factor-clock, and that works in our
(downstream) environment:

    soc: soc {
        ...
        uart1: uart@7e215040 {
            compatible = "brcm,bcm2835-aux-uart", "ns16550";
            reg = <0x7e215040 0x40>;
            interrupts = <1 29>;
            clocks = <&clk_uart1>;
            reg-shift = <2>;
            no-loopback-test;
            status = "disabled";
            };
    };

    clocks: clocks {
        ...
        clk_core: clock@2 {
            compatible = "fixed-clock";
            reg = <2>;
            #clock-cells = <0>;
            clock-output-names = "core";
            clock-frequency = <250000000>;
        };
        ...
        clk_uart1: clock@6 {
            compatible = "fixed-factor-clock";
            clocks = <&clk_core>;
            #clock-cells = <0>;
            clock-div = <1>;
            clock-mult = <2>;
        };
    };

Phil

On 10/09/2015 16:57, Martin Sperl wrote:
>> On 10.09.2015, at 17:48, Noralf Tr�nnes <noralf@tronnes.org> wrote:
>>
>> This looks interesting.
>> But there's a challenge with the uart1 and the 8250 driver.
>>
>> Phil Elwell has this to say:
>> This means that that UART1 isn't an exact clone of a 8250 UART.
>> In a particular, the clock divisor is calculated differently.
>> A standard 8250 derives the baud rate as clock/(divisor16),
>> whereas the BCM2835 mini UART uses clock/(divisor8). This means
>> that if you want to use the standard driver then you need to lie
>> about the clock frequency, providing a value is twice the real
>> value, in order for a suitable divisor to be calculated.
>>
>> Ref: https://github.com/raspberrypi/linux/pull/1008#issuecomment-139234607
>>
>> So either we need a new uart1 driver or a doubled clock freq. somehow.
> Found out the same thing and communicated it to Eric - not 
> knowing about the different divider�
>
> Martin


--------------070201010405030201070908
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Noralf pointed me at fixed-factor-clock, and that works in our
    (downstream) environment:<br>
    <br>
    <small><tt>��� soc: soc {</tt><tt><br>
      </tt><tt>������� ...</tt><tt><br>
      </tt><tt>��� ��� uart1: uart@7e215040 {</tt><tt><br>
      </tt><tt>��� ��� ��� compatible = "brcm,bcm2835-aux-uart",
        "ns16550";</tt><tt><br>
      </tt><tt>��� ��� ��� reg = &lt;0x7e215040 0x40&gt;;</tt><tt><br>
      </tt><tt>��� ��� ��� interrupts = &lt;1 29&gt;;</tt><tt><br>
      </tt><tt>��� ��� ��� clocks = &lt;&amp;clk_uart1&gt;;</tt><tt><br>
      </tt><tt>��� ��� ��� reg-shift = &lt;2&gt;;</tt><tt><br>
      </tt><tt>��� ��� ��� no-loopback-test;</tt><tt><br>
      </tt><tt>��� ��� ��� status = "disabled";</tt><tt><br>
      </tt><tt>��� ������� };</tt><tt><br>
      </tt><tt>��� };</tt><tt><br>
      </tt><tt><br>
      </tt><tt>��� clocks: clocks {</tt><tt><br>
      </tt></small><small><tt>��� ��� ...<br>
        ������� clk_core: clock@2 {<br>
        ��� �� ��� �compatible = "fixed-clock";<br>
        ��� �� ��� �reg = &lt;2&gt;;<br>
        ��� �� ��� �#clock-cells = &lt;0&gt;;<br>
        ��� �� ��� �clock-output-names = "core";<br>
        ��� �� ��� �clock-frequency = &lt;250000000&gt;;<br>
        ��� �� �};<br>
        ������� ...</tt><tt><br>
      </tt><tt>
        ��� ��� clk_uart1: clock@6 {</tt><tt><br>
      </tt><tt>��� ��� ��� compatible = "fixed-factor-clock";</tt><tt><br>
      </tt><tt>��� ��� ��� clocks = &lt;&amp;clk_core&gt;;</tt><tt><br>
      </tt><tt>��� ��� ��� #clock-cells = &lt;0&gt;;</tt><tt><br>
      </tt><tt>��� ��� ��� clock-div = &lt;1&gt;;</tt><tt><br>
      </tt><tt>��� ��� ��� clock-mult = &lt;2&gt;;</tt><tt><br>
      </tt><tt>��� ��� };</tt><tt><br>
      </tt><tt>��� };</tt><tt><br>
      </tt><tt><br>
      </tt></small>Phil<br>
    <br>
    <div class="moz-cite-prefix">On 10/09/2015 16:57, Martin Sperl
      wrote:<br>
    </div>
    <blockquote
      cite="mid:8B777380-A2A1-475E-8A1C-942BF28EE160@martin.sperl.org"
      type="cite">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">On 10.09.2015, at 17:48, Noralf Tr�nnes <a class="moz-txt-link-rfc2396E" href="mailto:noralf@tronnes.org">&lt;noralf@tronnes.org&gt;</a> wrote:

This looks interesting.
But there's a challenge with the uart1 and the 8250 driver.

Phil Elwell has this to say:
This means that that UART1 isn't an exact clone of a 8250 UART.
In a particular, the clock divisor is calculated differently.
A standard 8250 derives the baud rate as clock/(divisor16),
whereas the BCM2835 mini UART uses clock/(divisor8). This means
that if you want to use the standard driver then you need to lie
about the clock frequency, providing a value is twice the real
value, in order for a suitable divisor to be calculated.

Ref: <a class="moz-txt-link-freetext" href="https://github.com/raspberrypi/linux/pull/1008#issuecomment-139234607">https://github.com/raspberrypi/linux/pull/1008#issuecomment-139234607</a>

So either we need a new uart1 driver or a doubled clock freq. somehow.
</pre>
      </blockquote>
      <pre wrap="">
Found out the same thing and communicated it to Eric - not 
knowing about the different divider�

Martin</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------070201010405030201070908--
