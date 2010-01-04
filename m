From: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [PATCH 06/11] arm-dt: postpone machine detection until setup_arch
	with CONFIG_ARM_DEVTREE
Date: Tue, 5 Jan 2010 06:26:54 +0800
Message-ID: <201001050926.54286.jeremy.kerr@canonical.com>
References: <1261479296.247430.731563214048.6.gpush@pororo>
	<4B421903.4050200@simtec.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4B421903.4050200-Y5A6D6n0/KfQXOPxS62xeg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Ben Dooks <ben-Y5A6D6n0/KfQXOPxS62xeg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Ben,

> > When we're using CONFIG_ARM_DEVTREE, we need to postpone machine
> > detection until later in setup_arch. Because ARM_DEVTREE depends on
> > !DEBUG_LL, we don't need the mdesc this early anyway.
> >
> > We'll add support for ARM_DEVTREE && DEBUG_LL later.
> 
> Why not add a specific machine type for 'this is device tree' and
> then these routines don't even need to #ifdef. It would especially
> be good as it allows dt and non-dt machines to coexist in the same
> kernel together.

Mainly because this doesn't gain us much; the machine_desc that is discovered 
from this new machine type would not have the correct data (phys_io & 
io_pg_offset) required for early setup (used for DEBUG_LL).

We could conditionally skip the detection if we see a DT machine type, but 
then we'd need to add similar checks for all the paths where the machine_desc 
is used.

However, my goal is indeed to allow DT and non-DT machines to coexist as much 
as possible, this patch is more a temporary workaround while I figure out how 
to handle the DEBUG_LL stuff nicely for DT cases.

Cheers,


Jeremy
