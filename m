From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/2] dt: bindings: add allwinner,otg-routed property for
 phy-sun4i-usb
Date: Wed, 21 Sep 2016 10:30:24 +0300
Message-ID: <43caf5c6-0198-9178-de93-90dc25e8b72b@redhat.com>
References: <20160921070406.27445-1-icenowy@aosc.xyz>
 <4a1ab62a-4091-fd75-d753-fb30585dffa5@redhat.com>
 <6718551474442396@web16h.yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <6718551474442396@web16h.yandex.ru>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>, Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Reinder de Haan <patchesrdh@mveas.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 09/21/2016 10:19 AM, Icenowy Zheng wrote:
>
>
> 21.09.2016, 15:10, "Hans de Goede" <hdegoede@redhat.com>:
>> Hi,
>>
>> On 09/21/2016 10:04 AM, Icenowy Zheng wrote:
>>>  On some newer Allwinner SoCs (H3 or A64), the PHY0 can be either routed to
>>>  the MUSB controller (which is an OTG controller) or the OHCI/EHCI pair
>>>  (which is a Host-only controller, but more stable and easy to implement).
>>>
>>>  This property marks whether on a certain board which controller should be
>>>  attached to the PHY.
>>>
>>>  Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
>>
>> Erm, I think that the idea here is to dynamically switch the routing
>> based on the id-pin of the otg connector. IOW use the musb controller
>> for device mode, and the ehci/ohci proper for proper host support
>> when in host mode.
>
> At least on some boards this implementation works...
>
> (I mean Pine64, which has two USB-A connectors)

Right and I think it is great that you're working on this.

But even with an A connector on the board, we can still use the device
mode (e.g. the SoC's native FEL mode will be used this way).

Notice that you can fake id-pin changes by echoing a mode to:

/sys/devices/platform/soc@01c00000/1c13000.usb/musb-hdrc.1.auto/mode

Valid values to echo are: host, peripheral and otg.

If you combine this with using either an USB A<->A cable, or using
the port normally as a host you should be able to develop and test
full otg support.

Eventually we will need a full otg support rather then your current solution
and I'm afraid that your solution may get in the way of full otg support.

Regards,

Hans
