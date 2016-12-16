From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v7 1/2] mtd: nand: add tango NFC dt bindings doc
Date: Fri, 16 Dec 2016 13:33:16 +0000
Message-ID: <20161216133316.GE20265@leverpostej>
References: <580F5AD2.9020909@sigmadesigns.com>
 <580F5B06.6030608@sigmadesigns.com>
 <1978954.SRtJpfOGp1@wuerfel>
 <d3cbfda6-23bf-4ad1-b1ce-c179b765272f@sigmadesigns.com>
 <ee9efd0a-59f5-8c21-0cad-40ca30e3a3e7@sigmadesigns.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ee9efd0a-59f5-8c21-0cad-40ca30e3a3e7-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Gonzalez <marc_gonzalez-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-mtd <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mason <slash.tmp-GANU6spQydw@public.gmane.org>, Sebastian Frias <sf84-QFKgK+z4sOrR7s880joybQ@public.gmane.org>, Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 16, 2016 at 02:26:33PM +0100, Marc Gonzalez wrote:
> On 16/12/2016 11:56, Marc Gonzalez wrote:
> > Should I just use "rxtx" for my driver?
> 
> On IRC, Arnd wrote:
> 
> "The string for dma-names is not important, it just needs to be documented
> in the binding. If you have hardware specifications, use the name that is
> next to the wire for the dma-request line. "dma-names" is only required so
> you can connect a single dmarq to multiple dma engines (most chips only
> connect each rq to one dmaengine though)."
> 
> In my system, peripheral devices are connected to DMA channels via
> a multiplexer called the "host switch box". The documentation calls
> the ports FOO_SBOX and SBOX_FOO.
> 
> For MLC NAND Flash controller 0, the ports are mlc_flash0_sbox
> and sbox_mlc_flash0.
> 
> Additionally, the DMA driver handles both directions, so the DT only
> defines a single duplex channel.
> 
> I originally used "nfc_sbox" (nfc = NAND Flash controller) to stick to
> the HW naming, but I am willing to change it to "rxtx" if that's what
> Boris prefers, (or just "sbox", but Mans pointed out that this was too
> specific, and future HW might do away with the switch box).

"rxtx" is the best option, if you need a name at all.

The name is relative to the device instance, so "nfc_" is unnecessary;
we know the node is an NFC controller. The sbox is part of the SoC
wiring rather than being part of the NFC controller, so the "sbox" part
also shouldn't be part of the name.

Likewise for the NAND flash controller. There, the "0" instance number
also shouldn't have been there -- the name is relative to the instance,
and two instances should use the same names. Too late now, I guess. :(

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
