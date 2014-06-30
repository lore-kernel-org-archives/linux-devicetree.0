From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 1/4] dt: bindings: add bindings for
 Broadcom bcm43xx sdio devices
Date: Mon, 30 Jun 2014 11:09:15 +0200
Message-ID: <53B1293B.7060901@redhat.com>
References: <1404051421-24377-1-git-send-email-hdegoede@redhat.com> <1404051421-24377-2-git-send-email-hdegoede@redhat.com> <53B12059.50808@broadcom.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDRZXY4CYYORBRWSYSOQKGQEZNS7H2I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <53B12059.50808-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 06/30/2014 10:31 AM, Arend van Spriel wrote:
> On 29-06-14 16:16, Hans de Goede wrote:
>> From: Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>
>> The Broadcom bcm43xx sdio devices are fullmac devices that may be
>> integrated in ARM platforms. Currently, the brcmfmac driver for
>> these devices support use of platform data. This patch specifies
>> the bindings that allow this platform data to be expressed in the
>> devicetree.
>>
>> Reviewed-by: Hante Meuleman <meuleman-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Reviewed-by: Franky (Zhenhui) Lin <frankyl-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Reviewed-by: Daniel (Deognyoun) Kim <dekim-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Reviewed-by: Pieter-Paul Giesberts <pieterpg-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Signed-off-by: Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> [hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org: drop clk / reg_on gpio handling, as there is no consensus
>>  on how to handle this yet]
>> [hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org: move from bindings/staging to bindings]
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>  .../bindings/net/wireless/brcm,bcm43xx-fmac.txt    | 41 ++++++++++++++++++++++
>>  1 file changed, 41 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
>>
>> diff --git a/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt b/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
>> new file mode 100644
>> index 0000000..5dbf169
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
>> @@ -0,0 +1,41 @@
>> +Broadcom BCM43xx Fullmac wireless SDIO devices
>> +
>> +This node provides properties for controlling the Broadcom wireless device. The
>> +node is expected to be specified as a child node to the SDIO controller that
>> +connects the device to the system.
>> +
>> +Required properties:
>> +
>> + - compatible : Should be "brcm,bcm4329-fmac".
>> +
>> +Optional properties:
>> + - brcm,drive-strength : drive strength used for SDIO pins on device in mA
>> +	(default = 6).
>> + - interrupt-parent : the phandle for the interrupt controller to which the
>> +	device interrupts are connected.
>> + - interrupts : specifies attributes for the out-of-band interrupt (host-wake).
>> +	When not specified the device will use in-band SDIO interrupts.
>> + - interrupt-names : name of the out-of-band interrupt, which must be set
>> +	to "host-wake".
>> +
>> +Example:
>> +
>> +mmc3: mmc@01c12000 {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&mmc3_pins_a>;
>> +	vmmc-supply = <&reg_vmmc3>;
>> +	bus-width = <4>;
>> +	non-removable;
>> +	status = "okay";
>> +
>> +	brcmf: bcrmf@1 {
>> +		reg = <1>;
> 
> I guess the reg property is needed to have this node linked to sdio func
> 1 dev, right?

Right.

> I would add it to the list of required properties above
> even if this behaviour is already described in a more generic binding.

Then we would also need to describe the need to add:

	#address-cells = <1>;
	#size-cells = <0>;

To the mmc-host node itself, I don't think that that really
belongs here, and thus the description of the reg property itself
also does not really belong here IMHO.

Regards,

Hans
