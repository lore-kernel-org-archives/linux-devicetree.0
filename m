From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 01/18] arm: shmobile: Document Kingfisher board DT
 bindings
Date: Thu, 21 Sep 2017 10:08:56 +0200
Message-ID: <20170921080856.GB15749@verge.net.au>
References: <1505587727-15543-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <20170920133945.6yfeio56lohduvvi@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170920133945.6yfeio56lohduvvi@rob-hp-laptop>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 20, 2017 at 03:52:58PM -0500, Rob Herring wrote:
> On Sat, Sep 16, 2017 at 09:48:47PM +0300, Vladimir Barinov wrote:
> > Add Kingfisher Device tree bindings Documentation, listing it as a
> > supported board.
> > Kingfisher is the H3ULCB/M3ULCB extension board.
> > 
> > Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> > ---
> > Changes in version 2:
> > - added own compatible value "shimafuji,kingfisher"
> > Changes in version 3:
> > - seperate Kingfisher entry from H3ULCB/M3ULCB
> > 
> >  Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
> > index ae75cb3..5921ac2 100644
> > --- a/Documentation/devicetree/bindings/arm/shmobile.txt
> > +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
> > @@ -76,6 +76,8 @@ Boards:
> >      compatible = "iwave,g20d", "iwave,g20m", "renesas,r8a7743"
> >    - iWave Systems RZ/G1M Qseven System On Module (iW-RainboW-G20M-Qseven)
> >      compatible = "iwave,g20m", "renesas,r8a7743"
> > +  - Kingfisher (SBEV-RCAR-KF-M03)
> > +    compatible = "shimafuji,kingfisher";
> 
> Not consistent with the ';'. Otherwise,
> 
> Acked-by: Rob Herring <robh@kernel.org>

Thanks, applied with the ';' removed.
