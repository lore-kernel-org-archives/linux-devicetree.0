From: Boris BREZILLON <b.brezillon.dev@gmail.com>
Subject: Re: [RFC PATCH v2 08/14] mtd: nand: add sunxi NAND flash controller
 support
Date: Wed, 29 Jan 2014 20:02:52 +0100
Message-ID: <52E9505C.8080001@gmail.com>
References: <1391006064-28890-1-git-send-email-b.brezillon.dev@gmail.com> <1391006064-28890-9-git-send-email-b.brezillon.dev@gmail.com> <20140129175641.GF1427@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140129175641.GF1427@obsidianresearch.com>
Sender: linux-doc-owner@vger.kernel.org
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, David Woodhouse <dwmw2@infradead.org>, Grant Likely <grant.likely@linaro.org>, Brian Norris <computersforpeace@gmail.com>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, dev@linux-sunxi.org
List-Id: devicetree@vger.kernel.org

Le 29/01/2014 18:56, Jason Gunthorpe a =E9crit :
> On Wed, Jan 29, 2014 at 03:34:18PM +0100, Boris BREZILLON wrote:
>
>> +static int sunxi_nand_chip_init_timings(struct sunxi_nand_chip *chi=
p,
>> +					struct device_node *np)
>> +{
>> +	const struct nand_sdr_timings *timings;
>> +	u32 min_clk_period =3D 0;
>> +	int ret;
>> +
>> +	ret =3D onfi_get_async_timing_mode(&chip->nand);
>> +	if (ret =3D=3D ONFI_TIMING_MODE_UNKNOWN) {
>> +		ret =3D of_get_nand_onfi_timing_mode(np);
>> +		if (ret < 0)
>> +			return ret;
>> +	}
> [..]
>
>> +static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nf=
c *nfc,
> [..]
>> +       ret =3D sunxi_nand_chip_init_timings(chip, np);
>> +       if (ret)
>> +               return ret;
> [..]
>> +       ret =3D nand_scan_ident(mtd, nsels, NULL);
> This ordering looks a bit problematic, will onfi_get_async_timing_mod=
e
> ever return anything other than ONFI_TIMING_MODE_UNKNOWN if it is
> called before nand_scan_ident ?
Indeed. I haven't tested this part as I don't own any board with an ONF=
I=20
compatible chip.
> What sets clk_rate to non-zero if there
> is no DT property?
It is set to 20 MHz by default, but it should definitely be set to the=20
rate fulfilling mode 0.
I'll fix this.

>
> For a flow that uses onfi_get_async_timing_mode rather than DT the
> driver should set the interface to timing mode 0 (slowest) and then
> call nand_scan_ident, and then reset the interface to the detected
> timing mode.

Absolutely.

>
> Maybe this should be implemented in the core code through a new
> callback (nand->set_timing_mode ?)
>
> Regards,
> Jason

