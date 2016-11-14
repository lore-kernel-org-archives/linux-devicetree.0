From: Balbir Singh <bsingharora-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 2/5] mm: remove x86-only restriction of movable_node
Date: Tue, 15 Nov 2016 10:20:00 +1100
Message-ID: <37a9339f-0ce9-261f-90de-be8463705bb5@gmail.com>
References: <1479160961-25840-1-git-send-email-arbab@linux.vnet.ibm.com>
 <1479160961-25840-3-git-send-email-arbab@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479160961-25840-3-git-send-email-arbab-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Reza Arbab <arbab-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bharata B Rao <bharata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Nathan Fontenot <nfont-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Stewart Smith <stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Alistair Popple <apopple-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, "Aneesh Kumar K.V" <aneesh.kumar-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 15/11/16 09:02, Reza Arbab wrote:
> In commit c5320926e370 ("mem-hotplug: introduce movable_node boot
> option"), the memblock allocation direction is changed to bottom-up and
> then back to top-down like this:
> 
> 1. memblock_set_bottom_up(true), called by cmdline_parse_movable_node().
> 2. memblock_set_bottom_up(false), called by x86's numa_init().
> 
> Even though (1) occurs in generic mm code, it is wrapped by #ifdef
> CONFIG_MOVABLE_NODE, which depends on X86_64.
> 
> This means that when we extend CONFIG_MOVABLE_NODE to non-x86 arches,
> things will be unbalanced. (1) will happen for them, but (2) will not.
> 
> This toggle was added in the first place because x86 has a delay between
> adding memblocks and marking them as hotpluggable. Since other arches do
> this marking either immediately or not at all, they do not require the
> bottom-up toggle.
> 
> So, resolve things by moving (1) from cmdline_parse_movable_node() to
> x86's setup_arch(), immediately after the movable_node parameter has
> been parsed.
> 
> Signed-off-by: Reza Arbab <arbab-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>


Acked-by: Balbir Singh <bsingharora-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
