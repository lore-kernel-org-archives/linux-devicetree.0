From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH V3 1/5] ARM: kirkwood: Basic support for DNS-320 and
 DNS-325
Date: Fri, 30 Mar 2012 21:30:06 -0400
Message-ID: <20120331013006.GH7274@titan.lakedaemon.net>
References: <1332885255-8304-1-git-send-email-jm@lentin.co.uk>
 <1332885255-8304-2-git-send-email-jm@lentin.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1332885255-8304-2-git-send-email-jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 27, 2012 at 10:54:11PM +0100, Jamie Lentin wrote:
> Add support for the DNS-320 and DNS-325. Describe as much as currently possible
> in the devicetree files, create a board-dnskw.c for everything else.
> 
> Use IEEE-compliant "okay", rather than "ok"
> 
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Acked-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
> Signed-off-by: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
> ---
>  arch/arm/boot/dts/kirkwood-dns320.dts |   29 +++
>  arch/arm/boot/dts/kirkwood-dns325.dts |   24 +++
>  arch/arm/mach-kirkwood/Kconfig        |   23 +++
>  arch/arm/mach-kirkwood/Makefile       |    1 +
>  arch/arm/mach-kirkwood/Makefile.boot  |    2 +
>  arch/arm/mach-kirkwood/board-dnskw.c  |  306 +++++++++++++++++++++++++++++++++
>  arch/arm/mach-kirkwood/board-dt.c     |    5 +
>  arch/arm/mach-kirkwood/common.h       |    6 +
>  8 files changed, 396 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/boot/dts/kirkwood-dns320.dts
>  create mode 100644 arch/arm/boot/dts/kirkwood-dns325.dts
>  create mode 100644 arch/arm/mach-kirkwood/board-dnskw.c

Jamie,

I've applied this locally, thanks.  Looks like Grant took #5 through his
tree.  As #3 and #4 depend on #2, I'll wait for the next version of #2
incorporating Grant's comments before I apply #2-#4.

thx,

Jason.
