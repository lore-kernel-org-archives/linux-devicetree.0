From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Subject: Re: [PATCH v10] MTD: LPC32xx MLC NAND driver
Date: Fri, 29 Jun 2012 10:13:58 -0300
Message-ID: <CAAAP30FzY5KgYfnX7=UukZ3MTwfWaypZs+H2bNn15yKmx8VnvA@mail.gmail.com>
References: <1340834129-15545-1-git-send-email-stigge@antcom.de>
	<1340973434.3070.168.camel@sauron.fi.intel.com>
	<CAAAP30HZ1Z5U44wLwSEfcaJSLmVp8AbXPTCagS31hnoCy_tf-g@mail.gmail.com>
	<1340975067.3070.180.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1340975067.3070.180.camel@sauron.fi.intel.com>
Sender: linux-doc-owner@vger.kernel.org
To: dedekind1@gmail.com
Cc: Roland Stigge <stigge@antcom.de>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dwmw2@infradead.org, kevin.wells@nxp.com, srinivas.bakki@nxp.com, linux-arm-kernel@lists.infradead.org, hechtb@googlemail.com, lars@metafoo.de, b32955@freescale.com, leiwen@marvell.com, linux@arm.linux.org.uk
List-Id: devicetree@vger.kernel.org

On Fri, Jun 29, 2012 at 10:04 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Fri, 2012-06-29 at 09:56 -0300, Alexandre Pereira da Silva wrote:
>> > @@ @@
>> > +drivers/mtd/nand/lpc32xx_mlc.c: In function 'lpc32xx_nand_probe':
>> > +drivers/mtd/nand/lpc32xx_mlc.c:679:10: warning: variable 'sr' set but not used [-Wunused-but-set-variable]
>
> gcc 4.6, aiaiai uses W=1 when building.
>
>> > +drivers/mtd/nand/lpc32xx_mlc.c:561:24: error: bad constant expression [sparse]
>
> This is sparse, not gcc.

Does the oob area need to be ecc protected? If not I suggest to just
remove the read_oob and write_oob and let this to nand_base. I think
this is too much overhead to read 6 bytes.
