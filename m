Return-Path: <SRS0=VsKq=OP=sifive.com=paul.walmsley@kernel.org>
Subject: Re: [PATCH] dt-bindings: sifive: describe sifive-blocks versioning
References: <alpine.DEB.2.21.9999.1811211704520.16271@viisi.sifive.com>
 <eda63b4a-4371-7d34-38a0-d7136dfc417f@wdc.com>
From: Paul Walmsley <paul.walmsley@sifive.com>
Message-ID: <cbc3b182-04d8-2104-4ab0-a15396d0c1ac@sifive.com>
Date: Wed, 5 Dec 2018 18:00:46 -0800
MIME-Version: 1.0
In-Reply-To: <eda63b4a-4371-7d34-38a0-d7136dfc417f@wdc.com>
Content-Type: multipart/alternative;
 boundary="------------565ED74E9490D2EC9466106B"
Content-Language: en-US
To: Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "paul@pwsan.com" <paul@pwsan.com>, Megan Wachs <megan@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Wesley Terpstra <wesley@sifive.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------565ED74E9490D2EC9466106B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Atish,


On 11/21/18 5:33 PM, Atish Patra wrote:
> On 11/21/18 5:07 PM, Paul Walmsley wrote:
>>
>> For IP blocks that are generated from the public, open-source
>> sifive-blocks repository, describe the version numbering policy
>> that its maintainers intend to use, upon request from Rob
>> Herring <robh@kernel.org>.
>>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Palmer Dabbelt <palmer@sifive.com>
>> Cc: Megan Wachs <megan@sifive.com>
>> Cc: Wesley Terpstra <wesley@sifive.com>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-riscv@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
>> Signed-off-by: Paul Walmsley <paul@pwsan.com>
>> ---
>>
>> Hi Rob, please let me know if this document works with your
>> requirements, or if some changes are needed.  - Paul
>>
>>   .../sifive/sifive-blocks-ip-versioning.txt    | 38 +++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>   create mode 100644
>> Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
>>
>> diff --git
>> a/Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
>> b/Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
>>
>> new file mode 100644
>> index 000000000000..b899e5c6e00c
>> --- /dev/null
>> +++
>> b/Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
>
> It should be be under
> Documentation/devicetree/bindings/riscv/sifive/sifive-blocks-ip-versioning.txt
> ?


These IP blocks could be used with any CPU architecture - ARM, x86,
MIPS, etc. - so it probably makes sense just to keep them under sifive/,
rather than associating them with a specific CPU architecture.


>
>> @@ -0,0 +1,38 @@
>> +DT compatible string versioning for SiFive open-source IP blocks
>> +
>> +This document describes the version specification for DT "compatible"
>> +strings for open-source SiFive IP blocks.  HDL for these IP blocks
>> +can be found in this public repository:
>> +
>> +https://github.com/sifive/sifive-blocks
>> +
>> +IP block-specific DT compatible strings are contained within the HDL,
>> +in the form "sifive,<ip-block-name><integer version number>".
>> +
>> +An example is "sifive,uart0" from:
>> +
>> +https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/devices/uart/UART.scala#L43
>>
>> +
>> +Until these IP blocks (or IP integration) support version
>> +autodiscovery, the maintainers of these IP blocks intend to increment
>
> /s/autodiscovery/auto discovery


I've changed it to "auto-discovery" per your request.  Let me know if
it's not OK for you


>
>> +the suffixed number in the compatible string whenever the software
>> +interface to these IP blocks changes, or when the functionality of the
>> +underlying IP blocks changes in a way that software should be aware of.
>> +
>> +Driver developers can use compatible string "match" values such as
>> +"sifive,uart0" to indicate that their driver is compatible with the
>> +register interface and functionality associated with the relevant
>> +upstream sifive-blocks commits.  It is expected that most drivers will
>> +match on these IP block-specific compatible strings.
>> +
>> +DT data authors, when writing data for a particular SoC, should
>> +continue to specify an SoC-specific compatible string value, such as
>> +"sifive,fu540-c000-uart".  This way, if SoC-specific
>> +integration-specific bug fixes or workarounds are needed, the kernel
>> +or other system software can match on this string to apply them.  The
>> +IP block-specific compatible string (such as "sifive,uart0") should
>> +then be specified as a subsequent value.
>> +
>> +An example of this style:
>> +
>> +    compatible = "sifive,fu540-c000-uart", "sifive,uart0";
>>
>
> Just for the sake of completion, should this document also specify
> what should be the style of any possible closed IP as well?


Let's handle those separately, as Palmer discussed.


Thanks for the review,


- Paul


