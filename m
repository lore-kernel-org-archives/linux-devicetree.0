From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v7 8/9] phy: add Broadcom Kona USB2 PHY driver
Date: Thu, 19 Dec 2013 11:19:35 +0530
Message-ID: <52B288EF.1040006@ti.com>
References: <1387309356-17195-1-git-send-email-mporter@linaro.org>
 <1387309356-17195-9-git-send-email-mporter@linaro.org>
 <20131218162554.GF4970@saruman.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20131218162554.GF4970@saruman.home>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: balbi@ti.com, Matt Porter <mporter@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Kamil Debski <k.debski@samsung.com>, Linux USB List <linux-usb@vger.kernel.org>, Dinh Nguyen <dinh.linux@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tomasz Figa <t.figa@samsung.com>, Christian Daudt <bcm@fixthebug.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Kyungmin Park <kyungmin.park@samsung.com>, Linaro Patches <patches@linaro.org>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Paul Zimmerman <paulz@synopsys.com>, Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Felipe,

On Wednesday 18 December 2013 09:55 PM, Felipe Balbi wrote:
> On Tue, Dec 17, 2013 at 02:42:35PM -0500, Matt Porter wrote:
>> Add a driver for the internal Broadcom Kona USB 2.0 PHY found
>> on the BCM281xx family of SoCs.
>>
>> Signed-off-by: Matt Porter <mporter@linaro.org>
> 
> Kishon, are you ok with this driver ?

yeah. Since this patch touches phy/Kconfig (and Makefile) and there is one more
PHY driver to be merged that also modifies Kconfig there might be conflicts. So
thought I should be taking this patch?
> 
>> +static int bcm_kona_usb2_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct bcm_kona_usb *phy;
>> +	struct resource *res;
>> +	struct phy *gphy;
>> +	struct phy_provider *phy_provider;
>> +
>> +	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
>> +	if (!phy)
>> +		return -ENOMEM;
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	phy->regs = devm_ioremap_resource(&pdev->dev, res);
>> +	if (IS_ERR(phy->regs))
>> +		return PTR_ERR(phy->regs);
>> +
>> +	platform_set_drvdata(pdev, phy);
>> +
>> +	phy_provider = devm_of_phy_provider_register(dev,
>> +			of_phy_simple_xlate);
>> +	if (IS_ERR(phy_provider))
>> +		return PTR_ERR(phy_provider);
>> +
>> +	gphy = devm_phy_create(dev, &ops, NULL);
>> +	if (IS_ERR(gphy))
>> +		return PTR_ERR(gphy);
>> +
>> +	/* The Kona PHY supports an 8-bit wide UTMI interface */
>> +	phy_set_bus_width(gphy, 8);
>> +
>> +	phy_set_drvdata(gphy, phy);
> 
> I think this set_drvdata() should be done before registering the
> provider, no ?

hmm, right.

Thanks
Kishon
