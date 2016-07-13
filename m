From: "William.wu" <William.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v6 3/5] usb: dwc3: add phyif_utmi_quirk
Date: Wed, 13 Jul 2016 11:39:16 +0800
Message-ID: <77a15788-a460-7f59-cb52-88ce012f9eca@rock-chips.com>
References: <1467860066-15142-1-git-send-email-william.wu@rock-chips.com>
 <1467860066-15142-4-git-send-email-william.wu@rock-chips.com>
 <2213342.0Nx5tnEW8p@phil> <20160711145447.GA16636@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20160711145447.GA16636@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Rob,


On 2016/7/11 22:54, Rob Herring wrote:
> On Fri, Jul 08, 2016 at 02:33:09PM +0200, Heiko Stuebner wrote:
>> Hi William,
>>
>> Am Donnerstag, 7. Juli 2016, 10:54:24 schrieb William Wu:
>>> Add a quirk to configure the core to support the
>>> UTMI+ PHY with an 8- or 16-bit interface. UTMI+ PHY
>>> interface is hardware property, and it's platform
>>> dependent. Normall, the PHYIf can be configured
>>> during coreconsultant. But for some specific usb
>>> cores(e.g. rk3399 soc dwc3), the default PHYIf
>>> configuration value is fault, so we need to
>>> reconfigure it by software.
>>>
>>> And refer to the dwc3 databook, the GUSB2PHYCFG.USBTRDTIM
>>> must be set to the corresponding value according to
>>> the UTMI+ PHY interface.
>>>
>>> Signed-off-by: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>> ---
>> [...]
>>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt
>>> b/Documentation/devicetree/bindings/usb/dwc3.txt index 020b0e9..8d7317d
>>> 100644
>>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>>> @@ -42,6 +42,10 @@ Optional properties:
>>>    - snps,dis-u2-freeclk-exists-quirk: when set, clear the
>>> u2_freeclk_exists in GUSB2PHYCFG, specify that USB2 PHY doesn't provide
>>>   			a free-running PHY clock.
>>> + - snps,phyif-utmi-quirk: when set core will set phyif UTMI+ interface.
>>> + - snps,phyif-utmi: the value to configure the core to support a UTMI+
>>> PHY +			with an 8- or 16-bit interface. Value 0 select 8-bit
>>> +			interface, value 1 select 16-bit interface.
>> maybe
>> 	snps,phyif-utmi-width =3D <8> or <16>;
> Seems like this could be common. Any other bindings have something
> similar already? If not "utmi-width" is fine.

It seems that there's not any dwc3 binding similar to this.
So I prefer to use =93utmi-width=94. :-)

>
>> devicetree is about describing the hardware, not the things that get wri=
tten
>> to registers :-) . The conversion from the described width to the regist=
er
>> value can easily be done in the driver.
>>
>>
>> Also I don't think you need two properties for this. If the snps,phyif-u=
tmi
>> property is specified it indicates that you want to manually set the wid=
th
>> and if it is absent you want to use the IC default. All functions reading
>> property-values indicate if the property is missing.
> Agreed.
>
> Rob
>
>
>
