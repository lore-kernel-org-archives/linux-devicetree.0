From: Peter Tyser <ptyser-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] fdt_ro: Fix fdt_get_property_namelen() length bug
Date: Mon, 28 Mar 2011 21:47:57 -0500
Message-ID: <1301366877.11221.53.camel@ptyser-laptop>
References: <1301350775-27040-1-git-send-email-ptyser@xes-inc.com>
	<20110329013446.GM8428@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110329013446.GM8428@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2011-03-29 at 12:34 +1100, David Gibson wrote:
> On Mon, Mar 28, 2011 at 05:19:35PM -0500, Peter Tyser wrote:
> > fdt_get_property_namelen() should only compare 'namelen' characters when
> > matching a property name.  The previous code compared 'namelen'
> > characters correctly, but also required the property name length to
> > exactly match 'namelen'.
> > 
> > This length matching requirement would result in bugs such as
> > "ethernet0" not being found when using fdt_get_property_namelen() to
> > find properties starting with "ethernet".
> 
> Nack.  The current behaviour of the *_namelen() functions is the
> intended one.  Their purpose is not for doing partial matches, but
> instead for doing exact matches, but using a non-null-terminated
> string as the argument.

OK, your explanation of their intended use makes sense.  The comments
describing the _namelen() functions seem a bit misleading though, eg:
/**
 * fdt_get_property_namelen - find a property based on substring
 * @fdt: pointer to the device tree blob
 * @nodeoffset: offset of the node whose property to find
 * @name: name of the property to find
 * @namelen: number of characters of name to consider
 * @lenp: pointer to an integer variable (will be overwritten) or NULL
 *
 * Identical to fdt_get_property_namelen(), but only examine the first
 * namelen characters of name for matching the property name.
 */

That make it sound like its specifically for partial matching of
substrings in general.

> For example get_subnode_offset_namelen() is
> used internally for comparing names against path components without
> having to copy and null terminate the pieces of the path first.

fdt_subnode_offset_namelen() shouldn't be affected by this patch as it
does its length checking in _fdt_nodename_eq() instead of
_fdt_string_eq().  I assume your argument still applies to paths that do
use _fdt_string_eq() though.

Is there a downside to allowing partial matching?  I'm not too familiar
with libfdt, but it seems like it would make it more flexible to allow
arbitrary namelen matching.  The places I see that do use _namelen()
functions to do non-null string matching seem like they'd still work
fine with this change applied, eg in fdt_path_offset().

Thanks for the comments and explanation,
Peter
