From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] fsl/mpic: Document and use the "big-endian" device-tree
 flag
Date: Thu, 5 Jan 2012 12:35:30 -0600
Message-ID: <DE2E2CDA-D373-4E48-82EA-B8E1F05236D9@kernel.crashing.org>
References: <1324571123-11577-1-git-send-email-Kyle.D.Moffett@boeing.com>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1324571123-11577-1-git-send-email-Kyle.D.Moffett-X8CqP27nNzzQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Kyle Moffett <Kyle.D.Moffett-X8CqP27nNzzQT0dZR+AlfA@public.gmane.org>
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lucas De Marchi <lucas.demarchi-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Dec 22, 2011, at 10:25 AM, Kyle Moffett wrote:

> The MPIC code checks for a "big-endian" property and sets the flag
> MPIC_BIG_ENDIAN if one is present.  Unfortunately, the PowerQUICC-III
> compatible device-tree does not specify it, so all of the board ports
> need to manually set that flag when calling mpic_alloc().
> 
> Document the flag and add it to the pq3 device tree.  Existing code
> will still need to pass the MPIC_BIG_ENDIAN flag because their dtb may
> not have this property, but new platforms shouldn't need to do so.
> 
> Signed-off-by: Kyle Moffett <Kyle.D.Moffett-X8CqP27nNzzQT0dZR+AlfA@public.gmane.org>
> ---
> .../devicetree/bindings/powerpc/fsl/mpic.txt       |    9 ++++++++-
> arch/powerpc/boot/dts/fsl/pq3-mpic.dtsi            |    1 +
> 2 files changed, 9 insertions(+), 1 deletions(-)

need to update arch/powerpc/boot/dts/fsl/qoriq-mpic.dtsi

- k
