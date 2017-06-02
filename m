From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v11 4/6] ARM: dts: imx6q-evi: support altera-ps-spi
Date: Fri, 2 Jun 2017 21:54:22 +0200
Message-ID: <b944db11-bdd2-5b5f-2aa8-01f4135918be@suse.de>
References: <20170525172911.11467-1-stillcompiling@gmail.com>
 <20170525172911.11467-5-stillcompiling@gmail.com>
 <a4d0815c-593f-57a9-41fc-ab636ca9b9e5@suse.de>
 <6513199.IxvCuS6eYj@jclayton-pc>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6513199.IxvCuS6eYj@jclayton-pc>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Bastian Stender <bst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 02.06.2017 um 21:39 schrieb stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org:
> On Friday, June 2, 2017 6:30:12 PM PDT Andreas Färber wrote:
>> Am 25.05.2017 um 19:29 schrieb Joshua Clayton:
>>> diff --git a/arch/arm/boot/dts/imx6q-evi.dts
>>> b/arch/arm/boot/dts/imx6q-evi.dts index 24fe093a66db..a0cbb2d84803 100644
>>> --- a/arch/arm/boot/dts/imx6q-evi.dts
>>> +++ b/arch/arm/boot/dts/imx6q-evi.dts
>>> @@ -82,6 +82,15 @@
>>>
>>>  	pinctrl-names = "default";
>>>  	pinctrl-0 = <&pinctrl_ecspi1 &pinctrl_ecspi1cs>;
>>>  	status = "okay";
>>>
>>> +
>>> +	fpga_spi: cyclonespi@0 {
>>
>> "cyclonespi" does not strike me as the best node name.
>>
>> I am guessing this is a sub-node of a SPI controller node, so no need to
>> repeat "spi", and Cyclone seems more or less implied by "altr,fpga-".
> True.
>>
>> Note that the example in the bindings doc uses "evi-fpga-spi". Nodes
>> don't need to be (shouldn't be?) prefixed with the board. Note that
>> bindings examples tend to get copied a lot.
>>
>> Any reason not to just use "fpga@0" in both places for simplicity?
> Sure. fpga: fpga@0 is probably better.

Note that I was only commenting on the node name, the latter part.

I'm not aware of any rules for the label, so that could remain unchanged
or adopt cyclone_spi from the old node name or whatever is unique and
syntactically valid.

> I'll change it in both the dts and the binding doc.

Thanks. Maybe double-check if there's any conventions Xilinx/Lattice DTs
are using.

Cheers,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
