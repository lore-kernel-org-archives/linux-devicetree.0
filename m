From: "Li.Xiubo@freescale.com" <Li.Xiubo@freescale.com>
Subject: RE: [PATCHv4 2/2] regmap: add DT endianness binding support.
Date: Mon, 19 May 2014 04:11:35 +0000
Message-ID: <00adcdedcfdf4c828d5fd5a8dd7e28bd@BY2PR03MB505.namprd03.prod.outlook.com>
References: <1399601073-19278-1-git-send-email-Li.Xiubo@freescale.com>
 <1399601073-19278-3-git-send-email-Li.Xiubo@freescale.com>
 <20140509164719.GE16418@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140509164719.GE16418@e106331-lin.cambridge.arm.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, Pawel Moll <Pawel.Moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "rdunlap@infradead.org" <rdunlap@infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "broonie@kernel.org" <broonie@kernel.org>, "galak@codeaurora.org" <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> Subject: Re: [PATCHv4 2/2] regmap: add DT endianness binding support.
> 
> On Fri, May 09, 2014 at 03:04:33AM +0100, Xiubo Li wrote:
> > For many drivers which will support rich endianness of CPU<-->Dev
> > need define DT properties by itself without the binding support.
> >
> > The endianness using regmap:
> > Index    CPU       Device     Endianess flag for DT bool property
> > ------------------------------------------------------------
> > 1        LE        LE         -
> > 2        LE        BE         'big-endian-{val,reg}'
> > 3        BE        BE         -
> > 4        BE        LE         'little-endian-{val,reg}'
> 
> Get rid of the CPU column. It has precisely _nothing_ to do with the
> device.
> 
> If you happen to have a device that can be integrated with varying
> endianness, the endianness should be described regardless of whether
> this happens to be the same as the CPU endianness. The kernel can then
> choose to do the right thing regardless.
> 
> Assuming LE or BE by default is sane if most implementations are one
> rather than the other. Probing and figuring it out dynamically is also
> fine. Assuming that it's the same as the kernel is broken in general,
> and should be avoided -- those cases _require_ a *-endian property to
> work if the CPU can function in either endianness.
> 

Yes, If my understanding is correct, if we need inverting the bytes order, 
should be add one property here, regardless of the CPU's endianesses.


> > Please see the following documetation for detail:
> >     Documentation/devicetree/bindings/endianness/endianness.txt
> 
> I don't think this is sufficient. That document describes the preferred
> idiom, not the meaning w.r.t. a specific binding.
> 
> [...]
> 
> > +	case REGMAP_ENDIAN_REG:
> > +		if (of_property_read_bool(np, "big-endian-reg"))
> > +			*endian = REGMAP_ENDIAN_BIG;
> > +		else if (of_property_read_bool(np, "little-endian-reg"))
> > +			*endian = REGMAP_ENDIAN_LITTLE;
> 
> While this follows the guidelines you've added, context is still
> required to understand precisely what this means. We need a binding
> document describing what *-endian-reg means for this binding (i.e. what
> does -reg cover? All registers? some? buffers?).
> 

Yes, for now the 'reg' is for all registers of the device.
And the 'val' is for all the values and buffers of the device.

@Mark Brown,
Do you have any correction here ?


> Imagine I added a little-endian-foo property. You'd be able to reason
> that something is little endian, but you'd have no idea of precisely
> what without reading documentation or code. As not everyone wants to
> read several thousand lines of Linux kernel code to write a dts we
> require documentation.
> 

@Mark Rutland, @Mark Brown,
Yes, where should I locate the documentation ?
Is Documentation/devicetree/bindings/regmap/ okay ?


Thanks,

BRs
Xiubo


> > +	case REGMAP_ENDIAN_VAL:
> > +		if (of_property_read_bool(np, "big-endian-val"))
> > +			*endian = REGMAP_ENDIAN_BIG;
> > +		else if (of_property_read_bool(np, "little-endian-val"))
> > +			*endian = REGMAP_ENDIAN_LITTLE;
> 
> Likewise.
> 
> Cheers,
> Mark.
