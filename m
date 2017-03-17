From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v4 14/36] [media] v4l2-mc: add a function to inherit
 controls from a pipeline
Date: Fri, 17 Mar 2017 14:51:10 +0100
Message-ID: <1489758670.2905.52.camel@pengutronix.de>
References: <20170310130733.GU21222@n2100.armlinux.org.uk>
         <c679f755-52a6-3c6f-3d65-277db46676cc@xs4all.nl>
         <20170310140124.GV21222@n2100.armlinux.org.uk>
         <cc8900b0-c091-b14b-96f4-01f8fa72431c@xs4all.nl>
         <20170310125342.7f047acf@vento.lan>
         <20170310223714.GI3220@valkosipuli.retiisi.org.uk>
         <20170311082549.576531d0@vento.lan>
         <20170313124621.GA10701@valkosipuli.retiisi.org.uk>
         <20170314004533.3b3cd44b@vento.lan>
         <e0a6c60b-1735-de0b-21f4-d8c3f4b3f10f@xs4all.nl>
         <20170317114203.GZ21222@n2100.armlinux.org.uk>
         <44161453-02f9-0019-3868-7501967a6a82@linux.intel.com>
         <20170317102410.18c966ae@vento.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170317102410.18c966ae-ch4gOOMV7nf/PtFMR13I2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2017-03-17 at 10:24 -0300, Mauro Carvalho Chehab wrote:
[...]
> The big question, waiting for an answer on the last 8 years is
> who would do that? Such person would need to have several different
> hardware from different vendors, in order to ensure that it has
> a generic solution.
> 
> It is a way more feasible that the Kernel developers that already 
> have a certain hardware on their hands to add support inside the
> driver to forward the controls through the pipeline and to setup
> a "default" pipeline that would cover the common use cases at
> driver's probe.

Actually, would setting pipeline via libv4l2 plugin and letting drivers
provide a sane enabled default pipeline configuration be mutually
exclusive? Not sure about the control forwarding, but at least a simple
link setup and format forwarding would also be possible in the kernel
without hindering userspace from doing it themselves later.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
