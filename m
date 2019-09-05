From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH] ARM: dts: aspeed-g4: Add all flash chips
Date: Thu, 5 Sep 2019 08:45:06 +0200
Message-ID: <6348d0f1-6e2e-cae6-7f76-996825de0527@kaod.org>
References: <20190905000221.31445-1-joel@jms.id.au>
 <d9805fa2-db79-457b-a166-7c84e1608128@www.fastmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <d9805fa2-db79-457b-a166-7c84e1608128@www.fastmail.com>
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
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 05/09/2019 02:33, Andrew Jeffery wrote:
> 
> 
> On Thu, 5 Sep 2019, at 09:32, Joel Stanley wrote:
>> The FMC supports five chip selects, so describe the five possible flash
>> chips.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>>  arch/arm/boot/dts/aspeed-g4.dtsi | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
>> index e465cda40fe7..dffb595d30e4 100644
>> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
>> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
>> @@ -67,6 +67,26 @@
>>  				compatible = "jedec,spi-nor";
>>  				status = "disabled";
>>  			};
>> +			flash@1 {
>> +				reg = < 1 >;
>> +				compatible = "jedec,spi-nor";
>> +				status = "disabled";
>> +			};
>> +			flash@2 {
>> +				reg = < 2 >;
>> +				compatible = "jedec,spi-nor";
>> +				status = "disabled";
>> +			};
>> +			flash@3 {
>> +				reg = < 3 >;
>> +				compatible = "jedec,spi-nor";
>> +				status = "disabled";
>> +			};
>> +			flash@4 {
>> +				reg = < 4 >;
>> +				compatible = "jedec,spi-nor";
>> +				status = "disabled";
>> +			};
> 
> The FMC supports parallel NOR and NAND interfaces too, but so far no-one has
> cared for these options, so if they ever do we'll fix it then.

New Aspeed SoCs only have SPI support. So I don't think the other interfaces
were ever used.

C. 
 
> 
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> 
