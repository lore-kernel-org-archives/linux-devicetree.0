From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: Re: [PATCH] of/pdt: fix section mismatch warning
Date: Tue, 27 Dec 2011 17:13:07 -0500 (EST)
Message-ID: <20111227.171307.1727824866350984198.davem@davemloft.net>
References: <20111227220408.GA18932@merkur.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111227220408.GA18932-OoSGOWW0KRunlFQ6Q1D1Y0B+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Date: Tue, 27 Dec 2011 23:04:08 +0100

> prom_early_alloc() is annotated __init, and users of
> kernel_tree_alloc() is also annotated __init.
> So simply match the annoation of these to fix the warning.

Not exactly.

drivers/of/fdt.c:of_fdt_unflatten_tree() is not marked __init but does
pass kernel_tree_alloc in as a callback to __unflatten_device_tree()

So I don't think we can't just mark kernel_tree_alloc as __init to fix
this problem.

of_fdt_unflatten_tree() seems to be invokable at arbitrary points in
time, even long after we boot up, so I think we'll end up having to
unravel things to other way, removing the __init tag from the various
implementations of prom_early_alloc().
