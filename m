From: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 4/4] arm64: cputype info for Broadcom Vulcan
Date: Wed, 17 Feb 2016 17:26:00 +0000
Message-ID: <20160217172600.GA26514@e104818-lin.cambridge.arm.com>
References: <1455389195-31870-1-git-send-email-jchandra@broadcom.com>
 <1455389195-31870-5-git-send-email-jchandra@broadcom.com>
 <20160215101235.GA1748@arm.com>
 <56C3C9D4.4020506@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56C3C9D4.4020506-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 16, 2016 at 05:16:04PM -0800, Florian Fainelli wrote:
> On 15/02/16 02:12, Will Deacon wrote:
> > On Sun, Feb 14, 2016 at 12:16:35AM +0530, Jayachandran C wrote:
> >> Add Broadcom Vulcan implementor ID and part ID in cputype.h. This is
> >> to document the values.
> >>
> >> Signed-off-by: Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> >> ---
> >>  arch/arm64/include/asm/cputype.h | 2 ++
> >>  1 file changed, 2 insertions(+)
> > 
> > Acked-by: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
> 
> Would this be picked by Calatin, or should this be sent along with the
> ARM/ARM64 SoC changes pull requests (just wondering?), thanks!

It can go via the arm-soc tree together with the other patches. If you
need another ack:

Acked-by: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
