From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH][v2] define binding for fsl mpic interrupt controllers
Date: Tue, 15 Mar 2011 11:06:18 -0500
Message-ID: <0856EC0E-61E6-47EA-B62A-A5066E1DC101@kernel.crashing.org>
References: <1295476214-27698-1-git-send-email-stuart.yoder@freescale.com>
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1295476214-27698-1-git-send-email-stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stuart yoder <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Jan 19, 2011, at 4:30 PM, Stuart yoder wrote:

> From: Stuart Yoder <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> define the binding for compatible = "fsl,mpic", including
> the definition of 4-cell interrupt specifiers.  The
> 3rd and 4th cells are needed to define additional
> types of interrupt source outside the "normal"
> external and internal interrupts in FSL SoCs.  Define
> error interrupt, IPIs, and PIC timer sources.
> 
> Signed-off-by: Stuart Yoder <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> -version 2
>   -fix some typos
>   -move defintion of interrupt number to the interrupt
>    type 0
>   -defined no-reset property
>   -added some examples
> 
> Documentation/powerpc/dts-bindings/fsl/mpic.txt |  251 +++++++++++++++++++----
> 1 files changed, 209 insertions(+), 42 deletions(-)

applied

- k
