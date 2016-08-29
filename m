From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [Patch v4 9/9] arm64: Update device tree for Layerscape SoCs
Date: Mon, 29 Aug 2016 14:34:48 +0800
Message-ID: <20160829063448.GA32489@tiger>
References: <1470780000-16750-1-git-send-email-york.sun@nxp.com>
 <20160812091354.GB333@nazgul.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160812091354.GB333-K5JNixvcfoxupOikMc4+xw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Cc: York Sun <york.sun-3arQi8VN3Tc@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, yangbo lu <yangbo.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Liu Gang <Gang.Liu-3arQi8VN3Tc@public.gmane.org>, morbidrsa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, stuart.yoder-3arQi8VN3Tc@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rajesh Bhagat <rajesh.bhagat-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Mingkai Hu <Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Li Yang <leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Yuan Yao <yao.yuan-3arQi8VN3Tc@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 12, 2016 at 11:13:54AM +0200, Borislav Petkov wrote:
> On Tue, Aug 09, 2016 at 02:59:39PM -0700, York Sun wrote:
> > Add DDR memory controller nodes to enable EDAC driver.
> > 
> > Signed-off-by: York Sun <york.sun-3arQi8VN3Tc@public.gmane.org>
> > 
> > ---
> > Change log
> >   v4: no change
> >   v3: no change
> >   v2: no change
> > 
> >  arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi |  7 +++++++
> >  arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi | 14 ++++++++++++++
> >  2 files changed, 21 insertions(+)
> 
> This needs an ACK from DT people.

Is it mandatory to have DTS changes go with driver part altogether?
Otherwise, I prefer to have them go through separate tree.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
