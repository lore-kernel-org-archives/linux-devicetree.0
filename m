From: Sylwester Nawrocki <snjw23-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Handling device shared SFR on dt platform
Date: Wed, 04 Apr 2012 22:35:50 +0200
Message-ID: <4F7CB0A6.7010809@gmail.com>
References: <4F6A5853.9090809@gmail.com>
 <20120324193200.822AD3E0B06@localhost> <4F736A4A.6050302@gmail.com>
 <20120403160454.BDFF23E0598@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120403160454.BDFF23E0598@localhost>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/03/2012 06:04 PM, Grant Likely wrote:
>> What concerns me, is an overhead from region request/ioremap(?)/release, 
>> just to access a single 32-bit register. I'm going to see if those accesses
>> could be moved to only device driver's probe() and remove() callbacks and 
>> what might be the resulting power consumption increase from that, if any.
> 
> Personally, I'd just create a shared function used by both drivers to
> access the register and protect it with a spinlock.  That way the
> region only needs to be mapped once, and the overhead is as low as
> possible.

Hmm, that's what I originally started with. I've just removed function 
callback from the platform data struct in favour of having the drivers 
using directly the function exported by plat-s5p. Then I started devising
something alternative, in hope to get rid of the drivers compilation 
dependency on PLAT_S5P. There seems little point in that though, since 
the chance to have those IP blocks available on other archs or ARM sub-archs,
than Samsung S5P/Exynos, are extremely low. 

I'll post finally some patches for review. Thank you.

---
Regards,
Sylwester
