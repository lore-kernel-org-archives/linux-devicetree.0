From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: Re: [PATCH] DT: export of_get_next_parent() for use by modules: fix
 modular V4L2
Date: Tue, 2 Apr 2013 18:42:56 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.1304021840590.31999@axis700.grange>
References: <Pine.LNX.4.64.1304021825130.31999@axis700.grange>
 <201304021630.13371.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <201304021630.13371.arnd@arndb.de>
Sender: linux-media-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: devicetree-discuss@lists.ozlabs.org, Linux Media Mailing List <linux-media@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: devicetree@vger.kernel.org

On Tue, 2 Apr 2013, Arnd Bergmann wrote:

> On Tuesday 02 April 2013, Guennadi Liakhovetski wrote:
> > Currently modular V4L2 build with enabled OF is broken dur to the
> > of_get_next_parent() function being unavailable to modules. Export it to
> > fix the build.
> > 
> > Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > Signed-off-by: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> 
> Looks good to me, but shouldn't this be EXPORT_SYMBOL_GPL?

"grep EXPORT_SYMBOL drivers/of/base.c" doesn't give a certain answer, but 
it seems to fit other of_get_* functions pretty well:

 EXPORT_SYMBOL(of_get_parent);
+EXPORT_SYMBOL(of_get_next_parent);
 EXPORT_SYMBOL(of_get_next_child);
 EXPORT_SYMBOL(of_get_next_available_child);
 EXPORT_SYMBOL(of_get_child_by_name);

Thanks
Guennadi
---
Guennadi Liakhovetski, Ph.D.
Freelance Open-Source Software Developer
http://www.open-technology.de/
