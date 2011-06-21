From: David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: zImage: allow supplementing appended DTB with
	traditional ATAG data
Date: Tue, 21 Jun 2011 15:58:23 -0700
Message-ID: <8yaliwueqr4.fsf@huya.qualcomm.com>
References: <1308632955-11070-1-git-send-email-nico@fluxnic.net>
	<1308632955-11070-5-git-send-email-nico@fluxnic.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1308632955-11070-5-git-send-email-nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org> (Nicolas
	Pitre's message of "Tue, 21 Jun 2011 01:09:15 -0400")
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 20 2011, Nicolas Pitre wrote:

> +void *memmove(void *__dest, __const void *__src, size_t __n)
> +{
> +	unsigned char *d = __dest;
> +	const unsigned char *s = __src;
> +
> +	if (__dest == __src)
> +		return __dest;
> +
> +	if (__dest < __src)
> +		return memcpy(__dest, __src, __n);
> +
> +	while (--__n >= 0)
> +		d[__n] = s[__n];
> +
> +	return __dest;
> +}

Ahh, found it.  size_t is unsigned, so the while loop never terminates.
Something like:

	for (; __n; __n--)
		d[__n] = s[__n];

makes that work for me.

This allows me to not need to pad or have any of the chosen attributes.
I do need to have a memory attribute, however, and I'll see if I can
figure out what is happening there.

Fun debugging when the loop overwrites the code itself, but it keeps
working because it is in the cache.

David

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
