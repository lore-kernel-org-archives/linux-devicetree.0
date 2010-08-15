From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: olpc ofw question
Date: Sat, 14 Aug 2010 15:52:05 -1000
Message-ID: <4C674845.8090202@firmworks.com>
References: <20100810204010.134618fb@dev.queued.net>	<55307.84.105.60.153.1281559723.squirrel@gate.crashing.org>	<20100811172045.77cda7a0@dev.queued.net>	<4C635428.9010009@firmworks.com>
	<20100814203545.4aee7e0f@debxo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100814203545.4aee7e0f@debxo>
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
> On Wed, 11 Aug 2010 15:53:44 -1000
> Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org> wrote:
>
> [...]
>   
>> The "proc_of.c" code that I wrote in Dec 2006 uses the
>> package-to-path method mentioned above, getting the "name@addr"
>> representation (package-to-path returns the full path, but you can
>> easily extract just the tail component with strrchr(path, '/'))
>>     
>
>
> Thanks for the tip.  I changed the code:
>
> -       dp->name = pdt_get_one_property(node, "name");
> +//     dp->name = pdt_get_one_property(node, "name");
> +       dp->name = pdt_get_fullname(node);
>
> Where pdt_get_fullname() runs package-to-path and returns
> strrchr(buf, '/')+1; /proc/device-tree looks much better.
> Here's the diff now between /ofw and /proc/device-tree:
>
> http://dev.queued.net/~dilinger/dt2.diff
>
> Now I'm wondering a few things;
>
> 1) I'm setting node->name to the full node name now (including
> the "@" suffix).  Is there any reason why this might be incorrect
> (ie, that I should only be using the @ suffix in node->full_name)?
> It looks fine to me, but it's worth asking...
>
> 2) At a later point, it's probably worth looking into changing
> the sparc code to use this as well.  Is there a reason why the
> sparc code doesn't shouldn't use this (ie, old firmware bugs)?
>   

package-to-path first appeared in OBP 3, i.e. the major version that 
conformed to the IEEE 1275 standard.  OBP 1.x and OBP 2.x had a 
different (less portable and somewhat less functional) client interface 
ABI called "romvec".  If I remember correctly, OBP 3 first appeared on 
Sun 5 - UltraSPARC - systems.  OBP 1 and 2 were on Sun 4c and related 
machines.

I think it has been about 15 years since the last OBP 2.x system was 
released.  There may still be a few working machines from that 
generation, but if so, they are of more historic interest than economic 
value.  I ditched my last one something like 10 years ago.
> 3) I get the following during proc population:
>
> [    0.126687] device-tree: Duplicate name in /, renamed to "dropin-fs#1"
>
> Looking at the diff, I see
>
> -/dropin-fs/.node
> -0000000   ` 222 206 377
> -0000004
> -/dropin-fs/.node
> -0000000   ` 222 206 377
>
> Is this a bug in my version of OFW?
>   

Yes.  I just fixed it.  Thanks for noticing it.  Fortunately, it is 
innocuous.
