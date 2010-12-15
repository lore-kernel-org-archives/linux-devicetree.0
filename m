From: Hollis Blanchard <hollis-yUx37fBWTUITNcAmw9vGhQ@public.gmane.org>
Subject: Re: [PATCH 3/5] of/device: Make of_get_next_child() check status
	properties
Date: Wed, 15 Dec 2010 10:35:06 -0800
Message-ID: <AANLkTimPhs4AZ74e4SZfkyboeDJQaoybL+FGmwy_+bLJ@mail.gmail.com>
References: <cover.1291799069.git.deepak_saxena@mentor.com>
	<20101208192944.GE32473@mentor.com>
	<20101208150102.69b8062b@udp111988uds.am.freescale.net>
	<1291858402.2962.2.camel@concordia>
	<20101209030924.GC11856@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101209030924.GC11856@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Michael Ellerman <michael-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 8, 2010 at 7:09 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Thu, Dec 09, 2010 at 12:33:22PM +1100, Michael Ellerman wrote:
>> On Wed, 2010-12-08 at 15:01 -0600, Scott Wood wrote:
>> > On Wed, 8 Dec 2010 11:29:44 -0800
>> > Deepak Saxena <deepak_saxena-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> wrote:
>> >
>> > > We only return the next child if the device is available.
>> > >
>> > > Signed-off-by: Hollis Blanchard <hollis_blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
>> > > Signed-off-by: Deepak Saxena <deepak_saxena-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
>> > > ---
>> > > =A0drivers/of/base.c | =A0 =A04 +++-
>> > > =A01 files changed, 3 insertions(+), 1 deletions(-)
>> > >
>> > > diff --git a/drivers/of/base.c b/drivers/of/base.c
>> > > index 5d269a4..81b2601 100644
>> > > --- a/drivers/of/base.c
>> > > +++ b/drivers/of/base.c
>> > > @@ -321,6 +321,8 @@ struct device_node *of_get_next_parent(struct de=
vice_node *node)
>> > > =A0 *
>> > > =A0 * =A0 =A0 =A0 Returns a node pointer with refcount incremented, =
use
>> > > =A0 * =A0 =A0 =A0 of_node_put() on it when done.
>> > > + *
>> > > + * =A0 =A0 =A0 Does not return nodes marked unavailable by a status=
 property.
>> > > =A0 */
>> > > =A0struct device_node *of_get_next_child(const struct device_node *n=
ode,
>> > > =A0 struct device_node *prev)
>> > > @@ -330,7 +332,7 @@ struct device_node *of_get_next_child(const stru=
ct device_node *node,
>> > > =A0 read_lock(&devtree_lock);
>> > > =A0 next =3D prev ? prev->sibling : node->child;
>> > > =A0 for (; next; next =3D next->sibling)
>> > > - =A0 =A0 =A0 =A0 if (of_node_get(next))
>> > > + =A0 =A0 =A0 =A0 if (of_device_is_available(next) && of_node_get(ne=
xt))
>> > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> > > =A0 of_node_put(prev);
>> > > =A0 read_unlock(&devtree_lock);
>> >
>> > This seems like too low-level a place to put this. =A0Some code may kn=
ow
>> > how to un-disable a device in certain situations, or it may be part of
>> > debug code trying to dump the whole device tree, etc. =A0Looking
>> > further[1], I see a raw version of this function, but not other things
>> > like of_find_compatible_node.
>>
>> Yeah I agree. I think we'll eventually end up with __ versions of all or
>> lots of them. Not to mention there might be cases you've missed where
>> code expects to see unavailable nodes. The right approach is to add
>> _new_ routines that don't return unavailable nodes, and convert code
>> that you know wants to use them.
>
> Actually, I don't think we really want these status-skipping
> iterators at all. =A0The device tree iterators should give us the device
> tree, as it is. =A0Those old-style drivers which seach for a node rather
> than using the bus probing logic can keep individual checks of the
> status property until they're converted to the new scheme.

So the patch should look something like this?

@@ -321,6 +321,8 @@ struct device_node *of_get_next_parent(struct
device_node *node)
 *
 *     Returns a node pointer with refcount incremented, use
 *     of_node_put() on it when done.
+ *
+ *     Do not use this function.
 */
 struct device_node *of_get_next_child(const struct device_node *node,
       struct device_node *prev)

...

+ struct device_node *of_get_next_available_child(const struct
device_node *node,
+       struct device_node *prev)
+ ...
+ }

And then (almost) all the of_get_next_child() sites should be changed
to call the new function?

-Hollis
