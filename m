From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH 03/14] bus: mvebu-mbus: Introduce device tree binding
Date: Fri, 7 Jun 2013 13:44:30 -0600
Message-ID: <20130607194430.GA7854@obsidianresearch.com>
References: <1370623671-7748-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1370623671-7748-4-git-send-email-ezequiel.garcia@free-electrons.com>
 <201306072110.35856.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201306072110.35856.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 07, 2013 at 09:10:35PM +0200, Arnd Bergmann wrote:
> On Friday 07 June 2013, Ezequiel Garcia wrote:
> > +       np = of_find_matching_node(NULL, of_mvebu_mbus_ids);
> > +       if (!np) {
> > +               pr_err("could not find a matching SoC family\n");
> > +               return -ENODEV;
> > +       }
> > +
> > +       of_id = of_match_node(of_mvebu_mbus_ids, np);
> > +       mbus_state.soc = of_id->data;
> > +
> > +       if (of_address_to_resource(np, 0, &mbuswins_res)) {
> > +               pr_err("cannot get MBUS register address\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       if (of_address_to_resource(np, 1, &sdramwins_res)) {
> > +               pr_err("cannot get SDRAM register address\n");
> > +               return -EINVAL;
> > +       }
> 
> Just an idea to make this more regular: Since the internal-regs can no longer
> be regarded as a fixed location, we might want to use the same "ranges" property
> mechanism for resolving the internal regs as we use for everything else.
> 
> This would imply that the device node this driver binds to would actually
> end up being a child of the bus itself, which then goes on to modify the
> ranges property of its parent node. Does that make sense?

We have a minimum requirement that the bootloader setup internal regs,
so the minimum required DT bindings is going to be this:

mbus {
  compatible = ...
  ranges = <INTERNAL_REGS_MAP_ID 0xf1000000 0x100000>;
  reg = <0xf1000xxx ...>; // MBUS regs block
  #address/size-cells...

  internal-regs  {
      ranges = <0 INTERNAL_REGS_MAP_ID 0x100000>;
  }
}

ie the ranges should never be empty.

Discovery of the address of the mbus control registers is via the reg
property on its own node (which is untranslated), and all other
internal regs blocks will automatically translate as they are supposed
to (Thomas's work to make internal regs 0xd/0xf1 relies on this, AFAIK)

INTERNAL_REGS_MAP_ID is an invalid target ID value, defined to mean
the internal registers target. 0xFFFFFFFF is a better choice for this
than 0, because 0xFFFFFFFF is never going to be a valid target id, it
is too large.

Jason
