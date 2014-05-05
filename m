Return-Path: <george.cherian@ti.com>
Message-ID: <536745F6.9080402@ti.com>
Date: Mon, 5 May 2014 13:34:06 +0530
From: George Cherian <george.cherian@ti.com>
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/5] Add USB nodes for am43xx epos and gp evm
References: <1395223803-4714-1-git-send-email-george.cherian@ti.com> <20140425161912.GY29632@saruman.home>
In-Reply-To: <20140425161912.GY29632@saruman.home>
Content-Type: multipart/alternative;
	boundary="------------010402040508090606000206"
To: balbi@ti.com, Benoit Cousson <bcousson@baylibre.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, linux-omap@vger.kernel.org, rogerq@ti.com, kishon@ti.com, rob@landley.net, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, tony@atomide.com, anatol.pomozov@gmail.com, bcousson@baylibre.com
List-ID: <devicetree@vger.kernel.org>

--------------010402040508090606000206
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Benoit,

On 4/25/2014 9:49 PM, Felipe Balbi wrote:
> On Wed, Mar 19, 2014 at 03:39:58PM +0530, George Cherian wrote:
>> The patch series adds USB dt nodes for am43xx epos and gp evm
>> Boot tested with linux-next + Tony's omap-for-v3.15/dt
>>
>> Changes from v1 -> v2
>> 	* Reorder "doc: Add "ti,am437x-dwc3" comaptible for dwc3 glue"
>> 	* Address v1 coments on "ARM: dts: AM4372: Add USB nodes"
>>
>> Changes from v2 -> v3
>> 	* Removed unwanted dwc3_1 and dwc3_2 nodes from am437x-gp-evm.dts
>> 	  and am43x-epos-evm.dts
>>
>> Changes from v3 -> v4
>> 	* Refreshed on top of Tony's omap-for-v3.15/dt tree
>> 	* Added usb_phy0_always_on_clk32k and usb_phy1_always_on_clk32k Patch 2
>> 	* Used the above clocks in Patch 3
>> 	* Patch 4 and 5 edited the unwanted portions of commit log
>>
>> Changes from v4 -> v5
>> 	* Address Roger's comment for the clock data
>>
>> George Cherian (5):
>>    doc: Add "ti,am437x-dwc3" comaptible for dwc3 glue
>>    ARM: dts: am43xx clock data
>>    ARM: dts: AM4372: Add USB nodes
>>    ARM: dts: am437x-gp-evm: Enable USB
>>    ARM: dts: am43x-epos-evm: Enable USB
>>
>>   Documentation/devicetree/bindings/usb/omap-usb.txt |  4 +-
>>   arch/arm/boot/dts/am4372.dtsi                      | 94 ++++++++++++++++++++++
>>   arch/arm/boot/dts/am437x-gp-evm.dts                | 18 +++++
>>   arch/arm/boot/dts/am43x-epos-evm.dts               | 18 +++++
>>   arch/arm/boot/dts/am43xx-clocks.dtsi               | 32 ++++++++
>>   5 files changed, 165 insertions(+), 1 deletion(-)
> Is this applied anywhere yet ? Benoit, are you taking this for v3.16
> merge window ?
>
Ping on this series.

-- 
-George


--------------010402040508090606000206
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Hi Benoit,<br>
      <br>
      On 4/25/2014 9:49 PM, Felipe Balbi wrote:<br>
    </div>
    <blockquote cite="mid:20140425161912.GY29632@saruman.home"
      type="cite">
      <pre wrap="">On Wed, Mar 19, 2014 at 03:39:58PM +0530, George Cherian wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">The patch series adds USB dt nodes for am43xx epos and gp evm
Boot tested with linux-next + Tony's omap-for-v3.15/dt

Changes from v1 -&gt; v2
	* Reorder "doc: Add "ti,am437x-dwc3" comaptible for dwc3 glue"
	* Address v1 coments on "ARM: dts: AM4372: Add USB nodes"  

Changes from v2 -&gt; v3
	* Removed unwanted dwc3_1 and dwc3_2 nodes from am437x-gp-evm.dts 
	  and am43x-epos-evm.dts 

Changes from v3 -&gt; v4
	* Refreshed on top of Tony's omap-for-v3.15/dt tree
	* Added usb_phy0_always_on_clk32k and usb_phy1_always_on_clk32k Patch 2
	* Used the above clocks in Patch 3 
	* Patch 4 and 5 edited the unwanted portions of commit log

Changes from v4 -&gt; v5
	* Address Roger's comment for the clock data

George Cherian (5):
  doc: Add "ti,am437x-dwc3" comaptible for dwc3 glue
  ARM: dts: am43xx clock data
  ARM: dts: AM4372: Add USB nodes
  ARM: dts: am437x-gp-evm: Enable USB
  ARM: dts: am43x-epos-evm: Enable USB

 Documentation/devicetree/bindings/usb/omap-usb.txt |  4 +-
 arch/arm/boot/dts/am4372.dtsi                      | 94 ++++++++++++++++++++++
 arch/arm/boot/dts/am437x-gp-evm.dts                | 18 +++++
 arch/arm/boot/dts/am43x-epos-evm.dts               | 18 +++++
 arch/arm/boot/dts/am43xx-clocks.dtsi               | 32 ++++++++
 5 files changed, 165 insertions(+), 1 deletion(-)
</pre>
      </blockquote>
      <pre wrap="">
Is this applied anywhere yet ? Benoit, are you taking this for v3.16
merge window ?

</pre>
    </blockquote>
    <font size="-1"><font face="Courier New">Ping on this series. </font></font><br>
    <br>
    <pre class="moz-signature" cols="72">-- 
-George
</pre>
  </body>
</html>

--------------010402040508090606000206--