--------------565ED74E9490D2EC9466106B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi Atish,</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/21/18 5:33 PM, Atish Patra wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:eda63b4a-4371-7d34-38a0-d7136dfc417f@wdc.com">On
      11/21/18 5:07 PM, Paul Walmsley wrote:
      <br>
      <blockquote type="cite">
        <br>
        For IP blocks that are generated from the public, open-source
        <br>
        sifive-blocks repository, describe the version numbering policy
        <br>
        that its maintainers intend to use, upon request from Rob
        <br>
        Herring <a class="moz-txt-link-rfc2396E" href="mailto:robh@kernel.org">&lt;robh@kernel.org&gt;</a>.
        <br>
        <br>
        Cc: Rob Herring <a class="moz-txt-link-rfc2396E" href="mailto:robh+dt@kernel.org">&lt;robh+dt@kernel.org&gt;</a>
        <br>
        Cc: Palmer Dabbelt <a class="moz-txt-link-rfc2396E" href="mailto:palmer@sifive.com">&lt;palmer@sifive.com&gt;</a>
        <br>
        Cc: Megan Wachs <a class="moz-txt-link-rfc2396E" href="mailto:megan@sifive.com">&lt;megan@sifive.com&gt;</a>
        <br>
        Cc: Wesley Terpstra <a class="moz-txt-link-rfc2396E" href="mailto:wesley@sifive.com">&lt;wesley@sifive.com&gt;</a>
        <br>
        Cc: Mark Rutland <a class="moz-txt-link-rfc2396E" href="mailto:mark.rutland@arm.com">&lt;mark.rutland@arm.com&gt;</a>
        <br>
        Cc: <a class="moz-txt-link-abbreviated" href="mailto:devicetree@vger.kernel.org">devicetree@vger.kernel.org</a>
        <br>
        Cc: <a class="moz-txt-link-abbreviated" href="mailto:linux-riscv@lists.infradead.org">linux-riscv@lists.infradead.org</a>
        <br>
        Cc: <a class="moz-txt-link-abbreviated" href="mailto:linux-kernel@vger.kernel.org">linux-kernel@vger.kernel.org</a>
        <br>
        Signed-off-by: Paul Walmsley <a class="moz-txt-link-rfc2396E" href="mailto:paul.walmsley@sifive.com">&lt;paul.walmsley@sifive.com&gt;</a>
        <br>
        Signed-off-by: Paul Walmsley <a class="moz-txt-link-rfc2396E" href="mailto:paul@pwsan.com">&lt;paul@pwsan.com&gt;</a>
        <br>
        ---
        <br>
        <br>
        Hi Rob, please let me know if this document works with your
        <br>
        requirements, or if some changes are needed.  - Paul
        <br>
        <br>
          .../sifive/sifive-blocks-ip-versioning.txt    | 38
        +++++++++++++++++++
        <br>
          1 file changed, 38 insertions(+)
        <br>
          create mode 100644
        Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
        <br>
        <br>
        diff --git
a/Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
b/Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
        <br>
        new file mode 100644
        <br>
        index 000000000000..b899e5c6e00c
        <br>
        --- /dev/null
        <br>
        +++
b/Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt<br>
      </blockquote>
      <br>
      It should be be under
Documentation/devicetree/bindings/riscv/sifive/sifive-blocks-ip-versioning.txt
      ?
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>These IP blocks could be used with any CPU architecture - ARM,
      x86, MIPS, etc. - so it probably makes sense just to keep them
      under sifive/, rather than associating them with a specific CPU
      architecture.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:eda63b4a-4371-7d34-38a0-d7136dfc417f@wdc.com">
      <br>
      <blockquote type="cite">@@ -0,0 +1,38 @@
        <br>
        +DT compatible string versioning for SiFive open-source IP
        blocks
        <br>
        +
        <br>
        +This document describes the version specification for DT
        "compatible"
        <br>
        +strings for open-source SiFive IP blocks.  HDL for these IP
        blocks
        <br>
        +can be found in this public repository:
        <br>
        +
        <br>
        +https://github.com/sifive/sifive-blocks
        <br>
        +
        <br>
        +IP block-specific DT compatible strings are contained within
        the HDL,
        <br>
        +in the form "sifive,&lt;ip-block-name&gt;&lt;integer version
        number&gt;".
        <br>
        +
        <br>
        +An example is "sifive,uart0" from:
        <br>
        +
        <br>
+https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/devices/uart/UART.scala#L43
        <br>
        +
        <br>
        +Until these IP blocks (or IP integration) support version
        <br>
        +autodiscovery, the maintainers of these IP blocks intend to
        increment
        <br>
      </blockquote>
      <br>
      /s/autodiscovery/auto discovery
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>I've changed it to "auto-discovery" per your request.  Let me
      know if it's not OK for you<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:eda63b4a-4371-7d34-38a0-d7136dfc417f@wdc.com">
      <br>
      <blockquote type="cite">+the suffixed number in the compatible
        string whenever the software
        <br>
        +interface to these IP blocks changes, or when the functionality
        of the
        <br>
        +underlying IP blocks changes in a way that software should be
        aware of.
        <br>
        +
        <br>
        +Driver developers can use compatible string "match" values such
        as
        <br>
        +"sifive,uart0" to indicate that their driver is compatible with
        the
        <br>
        +register interface and functionality associated with the
        relevant
        <br>
        +upstream sifive-blocks commits.  It is expected that most
        drivers will
        <br>
        +match on these IP block-specific compatible strings.
        <br>
        +
        <br>
        +DT data authors, when writing data for a particular SoC, should
        <br>
        +continue to specify an SoC-specific compatible string value,
        such as
        <br>
        +"sifive,fu540-c000-uart".  This way, if SoC-specific
        <br>
        +integration-specific bug fixes or workarounds are needed, the
        kernel
        <br>
        +or other system software can match on this string to apply
        them.  The
        <br>
        +IP block-specific compatible string (such as "sifive,uart0")
        should
        <br>
        +then be specified as a subsequent value.
        <br>
        +
        <br>
        +An example of this style:
        <br>
        +
        <br>
        +    compatible = "sifive,fu540-c000-uart", "sifive,uart0";
        <br>
        <br>
      </blockquote>
      <br>
      Just for the sake of completion, should this document also specify
      what should be the style of any possible closed IP as well?
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>Let's handle those separately, as Palmer discussed.</p>
    <p><br>
    </p>
    <p>Thanks for the review,</p>
    <p><br>
    </p>
    <p>- Paul<br>
    </p>
  </body>
</html>

--------------565ED74E9490D2EC9466106B--
