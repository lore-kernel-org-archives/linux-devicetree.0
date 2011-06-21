From: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: zImage: allow supplementing appended DTB with
	traditional ATAG data
Date: Tue, 21 Jun 2011 19:35:45 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.1106211931560.2142@xanadu.home>
References: <1308632955-11070-1-git-send-email-nico@fluxnic.net>
	<1308632955-11070-5-git-send-email-nico@fluxnic.net>
	<8yaliwueqr4.fsf@huya.qualcomm.com> <8ya7h8edbhc.fsf@huya.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <8ya7h8edbhc.fsf-AOX6H5vLt3Uj8izMo0bVsAC/G2K4zDHf@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 21 Jun 2011, David Brown wrote:

> On Tue, Jun 21 2011, David Brown wrote:
> 
> > On Mon, Jun 20 2011, Nicolas Pitre wrote:
> >
> >> +void *memmove(void *__dest, __const void *__src, size_t __n)
> >> +{
> >> +	unsigned char *d = __dest;
> >> +	const unsigned char *s = __src;
> >> +
> >> +	if (__dest == __src)
> >> +		return __dest;
> >> +
> >> +	if (__dest < __src)
> >> +		return memcpy(__dest, __src, __n);
> >> +
> >> +	while (--__n >= 0)
> >> +		d[__n] = s[__n];
> >> +
> >> +	return __dest;
> >> +}
> >
> > Ahh, found it.  size_t is unsigned, so the while loop never terminates.
> > Something like:
> >
> > 	for (; __n; __n--)
> > 		d[__n] = s[__n];
> 
> Ugh.  How about if I don't replace a broken version with a different
> broken version.

Blah.  I'll try to fetch the generic version in lib/string.c instead of 
duplicating that stuff.

Thanks for investigating.  I only was able to compile-test the thing so 
far.  ;-)


Nicolas
