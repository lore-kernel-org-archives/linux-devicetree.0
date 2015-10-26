From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v4 4/5] regulator: tps65912: Add regulator driver for the
 TPS65912 PMIC
Date: Mon, 26 Oct 2015 10:47:41 -0500
Message-ID: <562E4B1D.4060205@ti.com>
References: <1443731874-21362-1-git-send-email-afd@ti.com>
 <1443731874-21362-5-git-send-email-afd@ti.com>
 <20151022164724.GZ8232@sirena.org.uk> <562A2C2F.1020808@ti.com>
 <20151023231822.GQ29919@sirena.org.uk> <562ACCCC.503@ti.com>
 <20151024221457.GS29919@sirena.org.uk> <562D3F77.5040205@ti.com>
 <20151026004320.GU29919@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151026004320.GU29919@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/25/2015 07:43 PM, Mark Brown wrote:
> On Sun, Oct 25, 2015 at 03:45:43PM -0500, Andrew F. Davis wrote:
>> On 10/24/2015 05:14 PM, Mark Brown wrote:
>
>>> Tbe binding document is buggy and doesn't reflect the code, there's no
>>> compatible string in the driver.
>
>> Sure there is:
>
>> drivers/mfd/mt6397-core.c:48:
>> .of_compatible = "mediatek,mt6397-regulator",
>
> This is in the MFD, this is not used in actual systems.
>

Not sure what you mean by "actual systems", it looks like these
use it?:

arch/arm/boot/dts/mt8135-evbp1.dts
arch/arm64/boot/dts/mediatek/mt8173-evb.dts

>> Then mfd_add_devices uses this to find the regulator node and fill
>> in .of_node, then in the regulator driver:
>
>> drivers/regulator/mt6397-regulator.c:48:
>> .of_match = of_match_ptr(match),
>
>> which uses your helper to match the nodes in the filled in .of_node.
>
> This is in a regulator definition, it is using the regulator framework
> support for parsing DT which must be used by modern drivers.  It is not
> part of how the Linux driver model device is instantiated, that is done
> using the struct platform_driver which is what we are talking about
> here.
>

I understand this, I thought we are talking about compatible strings in
the regulator sub-node, not how the core instantiates the sub-driver.

> Please stop this, it is getting very tiresome.
>

Sorry about that, I'm really not trying to prolong this, but I don't know
what you want. New multifunction devices have compatible strings in their
DT sub-nodes, the framework even helps support this (.of_compatible in
struct mfd_cell), I'm not doing anything new here.
