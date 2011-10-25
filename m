From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH V3 1/2] ARM: at91: dt: at91sam9g45 family and board device
	tree files
Date: Tue, 25 Oct 2011 13:06:36 +0200
Message-ID: <4EA6983C.5080303@atmel.com>
References: <4E9F8226.4030503@gmail.com>
	<15ab652499e7f6f8a26724bfd90643a8f3f96ad9.1319464310.git.nicolas.ferre@atmel.com>
	<4EA579E7.7000002@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4EA579E7.7000002@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, plagnioj@jcrosoft.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 10/24/2011 04:44 PM, Rob Herring :
> On 10/24/2011 09:05 AM, Nicolas Ferre wrote:
>> Create a new device tree source file for Atmel at91sam9g45 SoC family.
>> The Evaluation Kit at91sam9m10g45ek includes it.
>> This first basic support will be populated as drivers and boards will be
>> converted to device tree.
>> Contains serial, dma and interrupt controllers.
>>
>> The generic board file still takes advantage of platform data for early serial
>> init. As we need a storage media and the NAND flash driver is not converted to
>> DT yet, we keep old initialization for it.
>>
> 
> This comment is out of date for serial.

Well, not for early serial actually.

>> Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
>> ---
>> V3:
>> - additional clock lookup for device tree handling
>> - devices disabled in dtsi file so that only useful devices are
>>   enabled in dts files
>>
>> V2: foundation for AT91SAM generic support
>> - device tree focused board file
>> - inclusion of USART DT support
>> - early USART and NAND still using platform data
>>
> 
> Reviewed-by: Rob Herring <rob.herring@calxeda.com>

Thanks Rob for your review. I send a pull request to Arnd on this material.

Best regards,
-- 
Nicolas Ferre
