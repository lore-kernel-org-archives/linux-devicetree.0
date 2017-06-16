From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v5 0/4] of: remove *phandle properties from expanded
 device tree
Date: Fri, 16 Jun 2017 10:06:30 +1000
Message-ID: <1497571590.2897.88.camel@kernel.crashing.org>
References: <1497073632-22402-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1497073632-22402-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: frowand.list@gmail.com, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 2017-06-09 at 22:47 -0700, frowand.list@gmail.com wrote:
> From: Frank Rowand <frank.rowand@sony.com>
> 
> Remove "phandle" and "linux,phandle" properties from the internal
> device tree.  The phandle will still be in the struct device_node
> phandle field.
> 
> This is to resolve the issue found by Stephen Boyd [1] when he changed
> the type of struct property.value from void * to const void *.  As
> a result of the type change, the overlay code had compile errors
> where the resolver updates phandle values.

Piggy back on the powerpc breakage thread...

So various things in userspace will consume these. The main one is
kexec which needs them to rebuild a fdt. So if you're going to do that
you need to modify the sysfs code to expose a phandle attribute from
the device node ->phandle.

Cheers,
Ben.
