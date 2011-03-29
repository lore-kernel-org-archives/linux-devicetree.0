From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] fdt_ro: Fix fdt_get_property_namelen() length bug
Date: Tue, 29 Mar 2011 12:34:46 +1100
Message-ID: <20110329013446.GM8428@yookeroo>
References: <1301350775-27040-1-git-send-email-ptyser@xes-inc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1301350775-27040-1-git-send-email-ptyser-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Peter Tyser <ptyser-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 28, 2011 at 05:19:35PM -0500, Peter Tyser wrote:
> fdt_get_property_namelen() should only compare 'namelen' characters when
> matching a property name.  The previous code compared 'namelen'
> characters correctly, but also required the property name length to
> exactly match 'namelen'.
> 
> This length matching requirement would result in bugs such as
> "ethernet0" not being found when using fdt_get_property_namelen() to
> find properties starting with "ethernet".

Nack.  The current behaviour of the *_namelen() functions is the
intended one.  Their purpose is not for doing partial matches, but
instead for doing exact matches, but using a non-null-terminated
string as the argument.  For example get_subnode_offset_namelen() is
used internally for comparing names against path components without
having to copy and null terminate the pieces of the path first.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
