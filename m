From: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Subject: Re: [PATCH 2/3 v4] arm: kirkwood: add dreamplug (fdt) support.
Date: Wed, 22 Feb 2012 16:17:21 -0500 (EST)
Message-ID: <alpine.LFD.2.02.1202221614560.24536@xanadu.home>
References: <cover.1329936660.git.jason@lakedaemon.net>
 <8532afcdc4adbb3771e6f742bcc33ef9c0347858.1329936660.git.jason@lakedaemon.net>
 <201202222046.28707.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <201202222046.28707.arnd-r2nGTMty4D4@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lennert Buytenhek <kernel-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 22 Feb 2012, Arnd Bergmann wrote:

> On Wednesday 22 February 2012, Jason Cooper wrote:
> > Initially, copied guruplug-setup.c and did s/guruplug/dreamplug/g.
> > Then, switched to SPI based NOR flash.
> > 
> > After talking to Arnd Bergman, chose an incremental approach to adding
> > devicetree support.  First, we use the dtb to tell us we are on the
> > dreamplug, then we gradually port over drivers.
> > 
> > Driver porting will start with the uart (see next patch), and progress
> > from there.  Possibly, spi/flash/partitions will be next.
> > 
> > When done, board-dt.c will no longer be dreamplug specific, and dt's can
> > be made for the other kirkwood boards.
> > 
> > Signed-off-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
> 
> Looks good to me. 
> 
> I'm adding Nicolas and Lennert to Cc to make sure they see the mail.
> 
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

I'm fine with the approach.

Acked-by: Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Arnd, Jason: please feel free to work something out between yourselves 
to move those patches into the arm-soc tree.


Nicolas
