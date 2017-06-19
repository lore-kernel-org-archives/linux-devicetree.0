From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH v5 1/3] nvmem: dt: document SNVS LPGPR binding
Date: Mon, 19 Jun 2017 12:58:51 +0200
Message-ID: <b8d7d65c-93c8-8b62-abb4-09d60c32bf84@i2se.com>
References: <20170609125730.25502-1-o.rempel@pengutronix.de>
 <20170609125730.25502-2-o.rempel@pengutronix.de>
 <8e50ff3d-d1f0-2795-5dc9-302979ca9694@i2se.com>
 <20170619060629.du3qmihhkkyym44h@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170619060629.du3qmihhkkyym44h-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Content-Language: de-DE
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oleksij Rempel <ore-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

Am 19.06.2017 um 08:06 schrieb Oleksij Rempel:
> On Fri, Jun 09, 2017 at 04:59:00PM +0200, Stefan Wahren wrote:
> Hi Stefan,
>
>> Hi Oleksij,
>>
>> Am 09.06.2017 um 14:57 schrieb Oleksij Rempel:
>>> Documentation bindings for the Low Power General Purpose Register
>>> available on i.MX6 SoCs in the Secure Non-Volatile Storage.
>>>
>>> Signed-off-by: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>> ---
>>>  .../devicetree/bindings/nvmem/snvs-lpgpr.txt          | 19 +++++++++++++++++++
>>>  1 file changed, 19 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt b/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt
>>> new file mode 100644
>>> index 000000000000..21910fb3159f
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt
>>> @@ -0,0 +1,19 @@
>>> +Device tree bindings for Low Power General Purpose Register found in i.MX6Q/D
>>> +Secure Non-Volatile Storage.
>>> +
>>> +This DT node should be represented as a sub-node of a "syscon",
>>> +"simple-mfd" node.
>>> +
>>> +Required properties:
>>> +- compatible: should be:
>>> +	"fsl,imx6q-snvs-lpgpr" for Freescale i.MX6Q/D/DL/S
>>> +
>>> +Example:
>>> +snvs: snvs@020cc000 {
>>> +	compatible = "fsl,sec-v4.0-mon", "syscon", "simple-mfd";
>>> +	reg = <0x020cc000 0x4000>;
>>> +
>>> +	snvs_lpgpr: snvs-lpgpr {
>>> +		compatible = "fsl,imx6q-snvs-lpgpr";
>> according to the reference manual at least the clock "lp_ipg_clk_s" is
>> required for register R/W access.
>> So it should be added to the binding and enabled by the driver.
> Hm...
> Non of current SNVS drives use, set or defines *_ipg_clk_s. I can't find
> in the docs how can I control this clocks.
> lp_ipg_clk_s and hp_ipg_clk_s depend on ipg_clk_root, which seems to be
> not gated. So, it is always on. Or do I miss something.
>
do you know how the clock "lp_ipg_clk_s" should be handled?

Thanks
Stefan

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
