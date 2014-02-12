From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] ARM: mm: cache-l2x0: Check for status property of DT node
Date: Wed, 12 Feb 2014 14:02:53 +0000
Message-ID: <20140212140253.GC25957@e106331-lin.cambridge.arm.com>
References: <1392206478-11530-1-git-send-email-tushar.behera@linaro.org>
 <52FB6C49.6010401@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <52FB6C49.6010401@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, Will Deacon <Will.Deacon@arm.com>, Grant Likely <grant.likely@secretlab.ca>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tushar Behera <tushar.behera@linaro.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 12, 2014 at 12:42:49PM +0000, Tomasz Figa wrote:
> [making Cc list a bit more comprehensive]
> 
> On 12.02.2014 13:01, Tushar Behera wrote:
> > Currently only the DT node is checked during l2x0 cache initialization,
> > but it doesn't check the status of the DT node. Thus it gets called
> > even if the status of DT node for L2 controller is disabled.
> >
> > Add explicit check to ensure that L2 cache is initialized only for
> > desired boards.
> >
> > Reported-by: Tomasz Figa <t.figa@samsung.com>
> > Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> > ---
> >   arch/arm/mm/cache-l2x0.c |    3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
> > index 7abde2c..f075cb1 100644
> > --- a/arch/arm/mm/cache-l2x0.c
> > +++ b/arch/arm/mm/cache-l2x0.c
> > @@ -978,6 +978,9 @@ int __init l2x0_of_init(u32 aux_val, u32 aux_mask)
> >   	if (!np)
> >   		return -ENODEV;
> >
> > +	if (!of_device_is_available(np))
> > +		return -ENODEV;
> > +
> >   	if (of_address_to_resource(np, 0, &res))
> >   		return -ENODEV;
> >
> >
> 
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Looks sensible to me.

Acked-by: Mark Rutland <mark.rutland@arm.com>

Thanks,
Mark.
