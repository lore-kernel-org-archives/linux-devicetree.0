From: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work-JGs/UdohzUI@public.gmane.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gb2Y6IEFkZCBtb3JlIHN0dWJzIGZvciBub24tT0YgYnVp?=
 =?UTF-8?B?bGRz?=
Date: Tue, 18 Jun 2013 20:35:37 +0400
Message-ID: <1371573337.452797583@f398.i.mail.ru>
References: <1371489882-11143-1-git-send-email-shc_work@mail.ru>
 <51C089F6.2060902@gmail.com>
Reply-To: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work-JGs/UdohzUI@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51C089F6.2060902-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: =?UTF-8?B?Um9iIEhlcnJpbmc=?= <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?B?R3JhbnQgTGlrZWx5?= <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, =?UTF-8?B?QnJ5YW4gV3U=?= <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?Um9iIEhlcnJpbmc=?= <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> Perhaps a more specific subject.

I can just specify stub function names in the subject.
Is this enough?

> On 06/17/2013 12:24 PM, Alexander Shiyan wrote:
> > Patch adds of_get_next_child and of_get_next_available_child
> > stubs for non-OF builds.
> > 
> > Signed-off-by: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
> > ---
> 
> What changed for v2?

v1 not contain "inline" for prototypes.

> >  include/linux/of.h | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/linux/of.h b/include/linux/of.h
> > index 1fd08ca..df0e644 100644
> > --- a/include/linux/of.h
> > +++ b/include/linux/of.h
> > @@ -366,8 +366,17 @@ static inline bool of_have_populated_dt(void)
> >  	return false;
> >  }
> >  
> > -#define for_each_child_of_node(parent, child) \
> > -	while (0)
> > +static struct device_node *of_get_next_child(const struct device_node *node,
> > +					     struct device_node *prev)
> > +{
> > +	return NULL;
> > +}
> > +
> > +static struct device_node *of_get_next_available_child(
> > +	const struct device_node *node, struct device_node *prev)
> > +{
> > +	return NULL;
> > +}
> >  
> >  static inline struct device_node *of_get_child_by_name(
> >  					const struct device_node *node,
> > @@ -376,6 +385,9 @@ static inline struct device_node *of_get_child_by_name(
> >  	return NULL;
> >  }
> >  
> > +#define for_each_child_of_node(parent, child) \
> 
> parent and child need unused annotations to avoid unused variable warnings.

This define has been moved just for keep same order as for OF-version.

---
