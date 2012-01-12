From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH] irqdomain: include linux/bug.h for WARN_ON()
Date: Thu, 12 Jan 2012 14:41:26 +0000
Message-ID: <20120112144126.GT3226@page>
References: <1324333357-3357-1-git-send-email-jamie@jamieiles.com>
 <4F0EEFA0.7030808@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F0EEFA0.7030808-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 12, 2012 at 08:35:12AM -0600, Rob Herring wrote:
> Jamie,
> 
> On 12/19/2011 04:22 PM, Jamie Iles wrote:
> > Commit 6d274309d (irq: support domains with non-zero hwirq base)
> > introduced a WARN_ON() for an invalid hwirq in irq_domain_to_irq() but
> > doesn't include linux/bug.h resulting in:
> > 
> > include/linux/irqdomain.h: In function 'irq_domain_to_irq':
> > include/linux/irqdomain.h:78:2: error: implicit declaration of function 'WARN_ON'
> > 
> > if it isn't implicitly pulled in before.
> > 
> 
> Considering major irqdomain changes are coming, is this really needed?
> Nothing is currently broken, right?

I think it's still worth applying though - if any of the new irqdomain 
work still uses WARN()/BUG() and friends then it'll be required, and it 
is possible that an existing platform with a different configuration 
_could_ run into this.

I'll leave it up to you though.

Jamie
