From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 1/3] Bluetooth: btusb: add QCA6174A compatible
 properties
Date: Tue, 26 Feb 2019 13:31:45 +0000
Message-ID: <a23b9467-1c41-e399-f011-8ca183be585d@arm.com>
References: <20190222225345.69084-1-briannorris@chromium.org>
 <49653AC5-5800-4319-B3C0-0CCA6A920E2C@holtmann.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <49653AC5-5800-4319-B3C0-0CCA6A920E2C@holtmann.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Holtmann <marcel@holtmann.org>, Brian Norris <briannorris@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Johan Hedberg <johan.hedberg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Douglas Anderson <dianders@chromium.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-rockchip@lists.infradead.org, "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Rajat Jain <rajatja@google.com>
List-Id: devicetree@vger.kernel.org

On 26/02/2019 09:01, Marcel Holtmann wrote:
> Hi Brian,
> 
>> We may need to specify a GPIO wake pin for this device, so add a
>> compatible property for it.
>>
>> There are at least to USB PID/VID variations of this chip: one with a
>> Lite-On ID and one with an Atheros ID.
>>
>> Signed-off-by: Brian Norris <briannorris@chromium.org>
>> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>> ---
>> v2:
>> * drop leading zeroes from VID, per documented binding
>> ---
>> drivers/bluetooth/btusb.c | 2 ++
>> 1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
>> index 470ee68555d9..54cb5f583b1d 100644
>> --- a/drivers/bluetooth/btusb.c
>> +++ b/drivers/bluetooth/btusb.c
>> @@ -2862,6 +2862,8 @@ static irqreturn_t btusb_oob_wake_handler(int irq, void *priv)
>>
>> static const struct of_device_id btusb_match_table[] = {
>> 	{ .compatible = "usb1286,204e" },
>> +	{ .compatible = "usbcf3,e300" }, /* QCA6174A */
>> +	{ .compatible = "usb4ca,301a" }, /* QCA6174A (Lite-On) */
> 
> are these really proper .compatible USB VID?PID strings. I think they are one letter short.

Yup - however weird it may end up looking, the usb-device binding says 
"...with leading zeros suppressed". Blame Open Firmware, I guess ;)

Robin.
