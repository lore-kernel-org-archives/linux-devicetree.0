From: Dong Aisheng <aisheng.dong-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 2/5] dma: mxs-dma: make platform_device_id more generic
Date: Mon, 7 May 2012 11:55:59 +0800
Message-ID: <20120507035558.GB31245@shlinux2.ap.freescale.net>
References: <1336133539-13465-1-git-send-email-b29396@freescale.com>
 <201205051512.17972.marex@denx.de>
 <CAAQ0ZWTztNaqwjVA257N+42PByhH1k1Gswi18S9G=dHEaO5PhQ@mail.gmail.com>
 <201205051632.14882.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201205051632.14882.marex-ynQEQJNshbs@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: "vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Huang Shijie-B32955 <B32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, May 05, 2012 at 10:32:14PM +0800, Marek Vasut wrote:
> Dear Shawn Guo,
> 
> > On 5 May 2012 21:12, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org> wrote:
> > > Can't the patches be reordered then to avoid adding this altogether?
> > 
> > Maybe.  But I do not think it's really worth the effort.
> > 
> > > You don't have to add dead code in this patch and re-add it when needed.
> > > Or fix the macro to take the parameter then, though I don't understand
> > > why you'd want to take it and then hide it.
> > 
> > I do not completely understand the comment.  My point is the problem
> > is in the existing code.  It's not introduced by Dong's patch.  The
> > problem should be fixed in another patch, and we do not want to do
> > several things in one patch.
> 
> Then order such a patch before Dong's series then? It'd all be clear, without 
> compromises.
> 
Hmm, although not a big issue, but i can re-oder it to make most people happy with
the patch.

Thanks

Regards
Dong Aisheng
