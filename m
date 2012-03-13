From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 7/7] ARM: kirkwood: use devicetree for rtc-mv
Date: Tue, 13 Mar 2012 09:22:16 -0400
Message-ID: <20120313132216.GI5050@titan.lakedaemon.net>
References: <cover.1331601448.git.jason@lakedaemon.net>
 <92d02581e0fce75f84d61edf55678108237e881a.1331601448.git.jason@lakedaemon.net>
 <201203130958.31223.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201203130958.31223.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org, michael-QKn5cuLxLXY@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 13, 2012 at 09:58:30AM +0000, Arnd Bergmann wrote:
> On Tuesday 13 March 2012, Jason Cooper wrote:
> > 
> > Signed-off-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/kirkwood.dtsi   |    6 ++++++
> >  arch/arm/mach-kirkwood/board-dt.c |    1 -
> >  arch/arm/mach-kirkwood/common.c   |    2 +-
> >  arch/arm/mach-kirkwood/common.h   |    1 -
> >  4 files changed, 7 insertions(+), 3 deletions(-)
> > 
> 
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> 
> I think you can just merge this with patch 6, as they are two halves
> of the same work.

Others working on kirkwood and dt asked me to separate the two to
facilitate integrating with their existing work.  I can undo if you
think it's best.

thx,

Jason.
