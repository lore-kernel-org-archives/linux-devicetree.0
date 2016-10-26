From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH RESEND 1/2] dt: bindings: add
 allwinner,otg-routed property for phy-sun4i-usb
Date: Wed, 26 Oct 2016 12:14:02 +0200
Message-ID: <86c3fad4-e0c1-9aaf-76c5-b9428110464f@redhat.com>
References: <20161025041139.46454-1-icenowy@aosc.xyz>
 <55fe59fc-6e93-d519-2d7c-264c48820fc4@redhat.com>
 <4534561477471963@web8g.yandex.ru>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORB5EDYLAAKGQE5WPG2GQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <4534561477471963-MkNZHmQ5vhFuio3avFS2gg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 26-10-16 10:52, Icenowy Zheng wrote:
>
>
> 26.10.2016, 16:28, "Hans de Goede" <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>:
>> Hi,
>>
>> On 25-10-16 06:11, Icenowy Zheng wrote:
>>>  On some newer Allwinner SoCs (H3 or A64), the PHY0 can be either routed to
>>>  the MUSB controller (which is an OTG controller) or the OHCI/EHCI pair
>>>  (which is a Host-only controller, but more stable and easy to implement).
>>>
>>>  This property marks whether on a certain board which controller should be
>>>  attached to the PHY.
>>>
>>>  Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>>
>> Icenowy, I appreciate your work on this, but we really need full otg
>> support with dynamic switching rather then hardwiring the routing, so
>> this cannot go in as is.
>
> Now I have both PHY0 controllers' drivers.
>
> In the tree of https://github.com/Icenowy/linux/tree/ice-a64-v6.1 , I have already
> enabled MUSB controller.
>
> And this patchset is for those prefer a stable USB host implement to dual-role
> implementation. MUSB is a good UDC, but not a good host controller. My USB
> sound card cannot work on MUSB on A33. Even connecting a R8's MUSB (Serial
> Gadget) to an A33's MUSB cannot work.

The idea is for dual-role setups to used the MUSB in gadget mode and the EHCI/OHCI
pair when in host mode. So for otg setups you would runtime change the mux
from one controller to the other based on the id pin value.

Take a look at drivers/phy/phy-sun4i-usb.c, around line 512:

	if (id_det != data->id_det) {
		...
	}

This deals with id_det changes (including the initial id_det "change"
for hardwired host-only ports). This currently assumes that the musb
will be used for host mode too, we will want to change this to
something like this:

	if (id_det != data->id_det) {
		if (data->cfg->separate_phy0_host_controller) {
			if (id_det) {
				/* Change to gadget mode (id_det == 1), switch phy mux to musb */
				actual code to switch phy mux to musb...
			} else {
				/* Change to host mode (id_det == 0), switch phy mux to ehci/ohci */
				actual code to switch phy mux to ehci/ohci...
			}
		}
		/* old code */
	}

Note this will then still rely on the musb code to actually turn
the regulator on, so you do need to have the musb driver build and
loaded. This can be fixed but lets start with the above.

If you combine this with dr_mode = "host"; in the dts, then
sun4i_usb_phy0_get_id_det() will return 0 so on its first run
sun4i_usb_phy0_id_vbus_det_scan() will throw the mux to the ehci/ohci
and everything should work as you want without needing the custom
"allwinner,otg-routed" property, and we should be more or less
ready to support full otg on other boards.

Regards,

Hans





>
> See the IRC log between Andre and me,
> https://irclog.whitequark.org/linux-sunxi/2016-10-24#18012695; .
>
>>
>> NACK.
>>
>> Regards,
>>
>> Hans
>>
>>>  ---
>>>   Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>>  diff --git a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
>>>  index 287150d..a63c766 100644
>>>  --- a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
>>>  +++ b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
>>>  @@ -36,6 +36,12 @@ Optional properties:
>>>   - usb1_vbus-supply : regulator phandle for controller usb1 vbus
>>>   - usb2_vbus-supply : regulator phandle for controller usb2 vbus
>>>
>>>  +Optional properties for H3 or A64 SoCs:
>>>  +- allwinner,otg-routed : USB0 (OTG) PHY is routed to OHCI/EHCI pair rather than
>>>  + MUSB. (boolean, if this property is set, the OHCI/EHCI
>>>  + controllers at PHY0 should be enabled and the MUSB
>>>  + controller must *NOT* be enabled)
>>>  +
>>>   Example:
>>>           usbphy: phy@0x01c13400 {
>>>                   #phy-cells = <1>;
