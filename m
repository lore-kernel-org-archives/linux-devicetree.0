From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH v6 4/4] of/fdt: mark hotpluggable memory
Date: Sun, 25 Dec 2016 10:02:22 +0100
Message-ID: <20161225090222.3703-1-xypron.glpk@gmx.de>
References: <1478562276-25539-5-git-send-email-arbab@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478562276-25539-5-git-send-email-arbab-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Reza Arbab <arbab-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: Balbir Singh <bsingharora-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Aneesh Kumar K . V" <aneesh.kumar-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, "H . Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Alistair Popple <apopple-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Bharata B Rao <bharata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Nathan Fontenot <nfont-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stewart Smith <stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The patch adds a new property "linux,hotpluggable" to memory nodes of the
device tree.

memory@0 {
	reg = <0x0 0x01000000 0x0 0x7f000000>;
	linux,hotpluggable;
}

Memory areas marked by this property can later be disabled using the hotplugging
API. Especially for virtual machines this is a very useful capability.

Unfortunately the notation chosen does not fit well with the concept of
devicetree overlays which allow to change the devicetree during runtime.

I suggest to use the following notation

memory@0 {
	compatible = "linux,hotpluggable-memory";
	reg = <0x0 0x01000000 0x0 0x7f000000>;
	status = "disabled";
}

This will allow us to write a device driver that can react to changes of the
devicetree made via devicetree overlays.

This driver could react to the change of the status between "okay" and
"disabled" and update the memory status accordingly.

Further we could use devicetree overlays to provide additional hotpluggable
memory.

The referenced patch has already been pulled for 4.10. But I hope it is not
too late for this design change.

Best regards

Heinrich Schuchardt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
