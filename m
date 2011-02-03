From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v2 0/3] powerpc: Open PIC binding and 'no-reset'
	implementation
Date: Thu, 3 Feb 2011 09:22:53 -0600
Message-ID: <D6C286E3-9D14-4C11-9974-61DDAB7CB6E2@kernel.crashing.org>
References: <1296697900-14004-1-git-send-email-meador_inge@mentor.com>
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1296697900-14004-1-git-send-email-meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: Hollis Blanchard <hollis_blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Feb 2, 2011, at 7:51 PM, Meador Inge wrote:

> This patch set provides a binding for Open PIC and implements support for
> a new property, specified by that binding, called 'no-reset'.  With 'no-reset'
> in place the 'protected-sources' property is no longer needed and was removed.
> 
> Signed-off-by: Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> CC: Hollis Blanchard <hollis_blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> 
> Meador Inge (3):
>  powerpc: Removing support for 'protected-sources'
>  powerpc: document the Open PIC device tree binding
>  powerpc: make MPIC honor the 'no-reset' device tree property
> 
> Documentation/powerpc/dts-bindings/open-pic.txt |  115 +++++++++++++++++++++++
> arch/powerpc/include/asm/mpic.h                 |    7 +-
> arch/powerpc/sysdev/mpic.c                      |   92 ++++++++----------
> 3 files changed, 160 insertions(+), 54 deletions(-)
> create mode 100644 Documentation/powerpc/dts-bindings/open-pic.txt
> 

Please cleanup all the .dts that are impacted by this.

- k
