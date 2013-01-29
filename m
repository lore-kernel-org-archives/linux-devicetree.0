From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: SPEAr13xx: Pass generic DW DMAC platform data
 from DT
Date: Tue, 29 Jan 2013 13:21:30 +0000
Message-ID: <201301291321.30726.arnd@arndb.de>
References: <1359395857-1235-1-git-send-email-arnd@arndb.de>
 <1359410300-26113-6-git-send-email-arnd@arndb.de>
 <CAKohpokrvYDaMgB-5HV+bJh01YNU4H5UrSUnzxa_NpvE1qQqiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAKohpokrvYDaMgB-5HV+bJh01YNU4H5UrSUnzxa_NpvE1qQqiA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 29 January 2013, Viresh Kumar wrote:
> You forgot spear-devel for this series.

Ok, thanks for adding it.

> > +                       dma-channels = <8>;
> > +                       #dma-cells = <3>;

Yep, my mistake again. It was correct in v1 of the patch and then
I changed it so it had to be 4.

	Arnd
