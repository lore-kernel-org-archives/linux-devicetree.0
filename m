From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: [PATCH] of: fix build failure
Date: Mon, 7 Dec 2015 12:06:34 +0530
Message-ID: <20151207063634.GD4122@sudip-pc>
References: <20151203011814.GC5727@sirena.org.uk>
 <1449131890-21675-1-git-send-email-sudipm.mukherjee@gmail.com>
 <CAMuHMdWLURXVQNbTv4O9znB-dEH5_kFgPbTYuR5TgOcaDNrSJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdWLURXVQNbTv4O9znB-dEH5_kFgPbTYuR5TgOcaDNrSJw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Linux-Next <linux-next@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, Dec 05, 2015 at 12:09:41PM +0100, Geert Uytterhoeven wrote:
> Hi Sudip
> 
> On Thu, Dec 3, 2015 at 9:38 AM, Sudip Mukherjee
> <sudipm.mukherjee@gmail.com> wrote:
> > We are having build failure with next-20151202 for sparc allmodconfig
> > with the error messages:
> > undefined reference to 'of_io_request_and_map'
> >
> > CONFIG_OF is defined for sparc so it is expected that we have a
> > definition of of_io_request_and_map() but of/address.c is only compiled
> > if it is !SPARC.
> 
> No, it's compiled depending on CONFIG_OF_ADDRESS...

yes, ofcourse. I did it looking at:
config OF_ADDRESS
def_bool y
depends on !SPARC && HAS_IOMEM
> 
> > Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
> > ---
<snip>
> > +#if defined(CONFIG_OF) && !defined(CONFIG_SPARC)
> 
> ... hence wouldn't it be better to use "#ifdef CONFIG_OF_ADDRESS" instead?
> 
I will test with today's next and send v2.

regards
sudip
