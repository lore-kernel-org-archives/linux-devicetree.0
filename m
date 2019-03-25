From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 2/2] sifive: edac: Add EDAC driver for Sifive l2 Cache
 Controller
Date: Sun, 24 Mar 2019 17:16:17 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1903241705460.8028@viisi.sifive.com>
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com> <1552382461-13051-3-git-send-email-yash.shah@sifive.com> <20190312092842.GC28589@zn.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190312092842.GC28589@zn.tnic>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: Yash Shah <yash.shah@sifive.com>, linux-riscv@lists.infradead.org, linux-edac@vger.kernel.org, palmer@sifive.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, aou@eecs.berkeley.edu, mchehab@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 12 Mar 2019, Borislav Petkov wrote:

> Please no EDAC drivers for a single functional unit with RAS
> capabilities. Rather, a sifive_edac or riscv_edac driver which covers
> the whole platform or even architecture and contains support for all the
> RAS functionality there. See altera_edac, for example.

Looking at the Synopsys, Highbank, PowerPC 4xx, and TI EDAC drivers, all 
of those are clearly for IP block error management, rather than platform 
error management.  Has the upstream guidance changed since those drivers 
were merged?

The core issue for us is that we don't have a generalized "ECC management" 
IP block.  And I would just as soon not fake one in the DT data, since the 
general DT guidance is that the data in DT is meant to describe the actual 
hardware.

Would it make more sense to put this driver outside of drivers/edac?


 - Paul
