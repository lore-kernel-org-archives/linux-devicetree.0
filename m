From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: Configurable interrupt sources, and DT bindings
Date: Fri, 2 Dec 2011 13:34:13 +0000
Message-ID: <20111202133413.GR8245@opensource.wolfsonmicro.com>
References: <4ED40B5F.6030603@nvidia.com>
 <20111129013055.GH3508@truffala.fritz.box>
 <20111129105538.GC2851@opensource.wolfsonmicro.com>
 <20111130051349.GG5435@truffala.fritz.box>
 <20111130093305.GB2791@opensource.wolfsonmicro.com>
 <20111130133140.GL5435@truffala.fritz.box>
 <20111201110738.GA2915@opensource.wolfsonmicro.com>
 <20111202053814.GH5427@truffala.fritz.box>
 <20111202112722.GG8245@opensource.wolfsonmicro.com>
 <20111202122418.GI5427@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111202122418.GI5427-MK4v0fQdeXQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 02, 2011 at 11:24:18PM +1100, David Gibson wrote:

> No, you suggested it be a global property of the interrupt source.
> Same problem, just less so.

Cite?

> > Not in the real world, in the real world we don't have device tree
> > bindings for most of the interrupt controllers out there and therefore
> > no code exists to parse them.  There's a fairly small set of current
> > systems using device tree and a very large set of systems which have
> > never used it before and are currently working on implementing it.

> If we support the PIC at all, it must know how to determine the
> interrupt types.  When DT support is added to the PIC, that will
> include determining the type from the interrupt specifiers.  If we
> don't support the PIC, we don't care.

*sigh*  We do care because as I say in the paragraph you quote above
people are trying to roll device tree out onto new platforms.  The
coverage on PowerPC and SPARC is near 100% but the coverage on ARM is
very far away from that so we're going to have to create a large number
of new bindings.
