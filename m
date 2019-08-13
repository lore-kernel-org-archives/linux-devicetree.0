From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 1/3] macb: bindings doc: update sifive fu540-c000
 binding
Date: Tue, 13 Aug 2019 11:41:53 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1908131140230.5033@viisi.sifive.com>
References: <1563534631-15897-1-git-send-email-yash.shah@sifive.com> <20190812233242.GA21855@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190812233242.GA21855@bogus>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net, nicolas.ferre@microchip.com
Cc: Rob Herring <robh@kernel.org>, Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, mark.rutland@arm.com, palmer@sifive.com, aou@eecs.berkeley.edu, ynezz@true.cz, sachin.ghadi@sifive.com
List-Id: devicetree@vger.kernel.org

Nicolas, Dave,

On Mon, 12 Aug 2019, Rob Herring wrote:

> On Fri, 19 Jul 2019 16:40:29 +0530, Yash Shah wrote:
> > As per the discussion with Nicolas Ferre, rename the compatible property
> > to a more appropriate and specific string.
> > LINK: https://lkml.org/lkml/2019/7/17/200
> > 
> > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> > ---
> >  Documentation/devicetree/bindings/net/macb.txt | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Am assuming you'll pick this up for the -net tree for v5.4-rc1 or earlier.  
If not, please let us know.


- Paul
