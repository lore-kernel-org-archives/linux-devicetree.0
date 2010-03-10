From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: libfdt: Implement property iteration functions
Date: Wed, 10 Mar 2010 08:17:01 -0600
Message-ID: <E1NpMib-0001id-Pi@jdl.com>
References: <20100309063914.GA11655@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20100309063914.GA11655@yookeroo> 
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> For ages, we've been talking about adding functions to libfdt to allow
> iteration through properties.  So, finally, here are some.
> 
> I got bogged down on this for a long time because I didn't want to
> expose offsets directly to properties to the callers.  But without
> that, attempting to make reasonable iteration functions just became
> horrible.  So eventually, I settled on an interface which does now
> expose property offsets.  fdt_first_property_offset() and
> fdt_next_property_offset() are used to step through the offsets of the
> properties starting from a particularly node offset.  The details of
> the property at each offset can then be retrieved with either
> fdt_get_property_by_offset() or fdt_getprop_by_offset() which have
> interfaces similar to fdt_get_property() and fdt_getprop()
> respectively.
> 
> No explicit testcases are included, but we do use the new functions to
> reimplement the existing fdt_get_property() function.
> 
> Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Applied.

jdl
