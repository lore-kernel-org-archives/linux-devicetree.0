Return-Path: <zain.wang@rock-chips.com>
From: Zain <zain.wang@rock-chips.com>
Subject: Re: [RESEND PATCH 4/4] crypto: rk_crypto - add DT bindings
 documentation
References: <1446193369-4453-1-git-send-email-zain.wang@rock-chips.com>
 <1446193369-4453-5-git-send-email-zain.wang@rock-chips.com>
 <1830252.moyLTPMs2Y@phil>
Message-ID: <56381BD7.9070209@rock-chips.com>
Date: Tue, 3 Nov 2015 10:28:39 +0800
MIME-Version: 1.0
In-Reply-To: <1830252.moyLTPMs2Y@phil>
Content-Type: multipart/alternative;
 boundary="------------030809040902070301020803"
To: Heiko Stuebner <heiko@sntech.de>
Cc: zhengsq@rock-chips.com, hl@rock-chips.com, herbert@gondor.apana.org.au, davem@davemloft.net, mturquette@baylibre.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, galak@codeaurora.org, linux@arm.linux.org.uk, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, eddie.cai@rock-chips.com
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------030809040902070301020803
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Heiko,

On 2015年10月30日 22:08, Heiko Stuebner wrote:
> Hi,
>
> Am Freitag, 30. Oktober 2015, 16:22:49 schrieb Zain Wang:
>> Add DT bindings documentation for the rk3288 crypto drivers.
>>
>> Signed-off-by: Zain Wang <zain.wang@rock-chips.com>
>> ---
>>  .../devicetree/bindings/crypto/rk-crypto.txt       | 31 ++++++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/crypto/rk-crypto.txt
>>
>> diff --git a/Documentation/devicetree/bindings/crypto/rk-crypto.txt b/Documentation/devicetree/bindings/crypto/rk-crypto.txt
>> new file mode 100644
>> index 0000000..1e50768
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/crypto/rk-crypto.txt
>> @@ -0,0 +1,31 @@
>> +Rockchip Electronics And Security Accelerator
>> +
>> +Required properties:
>> +- compatible: should be "rockchip,crypto"
>> +- reg: base physical address of the engine and length of memory mapped
>> +       region.
>> +- interrupts: interrupt number
>> +- clocks: clock specifiers
>> +- clock-names: "aclk_crypto" used to clock data
>> +			   "hclk_crypto" used to clock data
>> +			   "srst_crypto" used to clock crypto accelerator
>> +			   "apb_pclk"    used to clock dma
> The TRM area of the crypto IP block does not specifiy any special naming for
> its clocks, but as a general rule clock names are in the scope of the ip block
> so there is no need to add _crypto to every one of them :-) .
>
> I'd suggest clock-names as "aclk", "hclk", "crypto" for the devicetree, with
> crypto being the clock that actually drives the operation.
ok! done!
> Secondly, why do you need to drive the clock of the peripheral dma-
> controller itself (your apb_pclk)? The documentation in the TRM is
> quite sparse, so this might very well be justified, but it looks odd that
> you need to control the dmac1-clock when it looks like the crypto block
> is doing its own dma and neither system-dma has any crypto-related
> channel.
>
> So I'd really like some explanation for this :-)
Because dmac1_clk(apb_pclk) is connected to NOC. NOC is the bus
inter-connect. Gating dmac1_clock will block this part of NOC transfer.
And crypto master is using this part of NOC transfer to access DDR/SRAM,
it would be wrong result without dmac1_clk. That's why dmac1_clk should
be refered here.
> Thanks
> Heiko
>
>
>
Thanks
Zain

--------------030809040902070301020803
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi Heiko,<br>
    <br>
    <div class="moz-cite-prefix">On 2015年10月30日 22:08, Heiko Stuebner
      wrote:<br>
    </div>
    <blockquote cite="mid:1830252.moyLTPMs2Y@phil" type="cite">
      <pre wrap="">Hi,

Am Freitag, 30. Oktober 2015, 16:22:49 schrieb Zain Wang:
</pre>
      <blockquote type="cite">
        <pre wrap="">Add DT bindings documentation for the rk3288 crypto drivers.

Signed-off-by: Zain Wang <a class="moz-txt-link-rfc2396E" href="mailto:zain.wang@rock-chips.com">&lt;zain.wang@rock-chips.com&gt;</a>
---
 .../devicetree/bindings/crypto/rk-crypto.txt       | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/rk-crypto.txt

diff --git a/Documentation/devicetree/bindings/crypto/rk-crypto.txt b/Documentation/devicetree/bindings/crypto/rk-crypto.txt
new file mode 100644
index 0000000..1e50768
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/rk-crypto.txt
@@ -0,0 +1,31 @@
+Rockchip Electronics And Security Accelerator
+
+Required properties:
+- compatible: should be "rockchip,crypto"
+- reg: base physical address of the engine and length of memory mapped
+       region.
+- interrupts: interrupt number
+- clocks: clock specifiers
+- clock-names: "aclk_crypto" used to clock data
+			   "hclk_crypto" used to clock data
+			   "srst_crypto" used to clock crypto accelerator
+			   "apb_pclk"    used to clock dma
</pre>
      </blockquote>
      <pre wrap="">The TRM area of the crypto IP block does not specifiy any special naming for
its clocks, but as a general rule clock names are in the scope of the ip block
so there is no need to add _crypto to every one of them :-) .

I'd suggest clock-names as "aclk", "hclk", "crypto" for the devicetree, with
crypto being the clock that actually drives the operation.</pre>
    </blockquote>
    ok! done!<br>
    <blockquote cite="mid:1830252.moyLTPMs2Y@phil" type="cite">
      <pre wrap="">Secondly, why do you need to drive the clock of the peripheral dma-
controller itself (your apb_pclk)? The documentation in the TRM is
quite sparse, so this might very well be justified, but it looks odd that
you need to control the dmac1-clock when it looks like the crypto block
is doing its own dma and neither system-dma has any crypto-related
channel.

So I'd really like some explanation for this :-)
</pre>
    </blockquote>
    Because dmac1_clk(apb_pclk) is connected to NOC. NOC is the bus
    inter-connect. Gating dmac1_clock will block this part of NOC
    transfer. And crypto master is using this part of NOC transfer to
    access DDR/SRAM, it would be wrong result without dmac1_clk. That's
    why dmac1_clk should be refered here.<span style="font-size: 10.5pt;
      line-height: 1.5; background-color: window;"><br>
    </span>
    <blockquote cite="mid:1830252.moyLTPMs2Y@phil" type="cite">
      <pre wrap="">Thanks
Heiko



</pre>
    </blockquote>
    Thanks<br>
    Zain<br>
  </body>
</html>

--------------030809040902070301020803--
