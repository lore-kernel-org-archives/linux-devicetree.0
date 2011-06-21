From: Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: zImage: allow supplementing appended DTB with
	traditional ATAG data
Date: Tue, 21 Jun 2011 17:22:40 -0600
Message-ID: <4ED56748-F76F-4A42-AFC2-76CF2099F1CA@bsdimp.com>
References: <1308632955-11070-1-git-send-email-nico@fluxnic.net>
	<1308632955-11070-5-git-send-email-nico@fluxnic.net>
	<8yaliwueqr4.fsf@huya.qualcomm.com>
	<8ya7h8edbhc.fsf@huya.qualcomm.com>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <8ya7h8edbhc.fsf-AOX6H5vLt3Uj8izMo0bVsAC/G2K4zDHf@public.gmane.org>
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


On Jun 21, 2011, at 5:13 PM, David Brown wrote:

> On Tue, Jun 21 2011, David Brown wrote:
> 
>> On Mon, Jun 20 2011, Nicolas Pitre wrote:
>> 
>>> +void *memmove(void *__dest, __const void *__src, size_t __n)
>>> +{
>>> +	unsigned char *d = __dest;
>>> +	const unsigned char *s = __src;
>>> +
>>> +	if (__dest == __src)
>>> +		return __dest;
>>> +
>>> +	if (__dest < __src)
>>> +		return memcpy(__dest, __src, __n);
>>> +
>>> +	while (--__n >= 0)
>>> +		d[__n] = s[__n];
>>> +
>>> +	return __dest;
>>> +}
>> 
>> Ahh, found it.  size_t is unsigned, so the while loop never terminates.
>> Something like:
>> 
>> 	for (; __n; __n--)
>> 		d[__n] = s[__n];
> 
> Ugh.  How about if I don't replace a broken version with a different
> broken version.
> 
> 	while (__n) {
> 		__n--;
>                d[__n] = s[__n];
> 	}
> 
> Now, I don't need any extra fields in my DTB, and it correctly inserts
> the ATAG values.


while (__n--)
	d[__n] = s[__n];

does the same thing, and is more readable (and does the same thing as the original while())

Warner
