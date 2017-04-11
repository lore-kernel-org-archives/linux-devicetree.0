From: Oleksij Rempel <ore-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v1 3/3] nvmem: dt: document SNVS LPGPR binding
Date: Tue, 11 Apr 2017 06:36:14 +0200
Message-ID: <1e0f8a71-9dca-7aaa-a603-86ed3934da4d@pengutronix.de>
References: <20170406073107.32445-1-o.rempel@pengutronix.de>
 <20170406073107.32445-3-o.rempel@pengutronix.de>
 <20170410182235.pmobyxn6kvyvcwsj@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170410182235.pmobyxn6kvyvcwsj@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 04/10/2017 08:22 PM, Rob Herring wrote:
> On Thu, Apr 06, 2017 at 09:31:07AM +0200, Oleksij Rempel wrote:
>> Documenation bindings for the Low Power General Purpose Registe
>
> s/Registe/Register/
>
>> available on i.MX6 SoCs in the Secure Non-Volatile Storage.
>>
>> Signed-off-by: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> ---
>>  Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt
>>
>> diff --git a/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt b/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt
>> new file mode 100644
>> index 000000000000..9a8be1a2d12e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt
>> @@ -0,0 +1,15 @@
>> +Device tree bindings for Low Power General Purpose Registe found in i.MX6Q/D
>> +Secure Non-Volatile Storage.
>> +
>> +Required properties:
>> +- compatible: should be one of
>> +	"fsl,imx6q-snvs-lpgpr" (i.MX6Q/D/DL/S).
>> +- offset: Should contain the offset relative to syscon parrent node.
>
> typo

ok.

>  +- regmap: Should contain a phandle pointing to syscon.
>> +
>> +Example:
>> +	snvs_lpgpr: snvs-lpgpr {
>> +		compatible = "fsl,imx6q-snvs-lpgpr";
>> +		regmap = <&snvs>;
>> +		offset = <0x68>;
>
> Why does this need to be in DT? Is something going to refer to this
> node? If not, the &snvs node should be enough information for the OS.

Jes, it is refereed by other driver.

Thank you.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
