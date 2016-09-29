From: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
Subject: Re: [PATCH v3 1/3] Documentation: dt: net: add mt76 wireless device
 binding
Date: Thu, 29 Sep 2016 20:31:30 +0200
Message-ID: <e7d435b2-6b59-45af-07eb-b10789d61a9c@nbd.name>
References: <20160905095128.80560-1-nbd@nbd.name>
 <20160905095128.80560-2-nbd@nbd.name>
 <87eg4uu0f3.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87eg4uu0f3.fsf-HodKDYzPHsUD5k0oWYwrnHL1okKdlPRT@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016-09-08 12:54, Kalle Valo wrote:
> Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org> writes:
> 
>> Signed-off-by: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
>> ---
>>  .../bindings/net/wireless/mediatek,mt76.txt        | 26 ++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt
>>
>> diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt
>> new file mode 100644
>> index 0000000..d51c35f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt
>> @@ -0,0 +1,26 @@
>> +* MediaTek mt76xx devices
>> +
>> +This node provides properties for configuring the MediaTek mt76xx wireless
>> +device. The node is expected to be specified as a child node of the PCI
>> +controller to which the wireless chip is connected.
>> +
>> +Optional properties:
>> +
>> +- mac-address: See ethernet.txt in the parent directory
>> +- local-mac-address: See ethernet.txt in the parent directory
>> +- mediatek,2ghz: Override the 2.4 GHz band capability from EEPROM
>> +- mediatek,5ghz: Override the 5 GHz band capability from EEPROM
>> +- mediatek,mtd-eeprom: Specify a MTD partition + offset containing EEPROM data
>> +
>> +&pcie {
>> +	status = "okay";
>> +
>> +	pcie0 {
>> +		mt76@0,0 {
>> +			reg = <0x0000 0 0 0 0>;
>> +			device_type = "pci";
>> +			mediatek,mtd-eeprom = <&factory 0x8000>;
>> +			mediatek,2ghz = <0>;
>> +		};
>> +	};
>> +};
> 
> I need an ack from device tree maintainers, CCing the devicetree list.
> Do we need to resend or this ok?
> 
> Patchwork link:
> 
> https://patchwork.kernel.org/patch/9313309/
Ping?

- Felix

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
