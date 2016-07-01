Return-Path: <wulf@rock-chips.com>
Message-ID: <5775E944.4020602@rock-chips.com>
Date: Fri, 01 Jul 2016 11:53:40 +0800
From: William Wu <william.wu@rock-chips.com>
MIME-Version: 1.0
Subject: Re: [PATCH v5 3/5] usb: dwc3: add phyif_utmi_quirk[Involving remittance
 information, please pay attention to the safety of property]
References: <1467285176-25222-1-git-send-email-william.wu@rock-chips.com> <1467285176-25222-4-git-send-email-william.wu@rock-chips.com> <20160701023552.GA26314@rob-hp-laptop>
In-Reply-To: <20160701023552.GA26314@rob-hp-laptop>
Content-Type: multipart/alternative;
 boundary="------------020208070801050500040804"
To: Rob Herring <robh@kernel.org>
Cc: gregkh@linuxfoundation.org, balbi@kernel.org, heiko@sntech.de, linux-rockchip@lists.infradead.org, briannorris@google.com, dianders@google.com, kever.yang@rock-chips.com, huangtao@rock-chips.com, frank.wang@rock-chips.com, eddie.cai@rock-chips.com, John.Youn@synopsys.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, sergei.shtylyov@cogentembedded.com, mark.rutland@arm.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------020208070801050500040804
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Dear Rob,

On 07/01/2016 10:35 AM, Rob Herring wrote:
> On Thu, Jun 30, 2016 at 07:12:54PM +0800, William Wu wrote:
>> Add a quirk to configure the core to support the
>> UTMI+ PHY with an 8- or 16-bit interface. UTMI+ PHY
>> interface is hardware property, and it's platform
>> dependent. Normall, the PHYIf can be configured
>> during coreconsultant. But for some specific usb
>> cores(e.g. rk3399 soc dwc3), the default PHYIf
>> configuration value is fault, so we need to
>> reconfigure it by software.
>>
>> And refer to the dwc3 databook, the GUSB2PHYCFG.USBTRDTIM
>> must be set to the corresponding value according to
>> the UTMI+ PHY interface.
>>
>> Signed-off-by: William Wu <william.wu@rock-chips.com>
>> ---
>> Changes in v5:
>> - None
>>
>> Changes in v4:
>> - rebase on top of balbi testing/next, remove pdata (balbi)
>>
>> Changes in v3:
>> - None
>>
>> Changes in v2:
>> - add a quirk for phyif_utmi (balbi)
>>
>>   Documentation/devicetree/bindings/usb/dwc3.txt |  4 ++++
>>   drivers/usb/dwc3/core.c                        | 19 +++++++++++++++++++
>>   drivers/usb/dwc3/core.h                        | 12 ++++++++++++
>>   3 files changed, 35 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
>> index 1ada121..34d13a5 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>> @@ -42,6 +42,10 @@ Optional properties:
>>    - snps,dis_u2_freeclk_exists_quirk: when set, clear the u2_freeclk_exists
>>   			in GUSB2PHYCFG, specify that USB2 PHY doesn't provide
>>   			a free-running PHY clock.
>> + - snps,phyif_utmi_quirk: when set core will set phyif UTMI+ interface.
> This isn't really what I'd call a quirk.
I'm sorry that add you in the review list too late.

Actually, I have discussed the property "snps,phyif_utmi_quirk"
with balbi in patch v2.

As we know, UTMI+ PHY interface is hardware property, and
it can be configured correctly during coreconsulttant according
to dwc3 TRM, section 8.1.1 Table 8-1 where itstates:

|-------------+-------------------------------------------------------------------------------------|
| GUSB2PHYCFG | Program the following PHY configuration fields: USBTrdTim, |
|             | FSIntf, PHYIf, TOUTCal, or leave the default values if  
                        |
|             | the correct power-on values were selected 
during                             |
|             | coreConsultant configuration.  Note: The PHY must 
not                     |
|             | be enabled for auto-resume in device mode. Hence 
the                    |
|             | field GUSB2PHYCFG[15] (ULPIAutoRes) must be 
written                    |
|             | with '0' during the power-on initialization in case     
                          |
|             | the reset value is '1'. |
| | |
|-------------+------------------------------------------------------------------------------------|

But for some specific usb cores(e.g. rk3399 soc dwc3),  the default
PHYIf configuration value is fault after core init, ad we need to
reconfigure it by software. so I think maybe a quirk is more proper.

>
>> + - snps,phyif_utmi: the value to configure the core to support a UTMI+ PHY
>> +			with an 8- or 16-bit interface. Value 0 select 8-bit
>> +			interface, value 1 select 16-bit interface.
> These seem like they should be standard properties for setting the phy
> type/mode. I think we already have something defined in fact.
Yes, it's standard properties for setting the phy interface.
But as I describe above, for most of dwc3 cores designed
by IC vendors, the phy interface can be automatically set
with correct value during coreConsultant configuration,
and don't need to reconfigure it by software. For now,
I haven't found any SoC had this issue except rk3399,
and dwc3 driver also doesn't have any defined similar to
what I defined here.

