From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v2 04/19] ARM: dts: imx6-sabrelite: add OV5642 and OV5640
 camera sensors
Date: Thu, 5 Jan 2017 11:20:57 -0800
Message-ID: <d9f31e15-39b7-3c31-e45f-b19c0dd1e791@gmail.com>
References: <1483477049-19056-1-git-send-email-steve_longerbeam@mentor.com>
 <1483477049-19056-5-git-send-email-steve_longerbeam@mentor.com>
 <0a343705-1d38-9fe2-6419-56ab9bdfb0c2@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <0a343705-1d38-9fe2-6419-56ab9bdfb0c2@mentor.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, mchehab@kernel.org, gregkh@linuxfoundation.org, p.zabel@pengutronix.de
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Steve Longerbeam <steve_longerbeam@mentor.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Vladimir,


On 01/04/2017 04:25 AM, Vladimir Zapolskiy wrote:
> Hi Steve,
>
> On 01/03/2017 10:57 PM, Steve Longerbeam wrote:
>> Enables the OV5642 parallel-bus sensor, and the OV5640 MIPI CSI-2 sensor.
>> Both hang off the same i2c2 bus, so they require different (and non-
>> default) i2c slave addresses.
>>
>> The OV5642 connects to the parallel-bus mux input port on ipu1_csi0_mux.
>>
>> The OV5640 connects to the input port on the MIPI CSI-2 receiver on
>> mipi_csi. It is set to transmit over MIPI virtual channel 1.
>>
>> Note there is a pin conflict with GPIO6. This pin functions as a power
>> input pin to the OV5642, but ENET uses it as the h/w workaround for
>> erratum ERR006687, to wake-up the ARM cores on normal RX and TX packet
>> done events (see 6261c4c8). So workaround 6261c4c8 is reverted here to
>> support the OV5642, and the "fsl,err006687-workaround-present" boolean
>> also must be removed. The result is that the CPUidle driver will no longer
>> allow entering the deep idle states on the sabrelite.
> For me it sounds like a candidate of its own separate change.

Yes, I split out the two partial reverts into a separate commit
("ARM: dts: imx6qdl-sabrelite: remove erratum ERR006687
  workaround").

>
>
>
>> +
>> +	mipi_camera: ov5640@40 {
> Please reorder device nodes by address value,

done.

>   also according to ePAPR
> node names should be generic, labels can be specific:
>
> 	ov5640: camera@40 {
> 		...
> 	};
>
> 	ov5642: camera@42 {
> 		...
> 	};

fixed.

>
>> +		pinctrl_ipu1_csi0: ipu1grp-csi0 {
> Please rename node name to ipu1csi0grp.

done.

>
>> +
>> +                pinctrl_ov5640: ov5640grp {
>> +                        fsl,pins = <
>> +				MX6QDL_PAD_NANDF_D5__GPIO2_IO05 0x000b0
>> +				MX6QDL_PAD_NANDF_WP_B__GPIO6_IO09 0x0b0b0
>> +                        >;
>> +                };
>> +
> Indentation issues above, please use tabs instead of spaces.

fixed.

>
> Also please add new pin control groups preserving the alphanimerical order.

done.

Steve
