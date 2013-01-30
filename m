From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5] dmaengine: dw_dmac: move to generic DMA binding
Date: Wed, 30 Jan 2013 16:02:05 +0530
Message-ID: <CAKohpomdO3xeM757NRaZZHOKtk4UixSqvy7431LHEqC-T5w+iw@mail.gmail.com>
References: <1359395857-1235-1-git-send-email-arnd@arndb.de>
 <201301300941.35886.arnd@arndb.de>
 <CAOh2x==WZePgfTWwL0vPdE693n44vW05OS=DSqbnDCs2xzHXuw@mail.gmail.com>
 <201301301008.31196.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201301301008.31196.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 30 January 2013 15:38, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> I meant the spear13xx data sheet, which has to list the request lines
> for its integrated components. There may be other SoCs using the
> same dw_dmac, but this is the main one that is upstream now, and it's
> probably as good as any other one. I just wouldn't want to establish
> a binding that doesn't match any of the known implementations in the
> way it expresses request lines.

Your binding (<controller request-line src-master dst-master) is good
enough for SPEAr :)

SPEAr13xx is a bit complex. Request lines are distributed among masters.
+ there is multiplexing among them.. over that there are two controllers..

But yes, your binding is good enough :)
