From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: olpc ofw question
Date: Wed, 11 Aug 2010 15:53:44 -1000
Message-ID: <4C635428.9010009@firmworks.com>
References: <20100810204010.134618fb@dev.queued.net>	<55307.84.105.60.153.1281559723.squirrel@gate.crashing.org>
	<20100811172045.77cda7a0@dev.queued.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100811172045.77cda7a0-ztAUm9HJea/EueBKFXcDjA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Andres Salomon wrote:
> On Wed, 11 Aug 2010 22:48:43 +0200 (CEST)
> "Segher Boessenkool" <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
>
>   
>>> I've run a comparison between OLPC's old OFW code (which mounts the
>>> device-tree at /ofw, and makes use of the sparc code) versus the
>>> code which I'm planning to send upstream (which mounts the
>>> device-tree at /proc/device-tree, and makes use of PROC_DEVTREE).
>>> The results are here:
>>>       
>> [unit addresses are missing]
>>
>>     
>>> Any insight into the reasoning for this mangling?
>>>       
>> It sounds to me like you're not putting the (textual representation
>> of the) unit address in the device_node->full_name field.  How do
>> you fill that field?
>>     
>
> Ah, that could very well be it.  Note that the *old* OLPC code used the
> 'path_component_name' of device_node.  The new code uses just 'name' in
> pdt_build_full_name(), as path_component_name is #ifdef'd out
> for !SPARC.  I guess I'm not entirely sure why sparc used
> path_component_name in the first place..
>   

I think I understand the situation.  The guess that I articulated on IRC 
is essentially correct.  The (human-readable) text representation of the 
unit address - i.e. the stuff after "@" - is parent-bus-specific.  The 
numerical representation of a unit address is easily determined - it is 
the first "#address-cells" cells of the "reg" property.  But the 
rendering of that into ASCII is not as obvious.

A live OF environment gets the text representation by calling the parent 
bus's "decode-unit" method with the numerical representation as an 
argument.  (In the other direction, the "encode-unit" method goes from 
text to numerical.)   There's an easy way to get that effect via the 
client interface - just call "package-to-path" on the phandle, and OF 
will return the full pathname in canonical form.

If you look in arch/sparc/kernel/prom.c:sparc32_path_component() you'll 
see what is going on.  That routine derives a "name@address" string 
using a heuristic described in this comment:


/* The following routines deal with the black magic of fully naming a
 * node.
 *
 * Certain well known named nodes are just the simple name string.
 *
 * Actual devices have an address specifier appended to the base name
 * string, like this "foo@addr".  The "addr" can be in any number of
 * formats, and the platform plus the type of the node determine the
 * format and how it is constructed.
 *
 * For children of the ROOT node, the naming convention is fixed and
 * determined by whether this is a sun4u or sun4v system.
 *
 * For children of other nodes, it is bus type specific.  So
 * we walk up the tree until we discover a "device_type" property
 * we recognize and we go from there.
 */

As I described above, it's not really black magic; extract the numerical 
form of the unit address and pass it to the parent's encode-unit method 
.  Either someone didn't know about that, or perhaps they had some 
reason for not using it.  It's certainly do-able during the phase while 
OF is still alive.

In the non-SPARC case, I think the code was dealing with a flattened 
device tree, where the node name had already been pre-digested to 
include the @addr suffix.  In that case, decoding the unit address into 
the text representation was somebody else's problem, so there was no 
(non-SPARC) Linux code to handle it.

The "proc_of.c" code that I wrote in Dec 2006 uses the package-to-path 
method mentioned above, getting the "name@addr" representation 
(package-to-path returns the full path, but you can easily extract just 
the tail component with strrchr(path, '/'))

>
> The code that fills in full_name:
>
>                 dp->full_name = pdt_build_full_name(dp);
>
>
> static char * __init pdt_build_full_name(struct device_node *dp)
> {
>         int len, ourlen, plen;
>         char *n;
>
>         plen = strlen(dp->parent->full_name);
>         ourlen = strlen(fetch_node_name(dp));
>         len = ourlen + plen + 2;
>
>         n = prom_early_alloc(len);
>         strcpy(n, dp->parent->full_name);
>         if (!of_is_root_node(dp->parent)) {
>                 strcpy(n + plen, "/");
>                 plen++;
>         }
>         strcpy(n + plen, fetch_node_name(dp));
>
>         return n;
> }
>
> #if defined(CONFIG_SPARC)
> static inline const char *fetch_node_name(struct device_node *dp)
> {
>         return dp->path_component_name;
> }
> #else
> static inline const char *fetch_node_name(struct device_node *dp)
> {
>         return dp->name;
> }
> #endif
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>
>   
