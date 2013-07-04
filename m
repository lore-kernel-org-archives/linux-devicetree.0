From: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Subject: Re: Appended DTB files for multi-machine kernels
Date: Thu, 04 Jul 2013 14:27:41 -0400 (EDT)
Message-ID: <alpine.LFD.2.03.1307041419070.18597@syhkavp.arg>
References: <51D5A938.30607@gmail.com>
 <alpine.LFD.2.03.1307041322070.18597@syhkavp.arg> <51D5B7A1.60609@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <51D5B7A1.60609-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Sven Neumann <s.neumann-5g8ninUHluJWk0Htik3J/w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 4 Jul 2013, Daniel Mack wrote:

> Hi Nicolas,
> 
> On 04.07.2013 19:28, Nicolas Pitre wrote:
> > On Thu, 4 Jul 2013, Daniel Mack wrote:
> >> I'm open to opinion and sugesstions :)
> > 
> > What you describe above more or less fits the definition of what I 
> > called the "impedance matcher".  However it doesn't need to be part of 
> > the kernel at all.  But you should make it into a separate binary.
> > 
> > Please have a look at the bottom of this post for a more comprehensive 
> > description: http://article.gmane.org/gmane.linux.ports.arm.kernel/242929
> 
> Thanks for the link. Interesting read indeed.
> 
> The only thing I'm pondering about is that we already have generic
> loader code in Linux and a build system that supports a wide range of
> platforms. I don't know whether it's worth opening that can of worms
> again and re-implement all details about load addresses, compiler flags,
> device-tree parsing code yet once again. At least in terms of LOCs, we
> would certainly be better off doing it inside the kernel.

That is still code with relatively low value that has to be carried and 
maintained.

And if you do it for your own device outside of the kernel then you can 
literally hack it the way you want quickly and forget about it once it 
works.  Since this is useful for legacy setups only, you do not have to 
care about maintaining it in the future.

> But I generally second your opinion about pushing vendors to do it
> right, so I might give that approach a shot soon; there is no code yet
> anywhere I take it?

Not that I'm aware of, besides parts of libfdt and atags_to_fdt.c from 
the kernel tree that can be lifted and modified according to your needs.  
I don't imagine you'd need much more than that anyway.


Nicolas
