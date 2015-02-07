Return-Path: <gordon@bosvangennip.nl>
Message-ID: <54D6299B.70707@bosvangennip.nl>
Date: Sat, 07 Feb 2015 16:04:59 +0100
From: Gordon Bos <gordon@bosvangennip.nl>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] arm: Fix unavailable MTD userland devices on Excito
 B3 boards
References: <1423212311-10793-1-git-send-email-gordon@bosvangennip.nl> <54D484D8.8090801@free-electrons.com>
In-Reply-To: <54D484D8.8090801@free-electrons.com>
Content-Type: multipart/alternative;
 boundary="------------070101070002080003090903"
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------070101070002080003090903
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I've had some further discussion on this with another B3 owner.
According to an old patch that Excito corporation built for kernel
version 2.6 the flash memory is in fact a ||Numonyx MP25P16
The driver however must be m25p80.

It would therefore seem cleaner to just correct the driver reference
and leave the label as is. The patch thus becomes:

Signed-off-by: Gordon Bos <gordon@bosvangennip.nl>
---
  arch/arm/boot/dts/kirkwood-b3.dts | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/kirkwood-b3.dts b/arch/arm/boot/dts/kirkwood-b3.dts
index c9247f8..5c6e8d3 100644
--- a/arch/arm/boot/dts/kirkwood-b3.dts
+++ b/arch/arm/boot/dts/kirkwood-b3.dts
@@ -74,7 +74,7 @@
  			m25p16@0 {
  				#address-cells = <1>;
  				#size-cells = <1>;
-				compatible = "st,m25p16";
+				compatible = "st,m25p80";
  				reg = <0>;
  				spi-max-frequency = <40000000>;
  				mode = <0>;
---

Regards,
Gordon Bos


On 02/06/2015 10:09 AM, Gregory CLEMENT wrote:
> Hi Gordon,
>
>
> On 06/02/2015 09:45, Gordon Bos wrote:
>> Excito B3 boards use SPI flash for booting and several userland
>> functions require access to this flash memory, including power down
>> control. However /proc/mtd shows an empty list and the userland
>> tools respond with "device not found".
> The change in arm/boot/dts don't go through the device tree subsystem
> but through the arm-soc one. Especially it it is only a fix and if
> you don't introduce or modifying a binding. For this kind of patch
> you should cc the mvebu maintainers (I added the others one)
>
> However it seems that the get_maintainer.pl script is misleading on this
> point we should maybe be updating the MAINTAINERS file.
>
>> Change driver reference for spi@10600 to M25P80
>>
>> Verified on my own Excito B3
> This change looks OK for me however it is too late to merge it
> and it will be part of the next merge window.
>
> Andrew, as you initially wrote this dts would you have a look on it?
>
> As it is a fix we will also apply to the stable branches. It would
> help if you could tell us since when this bug is present.
>
>
> Thanks,
>
> Gregory
>
>
>> Signed-off-by: Gordon Bos <gordon@bosvangennip.nl>
>> ---
>>   arch/arm/boot/dts/kirkwood-b3.dts | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/kirkwood-b3.dts b/arch/arm/boot/dts/kirkwood-b3.dts
>> index c9247f8..4b1e414 100644
>> --- a/arch/arm/boot/dts/kirkwood-b3.dts
>> +++ b/arch/arm/boot/dts/kirkwood-b3.dts
>> @@ -71,10 +71,10 @@
>>   		spi@10600 {
>>   			status = "okay";
>>   
>> -			m25p16@0 {
>> +			m25p80@0 {
>>   				#address-cells = <1>;
>>   				#size-cells = <1>;
>> -				compatible = "st,m25p16";
>> +				compatible = "st,m25p80";
>>   				reg = <0>;
>>   				spi-max-frequency = <40000000>;
>>   				mode = <0>;
>>
>


--------------070101070002080003090903
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Hi,<br>
      <br>
      I've had some further discussion on this with another B3 owner.<br>
      According to an old patch that Excito corporation built for kernel<br>
      version 2.6 the flash memory is in fact a <code></code>Numonyx
      MP25P16<br>
      The driver however must be m25p80.<br>
      <br>
      It would therefore seem cleaner to just correct the driver
      reference<br>
      and leave the label as is. The patch thus becomes:<br>
      <br>
      <pre wrap="">Signed-off-by: Gordon Bos <a class="moz-txt-link-rfc2396E" href="mailto:gordon@bosvangennip.nl">&lt;gordon@bosvangennip.nl&gt;</a>
---
 arch/arm/boot/dts/kirkwood-b3.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/kirkwood-b3.dts b/arch/arm/boot/dts/kirkwood-b3.dts
index c9247f8..5c6e8d3 100644
--- a/arch/arm/boot/dts/kirkwood-b3.dts
+++ b/arch/arm/boot/dts/kirkwood-b3.dts
@@ -74,7 +74,7 @@
 			m25p16@0 {
 				#address-cells = &lt;1&gt;;
 				#size-cells = &lt;1&gt;;
-				compatible = "st,m25p16";
+				compatible = "st,m25p80";
 				reg = &lt;0&gt;;
 				spi-max-frequency = &lt;40000000&gt;;
 				mode = &lt;0&gt;;
---
</pre>
      Regards,<br>
      Gordon Bos<br>
      <br>
      <br>
      On 02/06/2015 10:09 AM, Gregory CLEMENT wrote:<br>
    </div>
    <blockquote cite="mid:54D484D8.8090801@free-electrons.com"
      type="cite">
      <pre wrap="">Hi Gordon,


On 06/02/2015 09:45, Gordon Bos wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Excito B3 boards use SPI flash for booting and several userland
functions require access to this flash memory, including power down
control. However /proc/mtd shows an empty list and the userland
tools respond with "device not found".
</pre>
      </blockquote>
      <pre wrap="">
The change in arm/boot/dts don't go through the device tree subsystem
but through the arm-soc one. Especially it it is only a fix and if
you don't introduce or modifying a binding. For this kind of patch
you should cc the mvebu maintainers (I added the others one)

However it seems that the get_maintainer.pl script is misleading on this
point we should maybe be updating the MAINTAINERS file.

</pre>
      <blockquote type="cite">
        <pre wrap="">
Change driver reference for spi@10600 to M25P80

Verified on my own Excito B3
</pre>
      </blockquote>
      <pre wrap="">
This change looks OK for me however it is too late to merge it
and it will be part of the next merge window.

Andrew, as you initially wrote this dts would you have a look on it?

As it is a fix we will also apply to the stable branches. It would
help if you could tell us since when this bug is present.


Thanks,

Gregory


</pre>
      <blockquote type="cite">
        <pre wrap="">
Signed-off-by: Gordon Bos <a class="moz-txt-link-rfc2396E" href="mailto:gordon@bosvangennip.nl">&lt;gordon@bosvangennip.nl&gt;</a>
---
 arch/arm/boot/dts/kirkwood-b3.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/kirkwood-b3.dts b/arch/arm/boot/dts/kirkwood-b3.dts
index c9247f8..4b1e414 100644
--- a/arch/arm/boot/dts/kirkwood-b3.dts
+++ b/arch/arm/boot/dts/kirkwood-b3.dts
@@ -71,10 +71,10 @@
 		spi@10600 {
 			status = "okay";
 
-			m25p16@0 {
+			m25p80@0 {
 				#address-cells = &lt;1&gt;;
 				#size-cells = &lt;1&gt;;
-				compatible = "st,m25p16";
+				compatible = "st,m25p80";
 				reg = &lt;0&gt;;
 				spi-max-frequency = &lt;40000000&gt;;
 				mode = &lt;0&gt;;

</pre>
      </blockquote>
      <pre wrap="">

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------070101070002080003090903--
