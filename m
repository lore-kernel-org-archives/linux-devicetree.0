From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 4/5] gpio: of: Add support to have multiple gpios in gpio-hog
Date: Wed, 9 Mar 2016 18:50:53 +0530
Message-ID: <56E02335.6020901@nvidia.com>
References: <1457438528-29054-1-git-send-email-ldewangan@nvidia.com> <1457438528-29054-5-git-send-email-ldewangan@nvidia.com> <20160309062849.GB10454@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160309062849.GB10454@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, treding@nvidia.com, swarren@wwwdotorg.org, Benoit Parrot <bparrot@ti.com>, Alexandre Courbot <acourbot@nvidia.com>
List-Id: devicetree@vger.kernel.org


On Wednesday 09 March 2016 11:58 AM, Markus Pargmann wrote:
> * PGP Signed by an unknown key
>
> Hi,
>
> On Tue, Mar 08, 2016 at 05:32:07PM +0530, Laxman Dewangan wrote:
>> The child node for gpio hogs under gpio controller's node
>> provide the mechanism to automatic GPIO request and
>> configuration as part of the gpio-controller's driver
>> probe function.
>>
>> Currently, property "gpio" takes one gpios for such
>> configuration. Add support to have multiple GPIOs in
>> this property so that multiple GPIOs of gpio-controller
>> can be configured by this mechanism with one child node.
> So if I read this correctly you want to have multiple GPIOs with the
> same line name? Why don't you use multiple child nodes with individual
> line names?
>
There is cases on which particular functional configuration needs sets 
of GPIO to set. On this case, making sub node for each GPIOs creates 
lots of sub-nodes and  add complexity on readability, usability and 
maintainability.
Example: for my board, I wanted to set GPIO H2 to input and H0 and H1 to 
be output high.
Instead of three nodes, I can have two here:
        gpio@0,6000d000 {
                wlan_input {
                        gpio-hog;
                        gpios = <TEGRA_GPIO(H, 2) 0>;
                        input;
                };

                wlan_output {
                        gpio-hog;
                        gpios = <TEGRA_GPIO(H, 0) 0 TEGRA_GPIO(H, 1) 0>;
                        output-high;
                };
        };

So here I am grouping the multiple output GPIO together.

This looks much similar if we have many GPIOs for one type of 
configurations.

Even it looks better if we have something:
        gpio@0,6000d000 {
                wlan_control {
                        gpio-hog;
                        gpios-input = <TEGRA_GPIO(H, 2) 0>;
                        gpios-output-high = <TEGRA_GPIO(H, 0) 0 
TEGRA_GPIO(H, 1) 0>;
                };
        };

