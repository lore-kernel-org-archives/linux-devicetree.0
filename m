From: Mike Turquette <mturquette-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 0/1] clk: add DT fixed-factor-clock binding support
Date: Thu, 06 Sep 2012 17:08:19 -0700
Message-ID: <20120907000819.20289.87301@nucleus>
References: <1346194382-11405-1-git-send-email-gregory.clement@free-electrons.com>
 <5048CC37.6060509@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5048CC37.6060509-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Quoting Rob Herring (2012-09-06 09:15:51)
> On 08/28/2012 05:53 PM, Gregory CLEMENT wrote:
> > Hi,
> > 
> > During the port of the clock common framework for the armada 370/XP, I
> > need to get "fixed-factor-clock" using the device tree. For this need
> > I add support DT for "fixed-factor-clock" in the same way that the
> > existing support for "fixed-rate-clock". It turned out that finally I
> > didn't need it anymore, but as the code was written and tested, here
> > it is.
> > 
> 
> It looks fine to me, but I'd like to see a user of it.
> 

Agreed.  I'll hold off on merging it until someone else depends on it.

Thanks for submitting this Gregory.

Regards,
Mike

> Rob
