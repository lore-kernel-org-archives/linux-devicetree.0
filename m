From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 2/2] sifive: edac: Add EDAC driver for Sifive l2 Cache
 Controller
Date: Mon, 25 Mar 2019 07:54:54 +0100
Message-ID: <20190325065453.GC12016@zn.tnic>
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
 <1552382461-13051-3-git-send-email-yash.shah@sifive.com>
 <20190312092842.GC28589@zn.tnic>
 <alpine.DEB.2.21.9999.1903241705460.8028@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1903241705460.8028@viisi.sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Yash Shah <yash.shah@sifive.com>, linux-riscv@lists.infradead.org, linux-edac@vger.kernel.org, palmer@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, aou@eecs.berkeley.edu, mchehab@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Mar 24, 2019 at 05:16:17PM -0700, Paul Walmsley wrote:
> Looking at the Synopsys,

Look again at synopsys_edac.

>  Highbank,

Yes, that one and octeon.

> PowerPC 4xx, and

also a single ppc4xx_edac driver.

> TI EDAC drivers,

There's TI drivers, plural? I see only ti_edac.c. Also, per-vendor.

> all of those are clearly for IP block error management, rather than
> platform error management. Has the upstream guidance changed since
> those drivers were merged?

There are others which are per-platform and work just fine this way:
xgene_edac, altera_edac, layerscape_edac, qcom_edac, synopsys_edac...

The problem with per IP block is that if those compilation units would
need to share info or communicate, then that is impossible nowadays and
you'd need to build something on your own.

Also, the EDAC core supports only one driver.

> The core issue for us is that we don't have a generalized "ECC management" 
> IP block.  And I would just as soon not fake one in the DT data, since the 
> general DT guidance is that the data in DT is meant to describe the actual 
> hardware.

Look at how the others I mentioned above do it.

> Would it make more sense to put this driver outside of drivers/edac?

If you're not going to need any EDAC facilities - which are not a lot,
btw :) - you can do whatever you prefer.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
