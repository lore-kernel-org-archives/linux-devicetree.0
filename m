From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 0/4] dw_dmac: introduce generic DMA binding for DT
Date: Wed, 20 Feb 2013 09:50:25 +0000
Message-ID: <201302200950.26182.arnd@arndb.de>
References: <1360952512-971558-1-git-send-email-arnd@arndb.de>
 <20130220080348.GF23302@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130220080348.GF23302-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
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
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Shevchenko <andriy.shevchenko-b5Z7lJ3WibVrdx17CPfAsdBPR1lH4CV8@public.gmane.org>, Dan Williams <djbw-b10kYP2dOMg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 20 February 2013, Vinod Koul wrote:
> Since there is still churn, would it make sense if I just revert the SPEAr13xx
> patch (your first patch) and send a pull request to Linus.
> Since there are no users and not much testing has been done, I think we can push
> these to 3.10 via arm-soc/slave-dma tree.
> 
> Gives more testing and usage will go along as well.
> Since merge window is open, I would like my pull to go soonish and not churn the
> tree much.

Reverting the SPEAr13xx would definitely help, yes. The reason why I'd also like
to see the second patch get merged is so that we can do the SPEAr changes in 3.10
without having an interdependency between the trees. I tried very hard to
make the patch have a minimal impact on the non-DT code path to avoid regressions.

Maybe you can send your tree now with just the revert applied, and then send the
other one separately next week along with any bug fixes that may have accumulated
by then?

	Arnd
