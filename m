From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v5 1/4] of: remove *phandle properties from expanded device tree
Date: Thu, 15 Jun 2017 16:53:03 +1000
Message-ID: <87bmpppws0.fsf@concordia.ellerman.id.au>
References: <1497073632-22402-1-git-send-email-frowand.list@gmail.com> <1497073632-22402-2-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1497073632-22402-2-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: frowand.list@gmail.com, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

frowand.list@gmail.com writes:

> From: Frank Rowand <frank.rowand@sony.com>
>
> Remove "phandle", "linux,phandle", and "ibm,phandle" properties from
> the internal device tree.  The phandle will still be in the struct
> device_node phandle field.
>
> This is to resolve the issue found by Stephen Boyd [1] when he changed
> the type of struct property.value from void * to const void *.  As
> a result of the type change, the overlay code had compile errors
> where the resolver updates phandle values.
>
>   [1] http://lkml.iu.edu/hypermail/linux/kernel/1702.1/04160.html
>
> - Add sysfs infrastructure to report np->phandle, as if it was a property.
> - Do not create "phandle" "ibm,phandle", and "linux,phandle" properties
>   in the expanded device tree.
> - Remove phandle properties in of_attach_node(), for nodes dynamically
>   attached to the live tree.  Add the phandle sysfs entry for these nodes.
> - When creating an overlay changeset, duplicate the node phandle in
>   __of_node_dup().
> - Remove no longer needed checks to exclude "phandle" and "linux,phandle"
>   properties in several locations.
> - A side effect of these changes is that the obsolete "linux,phandle" and
>   "ibm,phandle" properties will no longer appear in /proc/device-tree (they
>   will appear as "phandle").
> - A side effect is that the value of property "ibm,phandle" will no longer
>   override the value of properties "phandle" and "linux,phandle".

Can you please Cc linuxppc-dev in future on patches which clearly are
going to impact powerpc?

cheers
