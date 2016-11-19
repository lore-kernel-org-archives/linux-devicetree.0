From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH] mtd/spi-nor: Add SPI memory controllers for Aspeed SoCs
Date: Sat, 19 Nov 2016 07:36:29 +0100
Message-ID: <71e9a762-eca2-40be-ba3c-1ab8d1f7ec3b@kaod.org>
References: <1476723427-13243-1-git-send-email-clg@kaod.org>
 <20161018163913.7z337iyc53atp4yd@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20161018163913.7z337iyc53atp4yd@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Milton Miller <miltonm@us.ibm.com>, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, Joel Stanley <joel@jms.id.au>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

Hello Rob,

>> +Example:
>> +
>> +fmc: fmc@1e620000 {
>> +	compatible = "aspeed,ast2400-fmc";
>> +	reg = < 0x1e620000 0x94
>> +		0x20000000 0x02000000
>> +		0x22000000 0x02000000 >;
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +	flash@0 {
>> +		reg = < 0 >;
>> +		compatible = "jedec,spi-nor" ;
>> +		label = "bmc";
> 
> label isn't really a defined property here. Belongs in jedec,spi-nor 
> binding if you want to add it.
> 

I am not sure I understand the suggestion.

Do you mean that we should rename the device node to something 
like "bmc@0" to identify a flash module on the system ?

This is a bit problematic for user space today as we need to sort 
out which flash modules are for the BMC or for the host, each having 
a primary and alternate. So the "label" was a practical way for 
identification.

Thanks,

C.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
