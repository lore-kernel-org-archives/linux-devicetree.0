From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH v2 0/2] Add R8A7790 EtherAVB DT support
Date: Wed, 17 Jun 2015 09:39:58 +0900
Message-ID: <20150617003958.GA24889@verge.net.au>
References: <2857896.YA1bBSQVkA@wasted.cogentembedded.com>
 <20150617003757.GC2433@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150617003757.GC2433-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 17, 2015 at 09:37:57AM +0900, Simon Horman wrote:
> On Tue, Jun 16, 2015 at 02:41:07AM +0300, Sergei Shtylyov wrote:
> > Hello.
> > 
> >    Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
> > 'renesas-devel-20150610-v4.1-rc7' tag. Here we add the EtherAVB device tree
> > support for the R8A7790 SoC. The 2nd patch depends on the EtherAVB driver
> > merged into the 'net-next.git' repo recently for the bindings...
> > 
> > [1/2] ARM: shmobile: r8a7790: add EtherAVB clocks
> > [2/2] ARM: shmobile: r8a7790: add EtherAVB DT support
> 
> Thanks Sergei, I have queued these up.

Please consider submitting patches to enable the new driver
in shmobile_defconfig and multi_v7_defconfig.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
