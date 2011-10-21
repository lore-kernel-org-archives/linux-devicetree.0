From: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] of/flattree: Early "find node by alias" function
Date: Fri, 21 Oct 2011 18:08:13 +0100
Message-ID: <1319216893.5094.10.camel@hornet.cambridge.arm.com>
References: <1319210219-10707-1-git-send-email-pawel.moll@arm.com>
 <4EA1A1A9.2090403@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4EA1A1A9.2090403-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2011-10-21 at 17:45 +0100, David Daney wrote:
> How is this patch different/better than:
> http://lists.ozlabs.org/pipermail/devicetree-discuss/2011-June/005819.html

Probably I should have been more precise...

> > This patch adds a function for finding a node in flat tree
> > based on an alias name. It can be used in early boot code.

and add "... before the tree is unflattened.". So the it's similar to a
difference between

const void *of_get_property(const struct device_node *np, const char *name,
                         int *lenp)

and

void *__init of_get_flat_dt_prop(unsigned long node, const char *name,
                                 unsigned long *size)

Cheers!

Pawel
