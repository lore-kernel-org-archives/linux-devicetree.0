From: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH] ARM: SPEAr600: Add device-tree support to SPEAr600 boards
Date: Thu, 15 Mar 2012 14:30:27 +0530
Message-ID: <4F61AFAB.6080301@st.com>
References: <1331650032-15274-1-git-send-email-sr@denx.de>
 <4F604321.9000204@st.com> <201203150948.27918.sr@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201203150948.27918.sr-ynQEQJNshbs@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Cc: "devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org" <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 3/15/2012 2:18 PM, Stefan Roese wrote:
>>> > > +static const struct of_device_id vic_of_match[] __initconst = {
>>> > > +	{ .compatible = "arm,pl190-vic", .data = vic_of_init, },
>>> > > +	{ /* Sentinel */ }
>>> > > +};
>>> > > +
>>> > > +static void __init spear6xx_dt_init_irq(void)
>>> > > +{
>>> > > +	of_irq_init(vic_of_match);
>>> > > +}
>>> > > +
>> > 
>> > What about adding this routine in vic.c file, which can then be used
>> > by all platforms, instead of replicating this code.
> We can't move vic_of_match to the vic.c, since there are differences between 
> the boards using it. And only moving spear6xx_dt_init_irq() (renamed of 
> course) doesn't seem worth it.

I knew this. Actually my thought was, we have two compatible strings for vic:
pl190 and pl192.

So, create two vic_of_match* arrays and two vic*_dt_init_irq() routines.
That will solve the issue i believe.

-- 
viresh
