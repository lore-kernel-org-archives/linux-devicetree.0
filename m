From: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
Subject: Re: olpc ofw question
Date: Wed, 11 Aug 2010 17:20:45 -0400
Message-ID: <20100811172045.77cda7a0@dev.queued.net>
References: <20100810204010.134618fb@dev.queued.net>
	<55307.84.105.60.153.1281559723.squirrel@gate.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <55307.84.105.60.153.1281559723.squirrel-JorI+TVEvZrY24RiXHRV3ti2O/JbrIOy@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Segher Boessenkool <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 11 Aug 2010 22:48:43 +0200 (CEST)
"Segher Boessenkool" <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:

> > I've run a comparison between OLPC's old OFW code (which mounts the
> > device-tree at /ofw, and makes use of the sparc code) versus the
> > code which I'm planning to send upstream (which mounts the
> > device-tree at /proc/device-tree, and makes use of PROC_DEVTREE).
> > The results are here:
> 
> [unit addresses are missing]
> 
> > Any insight into the reasoning for this mangling?
> 
> It sounds to me like you're not putting the (textual representation
> of the) unit address in the device_node->full_name field.  How do
> you fill that field?

Ah, that could very well be it.  Note that the *old* OLPC code used the
'path_component_name' of device_node.  The new code uses just 'name' in
pdt_build_full_name(), as path_component_name is #ifdef'd out
for !SPARC.  I guess I'm not entirely sure why sparc used
path_component_name in the first place..


The code that fills in full_name:

                dp->full_name = pdt_build_full_name(dp);


static char * __init pdt_build_full_name(struct device_node *dp)
{
        int len, ourlen, plen;
        char *n;

        plen = strlen(dp->parent->full_name);
        ourlen = strlen(fetch_node_name(dp));
        len = ourlen + plen + 2;

        n = prom_early_alloc(len);
        strcpy(n, dp->parent->full_name);
        if (!of_is_root_node(dp->parent)) {
                strcpy(n + plen, "/");
                plen++;
        }
        strcpy(n + plen, fetch_node_name(dp));

        return n;
}

#if defined(CONFIG_SPARC)
static inline const char *fetch_node_name(struct device_node *dp)
{
        return dp->path_component_name;
}
#else
static inline const char *fetch_node_name(struct device_node *dp)
{
        return dp->name;
}
#endif
