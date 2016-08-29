From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [Patch v4 9/9] arm64: Update device tree for Layerscape SoCs
Date: Mon, 29 Aug 2016 23:10:57 +0800
Message-ID: <20160829151057.GY30790@tiger>
References: <1470780000-16750-1-git-send-email-york.sun@nxp.com>
 <20160812091354.GB333@nazgul.tnic>
 <20160829063448.GA32489@tiger>
 <20160829080530.GA25468@nazgul.tnic>
 <20160829083350.GL30790@tiger>
 <20160829135130.GB28806@nazgul.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160829135130.GB28806-K5JNixvcfoxupOikMc4+xw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Cc: York Sun <york.sun-3arQi8VN3Tc@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, yangbo lu <yangbo.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Liu Gang <Gang.Liu-3arQi8VN3Tc@public.gmane.org>, morbidrsa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, stuart.yoder-3arQi8VN3Tc@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rajesh Bhagat <rajesh.bhagat-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Mingkai Hu <Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Li Yang <leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Yuan Yao <yao.yuan-3arQi8VN3Tc@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 29, 2016 at 03:51:30PM +0200, Borislav Petkov wrote:
> On Mon, Aug 29, 2016 at 04:33:50PM +0800, Shawn Guo wrote:
> > To avoid potential merge conflicts. 
> 
> Haven't heard of any so far. And I don't see how adding 1 or 2 DT
> entries more per driver is a serious merge conflict.

Yeah, the conflict might be just easy to resolve.  But it's still
annoying when upstream maintainer runs into it often.  Why don't we
avoid it to ease upstream maintainer's life when it's possible?

> 
> > Unless there are hard dependencies like making it compile, avoiding
> > regression or maintaining bisect, patches should go through their
> > established subsystem/architecture tree.
> 
> Well, doh, the driver simply doesn't work. How are people even supposed
> to test the EDAC tree?

People are not supposed to test EDAC tree in this case. linux-next tree
is born for that.

> Why is it even such a big deal if it is acked by the proper maintainers?
> Cross-tree maintainer acking happens all the time. So don't tell me the
> merge conflicts are your big issue with this.

It's not a big deal, and it happens all the time.  But we shouldn't
consider it as a recommended work flow.

> > Luckily.  If there are many patches on architecture DT branch changing
> > the same file, when driver branch and DT branch merges in upstream
> > branch, there will likely be merge conflicts.
> 
> So? There are tools to resolve those. And again, the DT changes for
> EDAC are basically adding blocks so resolving those conflicts should be
> trivial most of the time.

And again, I do not understand why we do so when there is a work flow to
avoid this.

> 
> So no, I don't consider the potential merge conflicts an issue here.

But I do.

If you really like to apply the DTS patch through EDAC tree, go ahead.
But I'm not going to ACK it, because I have an opinion that this merge
path is not really necessary.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
