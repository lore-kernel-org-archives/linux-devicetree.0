From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH V5 0/4] ARM: Kirkwood: Add support for DNS-320 and
 DNS-325 using devicetree
Date: Wed, 18 Apr 2012 09:16:35 -0400
Message-ID: <20120418131635.GK15711@titan.lakedaemon.net>
References: <1334743603-8488-1-git-send-email-jm@lentin.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1334743603-8488-1-git-send-email-jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 18, 2012 at 11:06:39AM +0100, Jamie Lentin wrote:
> Reworked patch for latest feedback. I'm still basing this on Jason Cooper's
> tree, given how much time has passed should I be rebasing against something
> else or is this still fine?

Typically, work should be based against a stable tag.  In this case, the
changes in my branch were merged in for 3.4-rc1, so you could base from
there.

It's fine the way it is, I'll let you know if I run into any problems.

> One thing I noticed is that with only the first patch applied (which no
> longer calls kirkwood_nand_init) the device either locks up or serial console
> dies at "Gating clock of unused units", presumably as CGC_RUNIT isn't set.
> Is this something known or is it worth further investigation?

That could potentially mess up a future bisect.  However, it would only
crop up for dnskw boards.  I'll let Grant weigh in on this since he's
the one who asked that the nand init be removed.

thx,

Jason.
