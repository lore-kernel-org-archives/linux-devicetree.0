From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2 8/9] ARM: mvebu: Add pinctrl support to Armada 370
 SoC
Date: Wed, 22 Aug 2012 14:46:19 -0600
Message-ID: <5035451B.3020708@wwwdotorg.org>
References: <1344689809-6223-1-git-send-email-sebastian.hesselbarth@gmail.com> <1345623750-10645-1-git-send-email-sebastian.hesselbarth@gmail.com> <1345623750-10645-9-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1345623750-10645-9-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Linus Walleij <linus.walleij@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 08/22/2012 02:22 AM, Sebastian Hesselbarth wrote:
> This commits adds the necessary device tree information to define the
> compatible property for the pinctrl driver instance of Armada 370 SoC.

> diff --git a/arch/arm/boot/dts/armada-370.dtsi b/arch/arm/boot/dts/armada-370.dtsi

> +
> +                pinctrl@d0018000 {
> +			        compatible = "marvell,mv88f6710-pinctrl";
> +	        };

The indentation here is a mix of spaces and TABs.
