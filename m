From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 01/15] Documentation: devicetree: R-Car M3-N SoC DT
 bindings
Date: Mon, 19 Feb 2018 10:19:12 +0100
Message-ID: <20180219091911.m7ixqwp22weghhmi@verge.net.au>
References: <1518515162-23663-1-git-send-email-jacopo+renesas@jmondi.org>
 <1518515162-23663-2-git-send-email-jacopo+renesas@jmondi.org>
 <20180214100150.dv2fkffussrfqkme@verge.net.au>
 <20180219025213.iqu7vsmrsbbqe4ky@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180219025213.iqu7vsmrsbbqe4ky@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org, Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, Feb 18, 2018 at 08:52:13PM -0600, Rob Herring wrote:
> On Wed, Feb 14, 2018 at 11:01:53AM +0100, Simon Horman wrote:
> > On Tue, Feb 13, 2018 at 10:45:48AM +0100, Jacopo Mondi wrote:
> > > Add device tree bindings documentation for Renesas R-Car M3-N (r8a77965)
> > > SoC.
> > > 
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > 
> > Thanks, this looks fine to me but I think the subject should be updated to
> > 
> > dt-bindings: arm: document R8A77965 SoC bindings
> > 
> > I'll let this sit for a few days to see if any other review is forthcoming.
> > 
> > > ---
> > >  Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
> > >  1 file changed, 2 insertions(+)
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks, applied as

dt-bindings: arm: Document R-Car M3-N SoC DT bindings
