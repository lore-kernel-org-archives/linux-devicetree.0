From: AKASHI Takahiro <takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v23 9/9] Documentation: dt: chosen properties for arm64
 kdump
Date: Thu, 4 Aug 2016 14:10:11 +0900
Message-ID: <20160804051010.GK7995@linaro.org>
References: <20160726075659.2290-1-takahiro.akashi@linaro.org>
 <20160726080206.2441-1-takahiro.akashi@linaro.org>
 <20160727150933.GA25732@rob-hp-laptop>
 <20160728075511.GA7995@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kexec-bounces+glkk-kexec=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160728075511.GA7995-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kexec>,
 <mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kexec/>
List-Post: <mailto:kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kexec>,
 <mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "kexec" <kexec-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: kexec-bounces+glkk-kexec=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, james.morse-5wv7dgnIgG8@public.gmane.org, geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, bauerman-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Rob,

On Thu, Jul 28, 2016 at 04:55:11PM +0900, AKASHI Takahiro wrote:
> Rob,
> 
> On Wed, Jul 27, 2016 at 10:09:33AM -0500, Rob Herring wrote:
> > On Tue, Jul 26, 2016 at 05:02:06PM +0900, AKASHI Takahiro wrote:
> > > From: James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>
> > > 
> > > Add documentation for
> > > 	linux,crashkernel-base and crashkernel-size,
> > > 	linux,usable-memory-range, and
> > > 	linux,elfcorehdr
> > > used by arm64 kexec/kdump to decribe the kdump reserved area, and
> > > the elfcorehdr's location within it.
> > > 
> > > Signed-off-by: James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>
> > > [takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org:
> > >     renamed "usable-memory" to "usable-memory-range",
> > >     added "linux,crashkernel-base" and "-size" ]
> > > Signed-off-by: AKASHI Takahiro <takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > ---
> > >  Documentation/devicetree/bindings/chosen.txt | 45 ++++++++++++++++++++++++++++
> > >  1 file changed, 45 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
> > > index 6ae9d82..d7a3a86 100644
> > > --- a/Documentation/devicetree/bindings/chosen.txt
> > > +++ b/Documentation/devicetree/bindings/chosen.txt
> > > @@ -52,3 +52,48 @@ This property is set (currently only on PowerPC, and only needed on
> > >  book3e) by some versions of kexec-tools to tell the new kernel that it
> > >  is being booted by kexec, as the booting environment may differ (e.g.
> > >  a different secondary CPU release mechanism)
> > > +
> > > +linux,crashkernel-base
> > > +linux,crashkernel-size
> > > +----------------------
> > > +These properties are set (on PowerPC and arm64) during kdump to tell
> > > +use-space tools, like kexec-tools, the base address of the crash-dump
> > 
> > s/use/user/
> >
> > Ideally, userspace should not care whether this comes from DT, kernel 
> > command-line or somewhere else and should be exposed in some source 
> > independent way. However, that's not really the problem for the binding.
> 
> Yeah, I will remove "user-space"-related description as Mark also
> commented before.
> 
> > > +kernel's reserved area of memory and the size. e.g.
> > > +
> > > +/ {
> > > +	chosen {
> > > +		linux,crashkernel-base = <0x9 0xf0000000>;
> > > +		linux,crashkernel-size = <0x0 0x10000000>;
> > > +	};
> > > +};
> > > +
> > > +linux,usable-memory-range
> > > +-------------------------
> > > +
> > > +This property is set (currently only on arm64) during kdump to tell
> > > +the crash-dump kernel the base address of its reserved area of memory,
> > > +and the size. e.g.
> > > +
> > > +/ {
> > > +	chosen {
> > > +		linux,usable-memory-range = <0x9 0xf0000000 0x0 0x10000000>;
> > 
> > This is the same range as linux,crashkernel-*, but used by the 2nd 
> > kernel? Why not just update the memory node or use command line mem= 
> > parameter?
> 
> Please see:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2016-July/443225.html
> 
> There was also a discussion that simply appending "mem=", or more generally
> any parameter, to a command line might break some assumption of order of
> parameters in the future.
> So adding a DT property would be a better way.

Do you have any other comments about those properties?

-Takahiro AKASHI

> Thanks,
> -Takahiro AKASHI
> 
> > Why has PPC not need this and ARM does? 
> > 
> > > +	};
> > > +};
> > > +
> > > +Please note that, if this property is present, any memory regions under
> > > +"memory" nodes will be ignored.
> > > +
> > > +linux,elfcorehdr
> > > +----------------
> > > +
> > > +This property is set (currently only on arm64) during kdump to tell
> > > +the crash-dump kernel the address and size of the elfcorehdr that describes
> > > +the old kernel's memory as an elf file. This memory must reside within
> > > +the area described by 'linux,usable-memory-range'. e.g.
> > > +
> > > +/ {
> > > +	chosen {
> > > +		linux,usable-memory = <0x9 0xf0000000 0x0 0x10000000>;
> > > +		linux,elfcorehdr = <0x9 0xfffff000 0x0 0x800>;
> > > +	};
> > > +};
> > > -- 
> > > 2.9.0
> > > 
