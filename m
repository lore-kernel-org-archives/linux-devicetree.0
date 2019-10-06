From: Ulrich Hecht <uli-qwV78thtvt0@public.gmane.org>
Subject: Re: [PATCH v19 0/2] PS8640 MIPI-to-eDP bridge
Date: Sun, 6 Oct 2019 14:32:52 +0200 (CEST)
Message-ID: <218822936.516770.1570365172065@webmail.strato.com>
References: <1570216148-22802-1-git-send-email-uli@fpond.eu>
 <4df984a5-a917-753e-5870-7453f3d5438e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <4df984a5-a917-753e-5870-7453f3d5438e-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, stonea168-9Onoh4P/yGk@public.gmane.org, ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org


> On October 5, 2019 at 1:16 PM Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
> 
> Hi Uli,
> 
> On 04/10/2019 21:09, Ulrich Hecht wrote:
> > Hi!
> > 
> > This driver seems to have fallen by the wayside because, while otherwise
> > fine, it has a firmware update feature that requires a blob that is not in
> > the linux-firmware repo.[1]
> > 
> > Whatever the cause for that may be, the update code is entirely optional
> > (my chip works fine with whatever firmware is currently installed), so I
> > have removed it in order to get this merged after all. I have also
> > followed various trivial API changes that have piled up since 2016; see
> > the individual patches for details.
> > 
> > I'm using this driver on an Acer Chromebook R13 ("Elm"); see
> > https://github.com/uli/kernel/tree/elm-working-5.4.
> > 
> 
> Thanks for your effort to get things upstream.
> I just tried your branch on my R13. I had to do a trivial config change I had to
> do, as I don't have and care about the bluetooth FW right now.

Thank you for testing!

> But after that my screen keeps black. I was able to build and boot
> elm-working-5.3 and elm-working-5.2.
> 
> Unfortunatley I don't have a serial console on the Chromebook, so it's difficult
> to find out where it hangs. Can you please double check if your new
> elm-working-5.4 actually really works?

No, it doesn't. :( It seems I forgot to run mkimage/vbutil_kernel when testing...
I have pushed a fix to the elm-working-5.4 tree, and I will send a v20 tomorrow. Sorry for the inconvenience.

CU
Uli
