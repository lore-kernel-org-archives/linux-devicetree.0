From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: Update SERDES_MAX to be SERDES_MAX
 + 1
Date: Wed, 17 Oct 2018 10:09:31 -0500
Message-ID: <20181017150931.GA385@bogus>
References: <cover.1539036280.git.gustavo@embeddedor.com>
 <3a1a95a4832af33dcd1842b0298d257bbcf1f5ab.1539036280.git.gustavo@embeddedor.com>
 <20181009072723.mshyvplpo2xmkyfl@qschulz>
 <dab86dfb-d56b-b7c3-8e2a-6955803a2842@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <dab86dfb-d56b-b7c3-8e2a-6955803a2842@embeddedor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Quentin Schulz <quentin.schulz@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 16, 2018 at 10:44:52AM +0200, Gustavo A. R. Silva wrote:
> Hi,
> 
> On 10/9/18 9:27 AM, Quentin Schulz wrote:
> > Hi Gustavo,
> > 
> > On Tue, Oct 09, 2018 at 12:21:36AM +0200, Gustavo A. R. Silva wrote:
> >> SERDES_MAX is a valid value to index ctrl->phys in
> >> drivers/phy/mscc/phy-ocelot-serdes.c. But, currently,
> >> there is an out-of-bounds bug in the mentioned driver
> >> when reading from ctrl->phys, because the size of
> >> array ctrl->phys is SERDES_MAX.
> >>
> >> Partially fix this by updating SERDES_MAX to be SERDES6G_MAX + 1.
> >>
> >> Notice that this is the first part of the solution to
> >> the out-of-bounds bug mentioned above. Although this
> >> change is not dependent on any other one.
> >>
> > 
> > Reviewed-by: Quentin Schulz <quentin.schulz@bootlin.com>
> > 
> 
> Friendly ping. Who can you take this?

Applied. No need (nor benefit) to ping me. You can check the status of 
DT patches on patchwork[1]. If it is there and in the "New" state, it is 
in my queue.

Rob

[1] https://patchwork.ozlabs.org/project/devicetree-bindings/list/