Best Regards
      William Wu
>
> Rob
>
>
>


--------------020208070801050500040804
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Dear Rob,<br>
      <br>
      On 07/01/2016 10:35 AM, Rob Herring wrote:<br>
    </div>
    <blockquote cite="mid:20160701023552.GA26314@rob-hp-laptop"
      type="cite">
      <pre wrap="">On Thu, Jun 30, 2016 at 07:12:54PM +0800, William Wu wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Add a quirk to configure the core to support the
UTMI+ PHY with an 8- or 16-bit interface. UTMI+ PHY
interface is hardware property, and it's platform
dependent. Normall, the PHYIf can be configured
during coreconsultant. But for some specific usb
cores(e.g. rk3399 soc dwc3), the default PHYIf
configuration value is fault, so we need to
reconfigure it by software.

And refer to the dwc3 databook, the GUSB2PHYCFG.USBTRDTIM
must be set to the corresponding value according to
the UTMI+ PHY interface.

Signed-off-by: William Wu <a class="moz-txt-link-rfc2396E" href="mailto:william.wu@rock-chips.com">&lt;william.wu@rock-chips.com&gt;</a>
---
Changes in v5:
- None

Changes in v4:
- rebase on top of balbi testing/next, remove pdata (balbi)

Changes in v3:
- None

Changes in v2:
- add a quirk for phyif_utmi (balbi)

 Documentation/devicetree/bindings/usb/dwc3.txt |  4 ++++
 drivers/usb/dwc3/core.c                        | 19 +++++++++++++++++++
 drivers/usb/dwc3/core.h                        | 12 ++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 1ada121..34d13a5 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -42,6 +42,10 @@ Optional properties:
  - snps,dis_u2_freeclk_exists_quirk: when set, clear the u2_freeclk_exists
 			in GUSB2PHYCFG, specify that USB2 PHY doesn't provide
 			a free-running PHY clock.
+ - snps,phyif_utmi_quirk: when set core will set phyif UTMI+ interface.
</pre>
      </blockquote>
      <pre wrap="">
This isn't really what I'd call a quirk.</pre>
    </blockquote>
    I'm sorry that add you in the review list too late.<br>
    <br>
    Actually, I have discussed the property "snps,phyif_utmi_quirk"<br>
    with balbi in patch v2.<br>
    <br>
    As we know, UTMI+ PHY interface is hardware property, and<br>
    it can be configured correctly during coreconsulttant according<br>
    to dwc3 TRM, section 8.1.1 Table 8-1 where itstates:<br>
    <br>
    <small>|-------------+-------------------------------------------------------------------------------------|<br>
      | GUSB2PHYCFG | Program the following PHY configuration fields:
      USBTrdTim, |<br>
      |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FSIntf, PHYIf, TOUTCal, or leave the default
      values if&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; |<br>
      |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | the correct power-on values were selected
      during&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
      |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | coreConsultant configuration.&nbsp; Note: The PHY must
      not&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
      |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | be enabled for auto-resume in device mode. Hence
      the&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
      |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | field GUSB2PHYCFG[15] (ULPIAutoRes) must be
      written&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
      |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | with '0' during the power-on initialization in
      case&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; |<br>
      |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | the reset value is
      '1'.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      |<br>
      |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      |<br>
|-------------+------------------------------------------------------------------------------------|</small><br>
    <br>
    But for some specific usb cores(e.g. rk3399 soc dwc3),&nbsp; the default<br>
    PHYIf configuration value is fault after core init, ad we need to<br>
    reconfigure it by software. so I think maybe a quirk is more proper.<br>
    <br>
    <blockquote cite="mid:20160701023552.GA26314@rob-hp-laptop"
      type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+ - snps,phyif_utmi: the value to configure the core to support a UTMI+ PHY
+			with an 8- or 16-bit interface. Value 0 select 8-bit
+			interface, value 1 select 16-bit interface.
</pre>
      </blockquote>
      <pre wrap="">
These seem like they should be standard properties for setting the phy 
type/mode. I think we already have something defined in fact.</pre>
    </blockquote>
    Yes, it's standard properties for setting the phy interface.<br>
    But as I describe above, for most of dwc3 cores designed<br>
    by IC vendors, the phy interface can be automatically set<br>
    with correct value during coreConsultant configuration,<br>
    and don't need to reconfigure it by software. For now,<br>
    I haven't found any SoC had this issue except rk3399,<br>
    and dwc3 driver also doesn't have any defined similar to<br>
    what I defined here.<br>
    <br>
    Best Regards<br>
    &nbsp; &nbsp;&nbsp; William Wu
    <blockquote cite="mid:20160701023552.GA26314@rob-hp-laptop"
      type="cite">
      <pre wrap="">

Rob



</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------020208070801050500040804--
