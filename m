From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: case sensitivity for devicetree node names
Date: Sat, 11 Jun 2016 12:38:09 -0700
Message-ID: <575C68A1.1020701@gmail.com>
References: <575B1D84.2010703@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <575B1D84.2010703-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Ben,

(and adding other powerpc folks)

On 06/10/16 13:05, Frank Rowand wrote:
> I had assumed that devicetree node names were case sensitive. But a recent
> email thread asserted that they were not, which made me curious.
> 
> dtc treats node names as case sensitive:
> 
> $ cat test_node_case_1.dts
> 
> /dts-v1/;
> 
> / {
> 	node-x {
> 		prop_a = < 1 >;
> 	};
> };
> 
> / {
> 	node-X {
> 		prop_a = < 2 >;
> 	};
> };
> 
> $ cat test_node_case_2.dts
> 
> /dts-v1/;
> 
> / {
> 	node-x {
> 		prop_a = < 1 >;
> 	};
> };
> 
> / {
> 	node-x {
> 		prop_a = < 2 >;
> 	};
> };
> 
> $ dtc -O dts test_node_case_1.dts
> /dts-v1/;
> 
> / {
> 
> 	node-x {
> 		prop_a = <0x1>;
> 	};
> 
> 	node-X {
> 		prop_a = <0x2>;
> 	};
> };
> 
> $ dtc -O dts test_node_case_2.dts
> /dts-v1/;
> 
> / {
> 
> 	node-x {
> 		prop_a = <0x2>;
> 	};
> };
> 
> 
> But the Linux kernel source code defines of_node_cmp() as:
> 
>   include/linux/of.h:
> 
>   /* Default string compare functions, Allow arch asm/prom.h to override */
>   #if !defined(of_compat_cmp)
>   #define of_node_cmp(s1, s2) strcasecmp((s1), (s2))
> 
> arch/sparc/include/asm/prom.h uses strcmp() instead of strcasecmp().
> 
> Examples of using of_node_cmp() to check for a node name can be found,
> for example, of_find_node_by_name().
> 
> Is case insensitivity for node names a bug in the Linux kernel, or desired
> for some reason?
> 
> -Frank
> 

I chased through the history and found a 2.6.0-test5 announcement
which noted the patch from you which adds:

  of_find_node_by_path()
  of_find_node_by_name()
  of_find_node_by_type()
  of_find_compatible_node()

(And the patch is commit 394edd852a14 in the git recreation
of bitkeeper days, which is found at
git://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git)

That version of the functions uses a case insensitive compare for
devicetree node names.

Do you remember why you chose to not use a case sensitive compare?

Thanks,

-Frank
