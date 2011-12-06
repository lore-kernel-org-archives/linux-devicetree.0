From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Boolean properties
Date: Mon, 5 Dec 2011 16:29:22 -0800
Message-ID: <CAPnjgZ1BevAt3==ZcQKn_f7xudrcKE+ks0YpHwBFqTXg2uc7Jw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

As I understand it, boolean properties in the device tree are defined
as follows:

- if the property is present, then it is true
- if the property is absent, then it is false

The fdtget and fdtput utilities deal with reading and changing these.
At present fdtget returns the value of the property and is not
suitable for boolean properties. fdtput allows setting of a property
value but not removing it.

To deal with boolean properties these utilities need to change. One
option is to use something like:

$ fdtget -t f /path/to/node property
(prints 'true' or 'false')
$ fdtput -t f /path/to/node property false/true
$ fdtput -t f /path/to/node property 0/1
(deletes the property for false and 0; adds it with no value for true and 1)

(Unfortunately the 'b' type is taken for byte at present, so it is
unclear to be so far what letter we should use for 'f' in the -t flag)

But first I would like to suggest that we support boolean properties
with a value, i.e. change to:

- if the property is absent, then it is false
- if the property is present, then it is true
    - unless the property has a 0 value, iwc it is false

There are three reasons:
1. it is very confusing for the poor user to set a property value to 0
and have it come back as 'true' from a function that checks these
sorts of things. This is particularly true since fdt properties do not
have types, or even type hints.  The function I have in mind is
something like this (modified to fit the discussion):

/**
 * Look up a boolean property in a node and return it.
 *
 * A boolean properly is true if present in the device tree and false if not
 * present (regardless of any property data/value).
 *
 * @param blob	FDT blob
 * @param node	node to examine
 * @param prop_name	name of property to find
 * @return 1 if the properly is present; 0 if it isn't present
 */
int fdtdec_get_bool(const void *blob, int node, const char *prop_name);

An alternative might be to print an error (and refuse to return a
value) when a boolean property has a value:

 * @return 1 if the properly is present; 0 if it isn't present, -1 if
it has any data (and is therefore illegal as a boolean property)

2. it allows us to adjust the boolean value without requiring a change
in the size of the device tree blob (faster, easier)

3. Related to 2 it allows us to put template values in the fdt which
can then be *optionally* updated in the build system or in U-Boot to
the required value before passing to the kernel.

I presume this discussion has happened before - can anyone please
point me to the thread?

Regards,
Simon
