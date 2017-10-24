From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: Re: [PATCH 2/3] drivers: phy: broadcom: Add driver for Cygnus USB phy
 controller
Date: Tue, 24 Oct 2017 07:46:53 +0200
Message-ID: <e1b26a08cc999ddfabd0e1fedd5d772d@milecki.pl>
References: <1508819822-29956-1-git-send-email-raveendra.padasalagi@broadcom.com>
 <1508819822-29956-3-git-send-email-raveendra.padasalagi@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1508819822-29956-3-git-send-email-raveendra.padasalagi@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Ray Jui <rjui@broadcom.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Russell King <linux@armlinux.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Jaehoon Chung <jh80.chung@samsung.com>, Rob Herring <robh+dt@kernel.org>, Srinath Mannam <srinath.mannam@broadcom.com>, Viresh Kumar <viresh.kumar@linaro.org>, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, Raviteja Garimella <raviteja.garimella@broadcom.com>
List-Id: devicetree@vger.kernel.org

On 2017-10-24 06:37, Raveendra Padasalagi wrote:
> Add driver for Broadcom's USB phy controller's used in Cygnus
> familyof SoC. Cygnus has three USB phy controller's, port 0,
> port 1 provides USB host functionality and port 2 can be configured
> for host/device role.
> 
> Configuration of host/device role for port 2 is achieved based on
> the extcon events, the driver registers to extcon framework to get
> appropriate connect events for Host/Device cables connect/disconnect
> states based on VBUS and ID interrupts.

Minor issues commented inline.


> +#define USB2_IDM_IDM_IO_CONTROL_DIRECT_OFFSET		0x0408
> +#define USB2_IDM_IDM_IO_CONTROL_DIRECT_CLK_ENABLE	BIT(0)

Here you define reg bits using BIT(n).


> +#define SUSPEND_OVERRIDE_0				13
> +#define SUSPEND_OVERRIDE_1				14
> +#define SUSPEND_OVERRIDE_2				15
> +#define USB2_IDM_IDM_RESET_CONTROL_OFFSET		0x0800
> +#define USB2_IDM_IDM_RESET_CONTROL__RESET		0

And here without BIT(n). Either is fine but it may be better to be
consistent about it.


> +static int cygnus_phy_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	struct cygnus_phy_driver *phy_driver;
> +	struct phy_provider *phy_provider;
> +	int i, ret;
> +	u32 reg_val;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->of_node;
> +
> +	/* allocate memory for each phy instance */
> +	phy_driver = devm_kzalloc(dev, sizeof(struct cygnus_phy_driver),
> +				  GFP_KERNEL);
> +	if (!phy_driver)
> +		return -ENOMEM;
> +
> +	phy_driver->num_phys = of_get_child_count(node);
> +
> +	if (phy_driver->num_phys == 0) {
> +		dev_err(dev, "PHY no child node\n");
> +		return -ENODEV;
> +	}
> +
> +	phy_driver->instances = devm_kcalloc(dev, phy_driver->num_phys,
> +					     sizeof(struct cygnus_phy_instance),
> +					     GFP_KERNEL);

I don't think kcalloc is safe here. E.g. In cygnus_phy_shutdown you
iterate over all instances reading the .power value. If
cygnus_phy_shutdown gets called before having each instance powered up,
you'll read random memory as .power value.
