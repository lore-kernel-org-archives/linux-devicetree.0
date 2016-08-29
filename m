From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [Patch v4 9/9] arm64: Update device tree for Layerscape SoCs
Date: Mon, 29 Aug 2016 16:33:50 +0800
Message-ID: <20160829083350.GL30790@tiger>
References: <1470780000-16750-1-git-send-email-york.sun@nxp.com>
 <20160812091354.GB333@nazgul.tnic>
 <20160829063448.GA32489@tiger>
 <20160829080530.GA25468@nazgul.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160829080530.GA25468-K5JNixvcfoxupOikMc4+xw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Cc: York Sun <york.sun-3arQi8VN3Tc@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, yangbo lu <yangbo.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Liu Gang <Gang.Liu-3arQi8VN3Tc@public.gmane.org>, morbidrsa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, stuart.yoder-3arQi8VN3Tc@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rajesh Bhagat <rajesh.bhagat-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Mingkai Hu <Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Li Yang <leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Yuan Yao <yao.yuan-3arQi8VN3Tc@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 29, 2016 at 10:05:30AM +0200, Borislav Petkov wrote:
> On Mon, Aug 29, 2016 at 02:34:48PM +0800, Shawn Guo wrote:
> > Is it mandatory to have DTS changes go with driver part altogether?
> 
> Yes, because the EDAC driver needs them to even load properly.

When separate branches get merged on Linus tree, it works anyway.

> 
> > Otherwise, I prefer to have them go through separate tree.
> 
> Any particular reason why you prefer that?

To avoid potential merge conflicts.  Unless there are hard dependencies
like making it compile, avoiding regression or maintaining bisect,
patches should go through their established subsystem/architecture tree.

> We've been doing this for other ARM EDAC drivers already and there were
> no issues whatsoever.

Luckily.  If there are many patches on architecture DT branch changing
the same file, when driver branch and DT branch merges in upstream
branch, there will likely be merge conflicts.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
