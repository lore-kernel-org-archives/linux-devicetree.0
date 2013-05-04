From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH] irqchip: add support for Marvell Orion SoCs
Date: Sat, 4 May 2013 14:12:27 -0400
Message-ID: <20130504181227.GN31290@titan.lakedaemon.net>
References: <1367519104-19677-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <alpine.LFD.2.02.1305022324371.2891@ionos>
 <5182E11E.5010103@gmail.com> <201305030009.57041.arnd@arndb.de>
 <5182EAA0.9070208@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5182EAA0.9070208-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, May 03, 2013 at 12:37:20AM +0200, Sebastian Hesselbarth wrote:
> (@Jason C: Are you sure that I should merge dove and orion
> irqchip patches? I doubt that anything touching generic irq
> will not go through irq tree.)

Putting them in the same patch series does not imply they have to go
through the same tree.  But it *does* allow us to see relationships,
conflicts, etc.

Based on how the finally dependencies work out, we may ask the irq
maintainers for an Ack to take it through arm-soc.  This would happen if
we can't remove the dependency between the trees.  The resulting
potential merge conflicts weigh into it, and that's where the irqchip
maintainer's Ack get decided.

If the changes to irqchip are just Makefile/Kconfig, then it's easy.
However, if several other files are changed and conflicting, then we let
it go through irqchip and wait one merge window for the board changes
depending on it.

The goal here is to identify and remove branch dependencies within
arm-soc and between arm-soc and other trees.  A secondary goal is to
identify high-risk series (risk of being dropped), and keep them
in separate branches from other changes.

thx,

Jason.
