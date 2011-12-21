From: Dong Aisheng-B29396 <B29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [RFC PATCH v3 1/5] dt: add of_get_child_count helper function
Date: Wed, 21 Dec 2011 02:56:26 +0000
Message-ID: <7FE21149F4667147B645348EC605788505C474@039-SN2MPN1-013.039d.mgd.msft.net>
References: <1324402840-32451-1-git-send-email-b29396@freescale.com>
 <1324402840-32451-2-git-send-email-b29396@freescale.com>
 <4EF0D556.3030701@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4EF0D556.3030701-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org" <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Guo Shawn-R65073 <r65073-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org" <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Rob Herring [mailto:robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
> Sent: Wednesday, December 21, 2011 2:35 AM
> To: Dong Aisheng-B29396
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org;
> linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org; s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org; Guo Shawn-R65073;
> kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org; grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org; devicetree-
> discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org; w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
> Subject: Re: [RFC PATCH v3 1/5] dt: add of_get_child_count helper function
> Importance: High
> 
> On 12/20/2011 11:40 AM, Dong Aisheng wrote:
> > From: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >
> > Currently most code to get child count in kernel are almost same, add
> > a helper to implement this function for dt to use.
> >
> > ---
> > Changes v1->v2:
> >  * change the name from of_get_child_number to of_get_child_count
> >
> > Signed-off-by: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> > Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> 
> I assume you want this to go in with the rest of the series? If not, let me know.
> 
> Acked-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> 
> Rob
>
Yes, since other patches in this series depend on this patch.
Thanks for the review.

Regards
Dong Aisheng 
> > ---
> >  include/linux/of.h |   16 ++++++++++++++++
> >  1 files changed, 16 insertions(+), 0 deletions(-)
> >
> > diff --git a/include/linux/of.h b/include/linux/of.h index
> > 4948552..d0d91a1 100644
> > --- a/include/linux/of.h
> > +++ b/include/linux/of.h
> > @@ -189,6 +189,17 @@ extern struct device_node *of_get_next_child(const struct
> device_node *node,
> >  	for (child = of_get_next_child(parent, NULL); child != NULL; \
> >  	     child = of_get_next_child(parent, child))
> >
> > +static inline int of_get_child_count(const struct device_node *np) {
> > +	struct device_node *child = NULL;
> > +	int num = 0;
> > +
> > +	while ((child = of_get_next_child(np, child)))
> > +		num++;
> > +
> > +	return num;
> > +}
> > +
> >  extern struct device_node *of_find_node_with_property(
> >  	struct device_node *from, const char *prop_name);  #define
> > for_each_node_with_property(dn, prop_name) \ @@ -262,6 +273,11 @@
> > static inline bool of_have_populated_dt(void)  #define
> > for_each_child_of_node(parent, child) \
> >  	while (0)
> >
> > +static inline int of_get_child_count(const struct device_node *np) {
> > +	return -ENOSYS;
> > +}
> > +
> >  static inline int of_device_is_compatible(const struct device_node *device,
> >  					  const char *name)
> >  {
