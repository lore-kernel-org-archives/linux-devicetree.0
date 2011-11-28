From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/4] Versatile Express DT support
Date: Mon, 28 Nov 2011 09:39:23 -0600
Message-ID: <4ED3AB2B.7090003@gmail.com>
References: <1322060508-11298-1-git-send-email-pawel.moll@arm.com>
 <4ED399C8.9080908@gmail.com>
 <1322493617.3164.56.camel@hornet.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1322493617.3164.56.camel-okZbbLrgpR/YkXV2EHHjLW3o5bpOHsLO@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/28/2011 09:20 AM, Pawel Moll wrote:
> On Mon, 2011-11-28 at 14:25 +0000, Rob Herring wrote:
>> Other than Dave's comments, looks good. For the series:
>>
>> Acked-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> 
> Thanks!
> 
>> There are a number of compatible strings for various peripherals defined
>> without documentation, but you're not really using them so I think it's
>> fine for now. BTW, I believe Dave said he was going to document some of
>> the primecell peripherals. :)
> 
> Yep, we agreed with Dave that the ones I'll take care of soon are MMCI
> (PL180) and the VE sysregs, the rest is his :-)
> 
> On that subject - some time ago I sent a patch adding "sil" vendor
> string, as this one the only non-documented one I used:
> 
> http://article.gmane.org/gmane.linux.drivers.devicetree/9362/

Okay. I'll apply.

But that's just a vendor. There's still binding docs needed for the
actual sil9022 device and some others.

Rob
