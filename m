From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: dts and dtsi files on which I tested the syntax for my recent
	patch set.
Date: Wed, 20 Oct 2010 22:06:00 -0700
Message-ID: <1287637560.4535.1524.camel@riker>
References: <1287626916.4535.1511.camel@riker> <20101021031439.GE6227@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101021031439.GE6227@yookeroo>
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
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2010-10-21 at 14:14 +1100, David Gibson wrote:
> On Wed, Oct 20, 2010 at 07:08:36PM -0700, John Bonesio wrote:
> > On Wed, 2010-10-20 at 17:46 -0600, Grant Likely wrote:
> > > On Wed, Oct 20, 2010 at 03:22:17PM -0700, John Bonesio wrote:
> > > > Hi,
> > > > 
> > > > I have attached the two file I've used to test the new syntax from my
> > > > patch set. These might help get a feel for how the syntax and the
> > > > features work.
> > > 
> > > heh, what you should actually do (because you have to anyway) is add
> > > testcases for the new features to dtc in the tests directory.  'make
> > > check' runs the test cases.
> > > 
> > > > /remove-node/ &{soc/serial@2400};                  /* an example of using a label rooted path */
> > > 
> > > As previously mentioned by David, this conflicts with the already
> > > established convention of a path that does not start with a '/' means
> > > use a value from the /aliases node.  That ambiguity needs to
> > > be avoided, so the syntax still needs some massaging.
> > 
> > I think we should explore this a bit further. I just don't see in the
> > lexer code where it would parse anything with the syntax
> > &{alias/node/path} (except for my recent patch).
> > 
> > I looked through the parser too, and it wasn't obvious where it would
> > match '&' directly.
> > 
> > Maybe I'm just missing it.
> 
> No, we just weren't being clear.  dtc does not itself expand aliases
> in this way.  However, it's a common convention in existing device
> tree stuff.  The OF interface will expand aliases in this way, as will
> fdt_path_offset().
> 
> So it's not an actual ambiguity with existing syntax, but the fact
> that your proposed syntax is subtley different from a common existing
> device tree convention would violate least-surprise.

Would it really? Isn't an alias and a label on a node pretty much the
same concept?

> 
