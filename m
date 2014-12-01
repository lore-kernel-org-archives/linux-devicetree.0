From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 05/11] memory: add Atmel EBI (External Bus Interface) driver
Date: Mon, 01 Dec 2014 22:28:39 +0100
Message-ID: <2153824.ln4mvSCK1X@wuerfel>
References: <1417429647-3419-1-git-send-email-boris.brezillon@free-electrons.com> <2476626.8iiXDzb2Te@wuerfel> <20141201212820.6a7fc4b0@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141201212820.6a7fc4b0@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-arm-kernel@lists.infradead.org, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Andrew Victor <linux@maxim.org.za>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Monday 01 December 2014 21:28:20 Boris Brezillon wrote:
> > On Monday 01 December 2014 19:29:23 Boris Brezillon wrote:
> > > On Mon, 01 Dec 2014 17:26:27 +0100 Arnd Bergmann <arnd@arndb.de> wrote:
> > > 
> > > #define AT91_EBICSA_REGFIELD(off)                   \
> > >     REG_FIELD(ebicsa_off, AT91_MATRIX_EBI_NUM_CS - 1)
> > > 
> > 
> > That would be acceptable too, but what I really meant is one step further:
> > 
> > static const struct reg_field at91sam9260_ebi_csa = 
> >       REG_FIELD(AT91SAM9260_MATRIX_EBICSA_OFF, 0, AT91_MATRIX_EBI_NUM_CS - 1);
> 
> That's what I did in the first place (in a version I didn't submitted),
> and I guess I'll go for that one unless you really prefer the
> alternative (I ran into a lot of trouble with DT bindings ABI
> stability, and I'd prefer to keep DT bindings as simple as
> possible).

Ok, that's good then.

	Arnd
