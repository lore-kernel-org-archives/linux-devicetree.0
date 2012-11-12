From: Mike Turquette <mturquette-l0cyMroinI0@public.gmane.org>
Subject: Re: possibility of parent clock selection through DT
Date: Mon, 12 Nov 2012 13:22:12 -0800
Message-ID: <20121112212212.20034.78522@nucleus>
References: <CAPub14-CPS48gQ1h8vvAYBpO_=egjheG_rMoZ894Y4XZ2CinUQ@mail.gmail.com>
 <CAPub148Bq=uwTuky25WzXn4yfCukJ+WacxkBvuyV5yTzGasGOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPub148Bq=uwTuky25WzXn4yfCukJ+WacxkBvuyV5yTzGasGOQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Shiraz Hashim <shiraz.linux.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Quoting Shiraz Hashim (2012-11-06 22:36:10)
> On Wed, Nov 7, 2012 at 11:42 AM, Shiraz Hashim
> <shiraz.linux.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Hi Mike, Rob,
> >
> > Devices in a SoC can have multiple possible clock sources which is
> > perfectly captured through clk framework.
> >
> > But the device itself may not be aware of the complex hierarchy above it.
> > In this case how do you suggest a board (through DT) should select its
> > preference.
> >
> > Is there some work already going on in this direction ?
> 
> Just to make it clear, I already have referred the clock DT bindings and
> Shawn Guo patch on removing clk look up registration from kernel code.
> 
> Here I am talking about possibility of selecting desired clock hierarchy
> by the boards about which device nodes are not aware.
> 

One way to achieve this is to use clk_set_rate as a way to switch
parents at run-time.  The OMAP CCF code currently does this when
relocking PLLs and makes use of __clk_reparent to update the clock
framework's representation of the hierarchy dynamically.

Maybe something like the following is helpful to you:
http://git.linaro.org/gitweb?p=people/mturquette/linux.git;a=blob;f=arch/arm/mach-omap2/dpll3xxx.c;h=f72dedb4eee892ce4cd5bdf22cc8c22510f3d526;hb=clk-omap-3.8#l542

Regards,
Mike

> -- 
> regards
> Shiraz Hashim
