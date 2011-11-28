From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: Configurable interrupt sources, and DT bindings
Date: Mon, 28 Nov 2011 22:47:36 +0000
Message-ID: <20111128224735.GB13163@opensource.wolfsonmicro.com>
References: <4ED40B5F.6030603@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4ED40B5F.6030603-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 28, 2011 at 03:29:51PM -0700, Stephen Warren wrote:

> Perhaps one of:

> irq-active-low;
> irq-active-high;
> irq-edge-falling;
> irq-edge-rising;

> or:
> 
> interrupts-config = <"active-low"> // or "active-high", etc.
> (perhaps with indices in that list matching the interrupts property)

We do need to support at least the combination of the two edge triggered
modes simultaneously also.  The first binding handles that nicely but
it's a bit more cumbersome with the second.

> However, given that interrupt sinks already know which signaling methods
> they support, and may be configured to accept a specific method per
> interrupt input using extra interrupt cells, perhaps the solution isn't
> to create a binding that the interrupt sink parses in isolation, but
> rather to create a new API within the kernel where the interrupt source
> can query the interrupt sink for a list of supported signaling methods,
> and pick one that it also supports, and use it. This list could be
> restricted based on the interrupts property's extra cells.

I think we will also need to restrict this with platform/DT data even if
most things can figure it out for themselves.  For example, if there's a
needless pull on the line then it would be preferable to have the idle
state be one where the pull doesn't burn power.
