From: "Segher Boessenkool" <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: dtc: Empty ranges property: #cells-size warning
Date: Wed, 21 Oct 2009 18:41:22 +0200 (CEST)
Message-ID: <54889.84.105.60.153.1256143282.squirrel@gate.crashing.org>
References: <200910211713.12503.sr@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <200910211713.12503.sr-ynQEQJNshbs@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> when changing #cells-size from 1 to 2 in the root node (to support >= 4GB
> of

You mean "#size-cells".

> RAM in katmai.dts) I get the following warning:
>
> Warning (ranges_format): /plb has empty "ranges" property but its
> #size-cells
> (1) differs from / (2)
>
> I could change #cells-size to 2 in the plb node as well. But this not
> really
> what I want, because of it's child nodes.
>
> So my questions is: How can I solve this problem? Perhaps this warning
> should
> be removed from dtc?

No, the warning is correct, and your device tree is in error.

An empty "ranges" property means that the child address space is
identical to the parent address space, which isn't the case here.

You should resolve this by using a non-empty "ranges" property,
instead.  If e.g. the address space is 1GB, and located at 0, you
would do

   < 0    0 0    0x40000000 >
(child) (parent)    (size)


Segher
