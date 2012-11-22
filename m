From: =?ks_c_5601-1987?B?sei6wLHU?= <bongkyu.kim-Hm3cg6mZ9cc@public.gmane.org>
Subject: RE: [PATCH] of/i2c: support more interrupt specifiers
Date: Thu, 22 Nov 2012 14:50:28 +0900
Message-ID: <002b01cdc875$470e22d0$d52a6870$@lge.com>
References: <1353488322-14764-1-git-send-email-bongkyu.kim@lge.com>
 <50ACD9F2.40207@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50ACD9F2.40207-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: ko
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
To: 'Rob Herring' <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/21/2012 10:41 PM, Rob Herring wrote:

> On 11/21/2012 02:58 AM, Bongkyu Kim wrote:
> > This patch supports more interrupt specifiers for i2c client.
> 
> Why?
> 

If we are registering a device has 2 interrupts like the below,
	i2c@f9968000 {
		lsm330_acc@1D {
			compatible = "ST,lsm330_acc",
			interrupts = <73 0x2 65 0x2>, /* #interrupt-cells =
<2> */
		};
	};

we can't use second irq(65) in a driver because of mapping first interrupt
only.
If second irq(65) is mapped, we can use by gpio_to_irq() function at a
driver.
So, I think that all interrupt specifiers should be parsed and mapped
if DT's interrupts property is allowed several interrupt specifiers.

> > Signed-off-by: Bongkyu Kim <bongkyu.kim-Hm3cg6mZ9cc@public.gmane.org>
> > ---
> >  drivers/of/of_i2c.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/of/of_i2c.c b/drivers/of/of_i2c.c
> > index 3550f3b..c6d9b7e 100644
> > --- a/drivers/of/of_i2c.c
> > +++ b/drivers/of/of_i2c.c
> > @@ -34,6 +34,7 @@ void of_i2c_register_devices(struct i2c_adapter
> *adap)
> >  		struct dev_archdata dev_ad = {};
> >  		const __be32 *addr;
> >  		int len;
> > +		int nr = 0;
> >
> >  		dev_dbg(&adap->dev, "of_i2c: register %s\n", node-
> >full_name);
> >
> > @@ -57,7 +58,9 @@ void of_i2c_register_devices(struct i2c_adapter
> *adap)
> >  			continue;
> >  		}
> >
> > -		info.irq = irq_of_parse_and_map(node, 0);
> > +		info.irq = irq_of_parse_and_map(node, nr++);
> > +		while (irq_of_parse_and_map(node, nr))
> > +			nr++;
> 
> What's the point if you are just discarding the interrupt number? If
> this is needed, then shouldn't you fix i2c_board_info first?
> 
> Rob
> 

It is better that i2c_board_info will be fixed.
But, if it will be fixed, all i2c client drivers should be changed.
I think there're so many i2c drivers currently.
In my opinion, do not assign to i2c_board_info and just map for all
interrupts is the better.

Thanks,
Bongkyu.

> >  		info.of_node = of_node_get(node);
> >  		info.archdata = &dev_ad;
> >
> >
