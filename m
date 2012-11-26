From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL]: spear-for-3.8 (was earlier: Re: [PATCH 00/14] ARM:
 SPEAr: DT updates)
Date: Mon, 26 Nov 2012 12:20:21 +0000
Message-ID: <201211261220.21648.arnd@arndb.de>
References: <CAKohpokP60SXv02r8kETRLSf+RviFB8bgpO-VNvTfetQG4AtOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAKohpokP60SXv02r8kETRLSf+RviFB8bgpO-VNvTfetQG4AtOA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On Monday 26 November 2012, Viresh Kumar wrote:
> On 22 November 2012 01:54, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> 
> > We're also running out of time for 3.8 staging, but if you're able to
> > figure out the above I'll make an attempt to apply the patches from above.
> 
> Hi Arnd/Olof,
> 
> To make things easy for you, i have a PULL request for you now :)
> 
> The following changes since commit 53d74fd79db19aae506de892273198b160c2ee95:
> 
>   Merge commit 'gpio-lw/devel' into spear-for-3.8 (2012-11-26 15:48:53 +0530)
> 
> are available in the git repository at:
> 
> 
>   git://git.linaro.org/people/vireshk/linux.git spear-for-3.8
> 
> for you to fetch changes up to df1590d9ae5e37e07e7cf91107e4c2c946ce8bf4:
> 
>   ARM: SPEAr3xx: Shirq: Move shirq controller out of plat/ (2012-11-26
> 16:55:33 +0530)

Since Olof has done more than his share of the work for today, I've pulled
it in now, into next/dt2 rather than next/dt because of the dependencies.

We already had the gpio dependency in arm-soc, but the pinctrl dependency
is slightly newer than the one we had, so I added a second
depends/pinctrl-devel2 branch based on 4ddb1c2.

	Arnd
