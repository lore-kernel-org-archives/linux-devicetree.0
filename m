From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH 0/3] GIC OF bindings
Date: Tue, 20 Sep 2011 21:11:18 -1000
Message-ID: <4E798E16.6060308@firmworks.com>
References: <20110920.224910.1996429830782124690.davem@davemloft.net>
	<CACxGe6t7Mdr+w+aGFPM2-FEAQaYHuG8Za9dybLgMo-5-whLyNQ@mail.gmail.com>
	<4E796EE4.6070704@firmworks.com>
	<20110921.012158.2252182592946972727.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110921.012158.2252182592946972727.davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Cc: dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 9/20/2011 7:21 PM, David Miller wrote:
> From: Mitch Bradley<wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
> Date: Tue, 20 Sep 2011 18:58:12 -1000
>
>> interrupt-parent has been part of the interrupt mapping spec from the
>> inception of same.
>>
>> http://www.openfirmware.info/docs/rec.intmap.d09.pdf
>
> Thanks for the link.
>
> In my vast collection of Sun OF dumps, I cannot find a single instance
> where they've made use of this property, which is why I've never seen
> it before.

I can't say I'm surprised at that.  Sun hardware tends to be rather more 
hierarchical than is the norm in, for example, the PC space.  This 
particular document came into being during the CHRP era, when IBM and 
Apple were trying to glue a Macintosh legacy I/O system onto the side of 
a PC legacy I/O system.  The result was not pretty.

Sun had at least the semblance of a coherent architectural design and 
review process.
