From: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/5] ARM: vexpress: Add DT support in v2m
Date: Thu, 17 Nov 2011 18:37:26 +0000
Message-ID: <20111117183726.GE3044@localhost.localdomain>
References: <1321036026-23411-1-git-send-email-pawel.moll@arm.com>
 <1321036026-23411-4-git-send-email-pawel.moll@arm.com>
 <20111117160536.GU9581@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111117160536.GU9581-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 17, 2011 at 04:05:37PM +0000, Russell King - ARM Linux wrote:

[...]

> > @@ -383,11 +412,18 @@ static struct clk_lookup v2m_lookups[] = {
> >  	},
> >  };
> >  
> > +static void __init v2m_system_id(void)
> > +{
> > +	if (!system_rev)
> > +		system_rev = readl(v2m_sysreg_base + V2M_SYS_ID);
> 
> You do understand that system_rev is for the system _revision_ not for
> some kind of system ID.  For example, it's to identify whether we're on
> a revision 4, 5 or 6 system.
> 
> However, with DT the differences in system revision should be encoded
> into the DT itself, and the kernel should not be making choices about
> the hardware off this.

I can't comment on whether this is an abuse of system_rev, since I'm
not too familiar with that.

I feel that Whether the value of the V2M_SYS_ID register should be put
in the DT is more doubtful though: the DT must describe the hardware
which cannot be probed.  Hardware features which can be probed can still
be described in the DT and sometimes this is advantageous -- nonetheless
it does break the one-definition principle and may lead to problems.
One scenario where this does make sense is if the bootloader discovers
that value and injects it into the DT.  However, that would broaden the
interface between the bootloader and kernel in a platform-specific way
and may cause problems itself.

Cheers
---Dave
