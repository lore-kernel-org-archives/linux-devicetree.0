From: "Koul, Vinod" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dmaengine: at_hdmac: add device tree probe
Date: Tue, 23 Aug 2011 10:25:38 +0530
Message-ID: <1314075338.22120.3.camel@vkoul-udesk3>
References: <1312549120-22266-1-git-send-email-nicolas.ferre@atmel.com>
	<20110807040932.GF7667@ponder.secretlab.ca>
	<4E4A9BD8.1040302@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4E4A9BD8.1040302-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2011-08-16 at 18:33 +0200, Nicolas Ferre wrote:
> [..]
> 
> Grant, Vinod,
> 
> Don't you think it would make sense to generalize nr-channels and maybe
> also the capabilities properties for other dmaengine drivers?
> I have seen other dmaengine drivers taking the number of channels from
> platform data so that would make sense.
> It would be new dmaengine device tree properties, but on the other hand,
> I do not know if code can also be centralized for handling of those
> properties... maybe it is better to let drivers deal with them if
> required...
> 
We already having this discussion and how to change capabilities etc to
make thing more easy and transparent, See the approaches taken by Jassi
and Linus W

-- 
~Vinod
