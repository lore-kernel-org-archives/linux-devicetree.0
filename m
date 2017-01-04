From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 3/3] ARM: dts: imx: Add ocotp node for imx6ul
Date: Wed, 4 Jan 2017 14:06:47 +0000
Message-ID: <8badaf4a-01c9-95e0-ada1-41e7a81fe35e@linaro.org>
References: <1479344899-3141-1-git-send-email-ping.bai@nxp.com>
 <1479344899-3141-3-git-send-email-ping.bai@nxp.com>
 <20161230022527.GH6177@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161230022527.GH6177@dragon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>, Bai Ping <ping.bai@nxp.com>
Cc: mark.rutland@arm.com, robh@kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, maxime.ripard@free-electrons.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 30/12/16 02:25, Shawn Guo wrote:
> On Thu, Nov 17, 2016 at 09:08:19AM +0800, Bai Ping wrote:
>> Add ocotp node for i.MX6UL SOC.
>>
>> Signed-off-by: Bai Ping <ping.bai@nxp.com>
>
> The DTS change looks good to me.  But I cannot apply it until the driver
> and bindings part get accepted.  You should figure out who is collecting
> nvmem patches.  It seems to be Greg Kroah-Hartman, who is not on copy.
Sorry for delay in response,

I will take care of the 1/3 and 2/3 nvmem patches.

Thanks,
srini

>


> Shawn
>
>> ---
>>  arch/arm/boot/dts/imx6ul.dtsi | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
>> index c5c05fd..c6f6613 100644
>> --- a/arch/arm/boot/dts/imx6ul.dtsi
>> +++ b/arch/arm/boot/dts/imx6ul.dtsi
>> @@ -849,6 +849,12 @@
>>  				reg = <0x021b0000 0x4000>;
>>  			};
>>
>> +			ocotp: ocotp-ctrl@021bc000 {
>> +				compatible = "fsl,imx6ul-ocotp", "syscon";
>> +				reg = <0x021bc000 0x4000>;
>> +				clocks = <&clks IMX6UL_CLK_OCOTP>;
>> +			};
>> +
>>  			lcdif: lcdif@021c8000 {
>>  				compatible = "fsl,imx6ul-lcdif", "fsl,imx28-lcdif";
>>  				reg = <0x021c8000 0x4000>;
>> --
>> 1.9.1
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
