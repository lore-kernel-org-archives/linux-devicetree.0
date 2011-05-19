From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 1/4] powerpc: Add fsl mpic timer binding
Date: Thu, 19 May 2011 01:01:27 -0500
Message-ID: <1BBDC69D-E843-4F0E-B22F-D32E2319E780@kernel.crashing.org>
References: <20110324214315.GA9502@schlenkerla.am.freescale.net>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110324214315.GA9502-1MYqz8GpK7RekFaExTCHk1jVikpgYyvb5NbjCUgZEJk@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Mar 24, 2011, at 4:43 PM, Scott Wood wrote:

> Update the existing example in the general mpic binding to have a
> separate TCRx region.  Currently the example doesn't describe TCRx at
> all.  The one upstream device tree with an mpic timer node (p1022ds)
> uses one large reg region to describe both, even though there are other
> unrelated registers in between.  That device tree also contains a bogus
> interrupt specifier, and there's no upstream software that uses this yet,
> so changing this shouldn't be a problem.
> 
> Add a full binding for the MPIC timer node, not just an example of
> 4-cell interrupts in the MPIC binding.
> 
> Add fsl,available-ranges, similar to msi-available-ranges.
> 
> Signed-off-by: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> .../devicetree/bindings/powerpc/fsl/mpic-timer.txt |   38 ++++++++++++++++++++
> .../devicetree/bindings/powerpc/fsl/mpic.txt       |    2 +-
> 2 files changed, 39 insertions(+), 1 deletions(-)
> create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/mpic-timer.txt

applied to next

- k
