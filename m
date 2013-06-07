From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 03/14] bus: mvebu-mbus: Introduce device tree binding
Date: Fri, 7 Jun 2013 21:53:03 +0200
Message-ID: <201306072153.03855.arnd@arndb.de>
References: <1370623671-7748-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <201306072110.35856.arnd@arndb.de>
 <20130607194430.GA7854@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130607194430.GA7854-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
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
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 07 June 2013, Jason Gunthorpe wrote:
> We have a minimum requirement that the bootloader setup internal regs,
> so the minimum required DT bindings is going to be this:
> 
> mbus {
>   compatible = ...
>   ranges = <INTERNAL_REGS_MAP_ID 0xf1000000 0x100000>;
>   reg = <0xf1000xxx ...>; // MBUS regs block
>   #address/size-cells...
> 
>   internal-regs  {
>       ranges = <0 INTERNAL_REGS_MAP_ID 0x100000>;
>   }
> }
> 
> ie the ranges should never be empty.

Right, that's what I thought.

> Discovery of the address of the mbus control registers is via the reg
> property on its own node (which is untranslated), and all other
> internal regs blocks will automatically translate as they are supposed
> to (Thomas's work to make internal regs 0xd/0xf1 relies on this, AFAIK)
> 
> INTERNAL_REGS_MAP_ID is an invalid target ID value, defined to mean
> the internal registers target. 0xFFFFFFFF is a better choice for this
> than 0, because 0xFFFFFFFF is never going to be a valid target id, it
> is too large.

Can you explain to me why it is an invalid target ID value? Is it
treated very differently by the mbus register setup than all the
others? I guess we can define it as something else to make a valid
target ID, by using one or more of the remaining bits in the first
address cell.

	Arnd
