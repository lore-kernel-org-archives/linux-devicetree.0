From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Regarding hw irq to Linux irq mapping on ARM
Date: Wed, 22 Sep 2010 08:52:18 -0300
Message-ID: <6ff62ca4-128a-436f-b85a-987849804a6e@email.android.com>
References: <AANLkTi=6nCJnfLB1uc0uLGOvOm0CX_R=j-8GQWTzmmep@mail.gmail.com>
	<AANLkTimp7+BLNBwZyBiPS0JgB_mno+gp8+mK=VdOd3+_@mail.gmail.com>
	<1285106546.30449.158.camel@pasglop>
	<AANLkTik6Nwt3O9hG971nzzEtiCLobSaWasZ4hjWCketh@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTik6Nwt3O9hG971nzzEtiCLobSaWasZ4hjWCketh-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shaju Abraham <shajuabraham-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Eric Miao <eric.miao-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



"Shaju Abraham" <shajuabraham-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

>On Wed, Sep 22, 2010 at 3:32 AM, Benjamin Herrenschmidt
><benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
>> The main grief one could have with my scheme is the naming of irq_host
>> which has confused people in the past. It should probably be irq_domain
>> to make clear what it is. It generally have a 1:1 relationship to the
>> irq_chip but there are cases where that isn't the case (essentially
>> where you have multiple irq_chip per domain) for various reasons so it's
>> better to keep those separate.
>>
>
>How do we handle multiplexed interrupts ? For example a single interrupt line
>representing multple irq sources.
>We have ARM systems with  single interrupt line on a VIC  muxed to
>192 different GPIO sources (each capable of generating interrupts). For such a
>system the virq to hw irq mapping can get complex.

Assign a separate irq number to each gpio.  In effect, this makes the gpio controller an irq controller.

g.

-- 
Sent from my Android phone with K-9 Mail. Please excuse my brevity.
