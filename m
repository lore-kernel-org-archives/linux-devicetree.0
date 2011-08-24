From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RFC: for_each_u32/string_property_value
Date: Wed, 24 Aug 2011 16:02:33 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04B24A3D04@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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
To: "Grant Likely (grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org)" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Grant & all,

I was thinking of some macros for <linux/of.h> that iterate over all the
values in a property that's a list/array of values in a device-tree:

foo = <1 2 3 4>;
foo = "one", "two", "three", "four";

for_each_u32_property_value(node, "foo", value)
	printf("Value is: %u\n", value);
for_each_string_property_value(node, "foo", value)
	printf("Value is: %s\n", value);

Something like those below. Do these look OK, or are they a hugely hacky
abuse of the pre-processor?

(Alternatively, these could be inlines functions, but then would need to
emulate closures)

/*
const struct device_node *np;
const char *propname;
u32 value;
int tmplen;
const __be32 *tmpptr;
*/
#define for_each_u32_property_value(dn, prop_name, value, tmplen, tmpptr) \
	for (tmpptr = of_find_property(dn, prop_name, &tmplen); \
	     value = tmplen ? be32_to_cpup(*tmpptr) : 0, tmplen; \
	     tmpptr++, tmplen--)

/*
const struct device_node *np;
const char *propname;
const char *value;
int tmplen;
const char *tmpafter;
*/
#define for_each_string_property_value(dn, prop_name, value, tmplen, tmpafter) \
	for (value = of_find_property(dn, prop_name, &tmplen), \
	     tmpafter = value + tmplen, tmpafter[-1] = '\0'; \
	     value < tmpafter; \
	     value += strlen(value) + 1)

(Note I haven't even compile-tested these yet)

-- 
nvpublic
