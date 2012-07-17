From: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH V2 0/2] video: drm: Add Device tree support to DRM-FIMD
Date: Tue, 17 Jul 2012 09:58:47 +0530
Message-ID: <CAL1wa8eUNNb+pCG8tZwzEQKBb9YM9GOJseRJspnm_fnpikAHiA@mail.gmail.com>
References: <1341996287-14666-1-git-send-email-l.krishna@samsung.com>
 <CAAQKjZN0tE=Kfeco434JO3ynkap5d-W6et6VoZjD=eR3USGHGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAAQKjZN0tE=Kfeco434JO3ynkap5d-W6et6VoZjD=eR3USGHGw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: InKi Dae <daeinki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 17, 2012 at 9:49 AM, InKi Dae <daeinki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> 2012/7/11, Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>:
> > This patch set adds device tree support for DRM-FIMD for Samsung's
> > Exynos5250.
> > It includes parsing platform data from dts file.
> >
> > This patchset is based and tested on top of v3.5-rc6
> >
> > Changes since V1:
> >       - Corrected typo errors and changed compatibility string
> >
> > Leela Krishna Amudala (1):
> >   video: drm: exynos: Add device tree support
> >
> > Prathyush K (1):
> >   drm/exynos: Modifying exynos drm fimd to support exynos5
> >
> >  Documentation/devicetree/bindings/fb/drm-fimd.txt |   73
> > +++++++++++++++
> >  drivers/gpu/drm/exynos/exynos_drm_fimd.c          |  101
> > ++++++++++++++++++++-
> >  2 files changed, 171 insertions(+), 3 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/fb/drm-fimd.txt
> >
>
> I'm sorry for being late. I was so busy. your patch set should be
> tested on our target(based on exynos5) and then it will be reviewed
> and merged to exynos-drm-next soon if there is no any problem.
>
> Thanks,
> Inki Dae
>
>

I have tested this patchset over smdk5250 board and seen the boot logo also.

Thanks,
Leela Krishna Amudala

> > _______________________________________________
> > dri-devel mailing list
> > dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > http://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
