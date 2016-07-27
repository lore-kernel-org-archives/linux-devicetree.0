From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V1] documentation: da9052: Update regulator bindings
 names to match DA9052/53 DTS expectations
Date: Wed, 27 Jul 2016 09:51:51 -0500
Message-ID: <20160727145151.GA20193@rob-hp-laptop>
References: <20160725152349.A692D3FACB@swsrvapps-01.diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160725152349.A692D3FACB@swsrvapps-01.diasemi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Steve Twiss <stwiss.opensource@diasemi.com>
Cc: DEVICETREE <devicetree@vger.kernel.org>, DTKERNEL <dt@kernel.org>, LINUXKERNEL <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Support Opensource <support.opensource@diasemi.com>, Ying-Chun Liu <paul.liu@linaro.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 25, 2016 at 04:20:54PM +0100, Steve Twiss wrote:
> From: Steve Twiss <stwiss.opensource@diasemi.com>
> 
> Hi Mark,

Drop this from the commit msg.

> 
> Buck and LDO binding name changes.
> 
> The binding names for the regulators have been changed to match the current
> expectation from existing device tree source files.
> 
> This fix rectifies the disparity between what currently exists in some
> .dts[i] board files and what is listed in this binding document. This
> change re-aligns those differences and also brings the binding document
> in-line with the expectations of the product datasheet from Dialog
> Semiconductor.
> 
> Bucks and LDOs now follow the expected notation:
> { buck1, buck2, buck3, buck4 }
> { ldo1, ldo2, ldo3, ldo4, ldo5, ldo6, ldo7, ldo8, ldo9, ldo10 }
> 
> Signed-off-by: Steve Twiss <stwiss.opensource@diasemi.com>
> 
> ---
> This patch applies against linux-next and v4.7
> 
> Hi,
> 
> Several device tree source files use a regulator naming scheme different to
> that found in the binding text document. Since those have been used
> already, I would like ensure to the binding document follows those existing
> DT file naming conventions.
> 
> Please refer to the files containing da9052/53 references:
>  - ./arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi
>  - ./arch/arm/boot/dts/imx53-qsb.dts
> 
> Those board files use the naming convention:
>  { buck1, buck2, buck3, buck4 }
>  { ldo1, ldo2, ldo3, ldo4, ldo5, ldo6, ldo7, ldo8, ldo9, ldo10 }
> 
> Instead of the existing suggestion in the device tree binding file:
>  { buck0, buck1, buck2, buck3 }
>  { ldo4, ldo5, ldo6, ldo7, ldo8, ldo9, ldo10, ldo11, ldo12, ldo13 }
> 
> The binding file regulator names (as it stands) does not reflect any
> real-world uses I can find. This change would bring it in-line with
> currect expectations from existing DTS files and make it similar enough to
> the product datasheets to be "less confusing" than it currently is.
> 
> Regards,
> Steve
>  
> See reference:
> https://lkml.org/lkml/2016/7/25/197
> 
> 
>  .../devicetree/bindings/mfd/da9052-i2c.txt         | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)

Otherwise,

Acked-by: Rob Herring <robh@kernel.org>
