From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v5 3/4] misc: sram: Add optional clock
Date: Mon, 29 Oct 2012 13:20:59 +0100
Message-ID: <1351513259.5872.105.camel@pizza.hi.pengutronix.de>
References: <1350570453-24546-1-git-send-email-p.zabel@pengutronix.de>
	 <1350570453-24546-4-git-send-email-p.zabel@pengutronix.de>
	 <CAP=VYLo6CRg9goGivS6h0avfP6cqQZzvsTEGQp=Ky3npmtxcDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAP=VYLo6CRg9goGivS6h0avfP6cqQZzvsTEGQp=Ky3npmtxcDg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Shawn Guo <shawn.guo@linaro.org>, Richard Zhao <richard.zhao@freescale.com>, Huang Shijie <shijie8@gmail.com>, Dong Aisheng <dong.aisheng@linaro.org>, Matt Porter <mporter@ti.com>, kernel@pengutronix.de, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Am Freitag, den 26.10.2012, 11:18 -0400 schrieb Paul Gortmaker:
> On Thu, Oct 18, 2012 at 10:27 AM, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> > On some platforms the SRAM needs a clock to be enabled explicitly.
> 
> Since this is a file that you've just created in the previous commit,
> I don't see why this needs to exist as a standalone commit, vs just
> being folded back into the previous commit?

you are right, I'll do that.

thanks
Philipp
