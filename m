From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 00/14] ARM: SPEAr: DT updates
Date: Mon, 12 Nov 2012 15:21:58 +0000
Message-ID: <201211121521.58766.arnd@arndb.de>
References: <cover.1352608333.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <cover.1352608333.git.viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sr-ynQEQJNshbs@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sunday 11 November 2012, Viresh Kumar wrote:
> These are DT updates for SPEAr SoCs. There aren't any fixes that we want to get
> into 3.7-rc* and we are happy with 3.8.
> 
> Please apply them from mail, as i wouldn't be hosting them in my repo.
> 
> Some of the dtbs which use gpiopinctrl have dependency on Linus's pinctrl tree,
> where an earlier update for adding gpiopinctrl node is present.

Hi Viresh,

I tried pulling in patches 2 to 11, but it no longer builds because of the
dependency you mentioned. Can you be more specific which branch I need
to pull in?

If you have non-obvious dependencies, I would actually prefer getting a pull
request. I know you have access to git.linaro.org, so can't you just use that
to send a branch that is known to work and that has the right dependencies
included?

	Arnd
