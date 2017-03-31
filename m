From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [RFC PATCH 2/5] soc/fsl/qbman: Use shared-dma-pool for QMan private memory allocations
Date: Fri, 31 Mar 2017 14:27:51 +1100
Message-ID: <871ste5dmw.fsf@concordia.ellerman.id.au>
References: <1490822037-6752-1-git-send-email-roy.pledge@nxp.com> <1490822037-6752-3-git-send-email-roy.pledge@nxp.com> <b1cd8d44-8c74-ab50-5dc9-1f978cae5bdf@arm.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b1cd8d44-8c74-ab50-5dc9-1f978cae5bdf-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, roy.pledge-3arQi8VN3Tc@public.gmane.org, oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: madalin.bucur-3arQi8VN3Tc@public.gmane.org
List-Id: devicetree@vger.kernel.org

Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org> writes:

> Hi Roy,
>
> On 29/03/17 22:13, Roy Pledge wrote:
>> Use the shared-memory-pool mechanism for frame queue descriptor and
>> packed frame descriptor record area allocations.
>
> Thanks for persevering with this - in my opinion it's now looking like
> it was worth the effort :)
>
> AFAICS the ioremap_wc() that this leads to does appear to give back
> something non-cacheable on PPC (assuming "pgprot_noncached_wc" isn't
> horrendously misnamed), and "no-map" should rule out any cacheable
> linear map alias existing, so it would seem that this approach should
> avert Scott's concerns about attribute mismatches.

How does 'no-map' translate into something being excluded from the
linear mapping?

cheers
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
