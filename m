From: Claudiu Manoil <claudiu.manoil@nxp.com>
Subject: RE: [PATCH net-next 2/3] arm64: dts: fsl: ls1028a-rdb: Add ENETC
 external eth ports for the LS1028A RDB board
Date: Thu, 14 Feb 2019 15:33:12 +0000
Message-ID: <VI1PR04MB4880C9EF6C9EBFCAA2209DD596670@VI1PR04MB4880.eurprd04.prod.outlook.com>
References: <1550055743-15542-1-git-send-email-claudiu.manoil@nxp.com>
 <1550055743-15542-3-git-send-email-claudiu.manoil@nxp.com>
 <20190213181554.GB708@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190213181554.GB708@lunn.ch>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Alexandru Marginean <alexandru.marginean@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "David S .
 Miller" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

>-----Original Message-----
>From: Andrew Lunn <andrew@lunn.ch>
>Sent: Wednesday, February 13, 2019 8:16 PM
>To: Claudiu Manoil <claudiu.manoil@nxp.com>
>Cc: Shawn Guo <shawnguo@kernel.org>; Leo Li <leoyang.li@nxp.com>; David S .
>Miller <davem@davemloft.net>; devicetree@vger.kernel.org; Alexandru
>Marginean <alexandru.marginean@nxp.com>; linux-kernel@vger.kernel.org;
>linux-arm-kernel@lists.infradead.org; netdev@vger.kernel.org
>Subject: Re: [PATCH net-next 2/3] arm64: dts: fsl: ls1028a-rdb: Add ENETC
>external eth ports for the LS1028A RDB board
>
>On Wed, Feb 13, 2019 at 01:02:22PM +0200, Claudiu Manoil wrote:
>> The LS1028A RDB board features an Atheros PHY connected over SGMII to
>> the ENETC PF0 (or Port0).  ENETC Port1 (PF1) has no external
>> connection on this board, so it can be disabled for now.
>>
>> Signed-off-by: Alex Marginean <alexandru.marginean@nxp.com>
>> Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>
>> ---
>>  arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts | 15
>> +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
>> b/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
>> index fdeb417..c8487893 100644
>> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
>> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
>> @@ -71,3 +71,18 @@
>>  &duart1 {
>>  	status = "okay";
>>  };
>> +
>> +&enetc_port0 {
>> +	phy-handle = <&sgmii_phy0>;
>> +	phy-connection-type = "sgmii";
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	sgmii_phy0: ethernet-phy@2 {
>> +		reg = <0x2>;
>> +	};
>> +};
>> +
>
>Hi Claudiu
>
>It is better to use:
>
>&enetc_port0 {
>	phy-handle = <&sgmii_phy0>;
>	phy-connection-type = "sgmii";
>	#address-cells = <1>;
>	#size-cells = <0>;
>
>	mdio {
>		sgmii_phy0: ethernet-phy@2 {
>			reg = <0x2>;
>		};
>	};
>};

Hi Andrew,

The extra node for mdio seems to complicate things somewhat. 
Just adding this node seems not enough.  How to find out easily if a child 
of a enetc port node is a mdio node? I was thinking to use device_type
for that, like this:

&enetc_port0 {
	phy-handle = <&sgmii_phy0>;
	phy-connection-type = "sgmii";
	mdio {
		#address-cells = <1>;
		#size-cells = <0>;
		device_type = "mdio";
		sgmii_phy0: ethernet-phy@2 {
			reg = <0x2>;
		};
	};
};

Would you agree with this?

Thanks,
Claudiu
