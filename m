From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: DT vs ARM static mappings
Date: Fri, 23 Sep 2011 17:45:06 +0200
Message-ID: <201109231745.06264.arnd@arndb.de>
References: <1316519479.4611.150.camel@hornet.cambridge.arm.com>
	<201109202128.55517.arnd@arndb.de>
	<1316708611.4611.873.camel@hornet.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1316708611.4611.873.camel-okZbbLrgpR/YkXV2EHHjLW3o5bpOHsLO@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 22 September 2011, Pawel Moll wrote:
> Executive summary:
> 
> * I have second map_desc with pfn for RS1 memory map, but using the same
> virtual address as the legacy one. The legacy one is used if root of the
> tree is compatible with "arm,vexpress-legacy".
> 
> * The devices I need to use in v2m.c have aliases in DTS so I can find
> their offsets in the flat tree (the *_find_node_by_alias() function is
> rather generic and could be moved to drivers/of/fdt.c if you think it
> would be useful for others).
> 
> * There are no more users of MMIO_P2V in v2m.c, next thing I will do is
> the same in core tile; then the macro can be killed. Once this happens
> the virtual address currently taken from __MMIO_P2V(V2M_PA_CS7) will be
> replaced by some kind of "#define V2M_PERIPH_BASE 0xf8000000".
> 
> * Once Nico's changes regarding static maps are in, the manual pointer
> operations in v2m_dt_map_io can be replaced with neat ioremap()-s.
> 
> All feedback appreciated, cheers!

Look ok to me. Just a comment on the submission:

Even when you post something for review instead of inclusion, please add
a Signed-off-by: line and a diffstat.

	Arnd
