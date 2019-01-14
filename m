From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 5/5] dt-bindings: gnss: add lna-supply property
Date: Mon, 14 Jan 2019 10:15:17 +0100
Message-ID: <20190114091517.GD3691@localhost>
References: <20181209195150.5192-1-andreas@kemnade.info>
 <20181209195150.5192-6-andreas@kemnade.info>
 <20190110122757.GB9725@localhost>
 <20190110180732.75490757@kemnade.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190110180732.75490757@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Johan Hovold <johan@kernel.org>, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 10, 2019 at 06:07:32PM +0100, Andreas Kemnade wrote:
> On Thu, 10 Jan 2019 13:27:57 +0100
> Johan Hovold <johan@kernel.org> wrote:
> 
> > On Sun, Dec 09, 2018 at 08:51:50PM +0100, Andreas Kemnade wrote:
> > > Add lna-supply property.
> > > 
> > > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > > ---
> > > Changes in v2:
> > >  - reordering
> > > Original order had a
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > 
> > >  Documentation/devicetree/bindings/gnss/sirfstar.txt | 1 +
> > >  1 file changed, 1 insertion(+)  
> > 
> > Ah, missed this one at first.
> > 
> > But shouldn't this go into the generic binding since it isn't specific
> > for sirf-star based receivers?
> 
> That idea was formulated with a question mark towards Rob.
> And no reaction from Rob about that.

Right, maybe that suggestion wasn't very clear.

But since this property is not specific to sirf-star based devices, it
needs to go in the generic binding.

Thanks,
Johan
