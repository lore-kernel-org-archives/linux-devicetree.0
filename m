From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND PATCH v2 2/4] media: dt-bindings: rockchip: Document
 RK3399 Video Decoder bindings
Date: Fri, 11 Oct 2019 12:37:57 -0500
Message-ID: <CAL_JsqJYs3RaVqeFFuMbCSJMrWY7t=S=wWWpo5syL2ONag_woA@mail.gmail.com>
References: <20191011093342.3471-1-boris.brezillon@collabora.com>
 <20191011093342.3471-3-boris.brezillon@collabora.com>
 <CAL_JsqL_6xPyb4kTDR3dbLc4Uptwox=1F4zaGjHVmahNyk25=w@mail.gmail.com>
 <20191011145625.694238b1@dhcp-172-31-174-146.wireless.concordia.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20191011145625.694238b1-RcKxWJ4Cfj07VwOnMuImuy7eAjiKCowXPIyMCRxp1+LbFSlKd4bkJ/d9D2ou9A/h@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Boris Brezillon <boris.brezillon-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jonas Karlman <jonas-uIzNG4q0ceqzQB+pC5nmwQ@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Nicolas Dufresne <nicolas-dDhyB4GVkw9AFePFGvp55w@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 11, 2019 at 7:56 AM Boris Brezillon
<boris.brezillon-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org> wrote:
>
> On Fri, 11 Oct 2019 07:50:16 -0500
> Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> > On Fri, Oct 11, 2019 at 4:33 AM Boris Brezillon
> > <boris.brezillon-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org> wrote:
> > >
> > > Document the Rockchip RK3399 Video Decoder bindings.
> >
> > You need some more headers for the example (or drop defines):
> >
> > Error: Documentation/devicetree/bindings/media/rockchip,vdec.example.dts:23.28-29
> > syntax error
> > FATAL ERROR: Unable to parse input tree
> > scripts/Makefile.lib:321: recipe for target
> > 'Documentation/devicetree/bindings/media/rockchip,vdec.example.dt.yaml'
> > failed
> > make[1]: *** [Documentation/devicetree/bindings/media/rockchip,vdec.example.dt.yaml]
> > Error 1
> > Makefile:1282: recipe for target 'dt_binding_check' failed
> > make: *** [dt_binding_check] Error 2
>
> Will fix that. BTW, I tried running make dtbs_check and faced a few
> errors on other yaml files (which is why I ended up sending the patch
> without fully validating the schema). Maybe those have been fixed (I'm
> based on the media tree which is based on 5.4-rc1).

Several fixes went into -rc2, but there's 2 fixes not in -rc2 (but are in next).

> Oh, and I also noticed that the generated example has
> #address-cells = <1>, #size-cells = <1> in the parent node, while my
> example expects <2>. Is there any way I can specify that somewhere, or
> should I just tweak the example to use 1 cell instead?

I think you can override it just adding '#address-cells = <2>;' or
tweak the example.

Rob
