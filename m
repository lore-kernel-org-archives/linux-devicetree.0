From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH] Globally s/struct irq_host/struct irq_domain/
Date: Fri, 21 Jan 2011 12:02:28 -0600
Message-ID: <E1PgLJc-0005rB-CP@jdl.com>
References: <E1Pd18R-0002d3-US@jdl.com>
	<20110121171314.GD7477@angua.secretlab.ca>
	<E1PgKdi-0005fc-J5@jdl.com>
	<AANLkTi=bHV9XJoUT_ki1Eziq5fM3DekrOLoFuNzGGv91@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <AANLkTi=bHV9XJoUT_ki1Eziq5fM3DekrOLoFuNzGGv91-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org> 
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> 
> I always reserve the right to change my mind.  }:-> 

Naturally!

> Sorry about that,

No problem.  The thought back then was that we'd hit the "global"
piece and then we'd buy the time to hit the local pieces as we could.

> but I actually applied the patch this morning with the thought that
> I'd get Linus to pick it up late to avoid collisions in linux-next.

Makes sense.

> However, when I actually looked at the result I realized that at the
> very least, the irq_host_ops, the #defines, and the irq_*_host
> functions absolutely have to be renamed at the same time.  Not
> necessarily in the same patch, but definitely at the same time.

Will do!

jdl
