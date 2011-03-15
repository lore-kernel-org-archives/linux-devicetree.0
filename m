From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] Make of_read_number() handle unaligned data
Date: Mon, 14 Mar 2011 21:47:53 -0600
Message-ID: <20110315034753.GF5600@angua.secretlab.ca>
References: <20110222223647.GA17406@dvomlehn-lnx2.corp.sa.net>
	<20110305052045.GK7579@angua.secretlab.ca>
	<20110308175509.GA29485@dvomlehn-lnx2.corp.sa.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110308175509.GA29485-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2XqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 08, 2011 at 09:55:09AM -0800, David VomLehn wrote:
> On Fri, Mar 04, 2011 at 10:20:45PM -0700, Grant Likely wrote:
> > On Tue, Feb 22, 2011 at 02:36:47PM -0800, David VomLehn wrote:
> > > Numeric values in properties can be unaligned, so introduce get_unaligned()
> > > in of_read_number() to make this work correctly on all processors.
> > > 
> > > Signed-off-by: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> > 
> > Hi David,
> > 
> > I've thought a lot about this change, (which is a big part of why it
> > has taken me so long to reply) and while the change itself doesn't
> > look problematic, I'm really bothered by the implications.  I really
> > don't like the binding that makes this change necessary.  Mixing cell
> > and string values is already troublesome.  Placing the cell after the
> > string so that alignment is wonky is doubly so.  (however, I am
> > working from memory here about the binding that requires this change.
> > Can you send it to me again, and I'll have a fresh look).
> > 
> > g.
> > 
> > > diff --git a/include/linux/of.h b/include/linux/of.h
> > > index cad7cf0..a0a6925 100644
> > > --- a/include/linux/of.h
> > > +++ b/include/linux/of.h
> > > @@ -22,6 +22,7 @@
> > >  #include <linux/spinlock.h>
> > >  
> > >  #include <asm/byteorder.h>
> > > +#include <asm/unaligned.h>
> > >  
> > >  #ifdef CONFIG_OF
> > >  
> > > @@ -110,8 +111,11 @@ extern void of_node_put(struct device_node *node);
> > >  static inline u64 of_read_number(const __be32 *cell, int size)
> > >  {
> > >  	u64 r = 0;
> > > -	while (size--)
> > > -		r = (r << 32) | be32_to_cpu(*(cell++));
> > > +	while (size--) {
> > > +		r = (r << 32) | be32_to_cpu(get_unaligned(cell));
> > > +		cell++;
> > > +	}
> > > +
> > >  	return r;
> > >  }
> > >  
> 
> Several devices on our system need to use very large, physically
> contiguous, buffers. These buffers can be up to 80 MB long. Hardware
> constrains some of the buffer to be at statically determined addresses
> and the others have addresses dynamically assigned within a specific
> range of memory. Both the size of buffers and the requirement to use
> specific addresses imply that the buffers must be set up before or
> during the time the bootmem allocator is active.
> 
> A given device can have buffers with both statically and dynamically
> assigned addresses and may have more than one of each type. Drivers
> get the address via tag, which is a string.
> 
> The specific syntax for a buffer with a dynamically assigned address
> (ignoring optional whitespace) is:
> 
> 	<dbuf-property> ::= "cisco,dynamic-bufs" "=" <dbuf-specs> ";"
> 	<dbufs-specs> ::= <dbuf-spec> | <dbuf-spec> "," <dbuf-specs>
> 	<dbuf-spec> ::= <name> "," "<" <size> <alignment> <range-start>
> 		<range-size> ">"
> 	<name> ::= '"' <non-quote-chars> '"'
> 	<size>, <alignment>, <range-start>, and <range-size> are all hex
> 		constants
> 
> Example: cisco,dynamic-bufs =
> 		"DisplayBins0",<0x00101000 0x1000 0x10000000 0x0fc00000>,
> 		"DisplayBins1",<0x00101000 0x1000 0x60000000 0x10000000>;
> 
> Buffers with statically assigned addresses have the following syntax
> (again, ignoring optional whitespace):
> 
> 	<sbuf-property> ::= "cisco,static-bufs" "=" <sbuf-spec> ";"
> 	<sbuf-specs ::= <sbuf-spec> | <sbuf-spec> "," <sbuf-specs>
> 	<sbuf-spec> ::= <name> "," "<" <start-address> <size> ">"
> 	<start-address> and <size> are hex constants
> 
> Example: cisco,static-bufs = "AvfsDmaMem",<0x67c00000 0x00ea0000>;
> 
> Since I may have a string sandwiched betweeen cells, and property values
> have no padding for alignment, cells are generally not aligned in this
> property.

Right, and it is this bit, plus the mixed string+cell values, that
bothers me.  I'd be much happier with a binding that uses the natural
structure to provide the delineation.  Something like:

	cisco,dynamic-buffers {
		display-bins-0 {
			cisco,size = <size>;
			cisco,alignment = <alignment>;
			cisco,range = <range-start range-size>;
		};
		display-bins-1 {
			cisco,size = <size>;
			cisco,alignment = <alignment>;
			cisco,range = <start size>;
		};
	};
	cisco,static-buffers {
		avfs-dma-mem {
			cisco,size = <size>;
			cisco,range = <start size>;
		};
	};

Which uses the existing dt functions for parsing the data, and is
easy for a driver to find the specific data it needs.  Plus it stays
out of the territory of mixed data types in properties which raises
eyebrows.

g.
