From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/4] Documentation: dt-bindings: add dt binding info for
 Rockchip dwc2
Date: Wed, 30 Jul 2014 15:29:29 -0700
Message-ID: <CAD=FV=VKJ2+y4Hh8x5oOPN=RTihth5uu2FKkgo2-74s+hAtGEA@mail.gmail.com>
References: <1406683873-18194-1-git-send-email-kever.yang@rock-chips.com>
 <1406683873-18194-2-git-send-email-kever.yang@rock-chips.com>
 <A2CA0424C0A6F04399FB9E1CD98E0304844C2F5B@US01WEMBX2.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <A2CA0424C0A6F04399FB9E1CD98E0304844C2F5B@US01WEMBX2.internal.synopsys.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Paul Zimmerman <Paul.Zimmerman@synopsys.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "rdunlap@infradead.org" <rdunlap@infradead.org>, "heiko@sntech.de" <heiko@sntech.de>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Kever Yang <kever.yang@rock-chips.com>, "xjq@rock-chips.com" <xjq@rock-chips.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "kishon@ti.com" <kishon@ti.com>, "lyz@rock-chips.com" <lyz@rock-chips.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "addy.ke@rock-chips.com" <addy.ke@rock-chips.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "mporter@linaro.org" <mporter@linaro.org>, "olof@lixom.net" <olof@lixom.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "wulf@rock-chips.com" <wulf@rock-chips.com>, "sonnyrao@chromium.org" <sonnyrao@chromium.org>
List-Id: devicetree@vger.kernel.org

Paul,

On Wed, Jul 30, 2014 at 11:53 AM, Paul Zimmerman
<Paul.Zimmerman@synopsys.com> wrote:
>> From: Kever Yang [mailto:kever.yang@rock-chips.com]
>> Sent: Tuesday, July 29, 2014 6:31 PM
>>
>> This add necessary dwc2 binding documentation for Rockchip socs:
>> rk3066, rk3188 and rk3288
>>
>> add dr_mode as optional properties.
>>
>> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
>> ---
>>  Documentation/devicetree/bindings/usb/dwc2.txt |    5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt
>> b/Documentation/devicetree/bindings/usb/dwc2.txt
>> index aa91034..eb80d7b 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc2.txt
>> +++ b/Documentation/devicetree/bindings/usb/dwc2.txt
>> @@ -4,6 +4,9 @@ Platform DesignWare HS OTG USB 2.0 controller
>>  Required properties:
>>  - compatible : One of:
>>    - brcm,bcm2835-usb: The DWC2 USB controller instance in the BCM2835 SoC.
>> +  - rockchip,rk3066-usb: The DWC2 USB controller instance in the rk3066 Soc;
>> +  - "rockchip,rk3188-usb","rockchip,rk3066-usb": for rk3188 Soc;
>> +  - "rockchip,rk3288-usb","rockchip,rk3066-usb": for rk3288 Soc;
>>    - snps,dwc2: A generic DWC2 USB controller with default parameters.
>
> Do you really need three different bindings here? I believe the
> recommended approach is to define one binding for the common case, and
> reuse it for similar SOCs. Additional bindings should only be added if
> there is some difference in the SOC that requires it.

I think that Kever is doing the right thing.  Although we might think
that we are 100% 3066 compatible right now, we might later decide that
there's some difference that we didn't think about.  The standard way
to handle this is to list several different modes like this.  In other
words, we say:

* We are really a rk3288.

* We're either exactly compatible with a rk3066 or mostly compatible
with an rk3066.  We certainly know that if we don't have a special
rk3288 driver that the rk3066 driver works pretty well.

* If we didn't have an rk3066 driver, we might be able to get some
functionality with the generic "snps,dwc2" driver (in fact I can mount
a USB stick and read files with the generic driver).


>>  - reg : Should contain 1 register range (address and length)
>>  - interrupts : Should contain 1 interrupt
>> @@ -15,6 +18,8 @@ Optional properties:
>>  - phys: phy provider specifier
>>  - phy-names: shall be "usb2-phy"
>>  Refer to phy/phy-bindings.txt for generic phy consumer properties
>> +- dr_mode: shall be one of "host", "peripheral" and "otg"
>
> I don't see where you use 'dr_mode' in any of the DTS files. Are you
> going to add the uses later? And please us a more descriptive name,
> such as 'dual-role-mode'.

We have some local patches that do this, since we have another board
where the OTG port needs to be forced into host mode.  As I said above
I think this should be split into a separate patch series, though,
since it's not rk3288-related.

Using dr_mode is the right thing because it matches all of the other
drivers and also the generic bindings.  See Kever's note saying "Refer
to usb/generic.txt".

-Doug
