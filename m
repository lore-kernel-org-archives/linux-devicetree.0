From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v2 2/3] mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND
 flash controller driver
Date: Wed, 7 Nov 2018 13:23:42 +0100
Message-ID: <20181107132342.33790247@bbrezillon>
References: <1538732520-2800-1-git-send-email-christophe.kerello@st.com>
        <1538732520-2800-3-git-send-email-christophe.kerello@st.com>
        <20181105173905.385dd06e@bbrezillon>
        <70f99d79-a9d8-0651-d464-2d81b334dbfb@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <70f99d79-a9d8-0651-d464-2d81b334dbfb@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christophe Kerello <christophe.kerello@st.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

On Wed, 7 Nov 2018 12:08:58 +0100
Christophe Kerello <christophe.kerello@st.com> wrote:

> >> +
> >> +write_8bit:
> >> +	for (i = 0; i < len; i++)
> >> +		writeb_relaxed(p[i], io_addr_w);  
> > 
> > Is 8bit access really enforced by the byte accessor? In this case, how
> > can you be sure 32-bit accesses are doing the right thing? Isn't there
> > a bit somewhere in the config reg to configure the bus width?
> >   
> 
> I have checked the framework after Miquèl comment sent on v1 => "If you 
> selected BOUNCE_BUFFER in the options, buf is supposedly
> aligned, or am I missing something?".
> 
> After checking the framework, my understanding was:
>   - In case of 8-bit access is requested, the framework provides no 
> guarantee on buf. To avoid any issue, I write byte per byte.
>   - In case of 8-bit access is not requested, it means that the 
> framework will try to write data in the page or in the oob. When writing 
> to oob, chip->oob_poi will be used and this buffer is aligned. When 
> writing to the page, as the driver enables NAND_USE_BOUNCE_BUFFER 
> option, buf is guarantee aligned.

It's probably what happens right now, but there's no guarantee that all
non-8-bit accesses will be provided a 32-bit aligned buffer. The only
guarantee we provide is on buffer passed to the
chip->ecc.read/write_xxx() hooks, and ->exec_op() can be used outside
of the "page access" path.

> 
> But, I agree that it would be safe to reconfigure the bus width in 8-bit 
> before writing byte per byte in case of a 16-bit NAND is used.

Yes, and I also think you should not base your is-aligned check on the
force_8bit value. Use IS_ALIGNED() instead.
