From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [RFC] powerpc/fsl-pci: Document the "fsl,
 has-isa" property for Freescale PCI
Date: Wed, 4 Apr 2012 08:08:39 -0500
Message-ID: <E3DD739D-1EC3-4BCA-AE26-1EAE7A086A1E@kernel.crashing.org>
References: <1333263396-23932-1-git-send-email-B38951@freescale.com>
Mime-Version: 1.0 (Apple Message framework v1257)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1333263396-23932-1-git-send-email-B38951-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jia Hongtao <B38951-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Apr 1, 2012, at 1:56 AM, Jia Hongtao wrote:

> If PCI is primary bus we should set isa_io/mem_base when parsing PCI bridge
> resources from device tree. The previous way to check the primary bus based
> on a hard-coded address named primary_phb_addr. Now we add a property named
> "fsl,has-isa" into device tree. In kernel we use this property to find out
> the bus is primary or not. This way is more flexible.
> 
> Signed-off-by: Jia Hongtao <B38951-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Signed-off-by: Li Yang <leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> .../devicetree/bindings/powerpc/fsl/pci.txt        |   36 ++++++++++++++++++++
> 1 files changed, 36 insertions(+), 0 deletions(-)
> create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/pci.txt

This isn't freescale specific, its linux specific.  If anything the property should be linux,has-isa.

But in general I dont think this is a good idea.  In truth one could search the device tree for:

	device_type = "isa";

to try and set this dynamically.

- k
