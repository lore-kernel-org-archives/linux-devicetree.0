From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH] irqchip: add support for Marvell Orion SoCs
Date: Sat, 4 May 2013 13:58:39 -0400
Message-ID: <20130504175839.GM31290@titan.lakedaemon.net>
References: <1367519104-19677-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <20130502185322.GA29333@obsidianresearch.com>
 <5182B902.7040908@gmail.com>
 <20130502193510.GA29522@obsidianresearch.com>
 <5182C322.3030304@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5182C322.3030304-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, May 02, 2013 at 09:48:50PM +0200, Sebastian Hesselbarth wrote:
> On 05/02/2013 09:35 PM, Jason Gunthorpe wrote:
> >I have kirkwood HW but I haven't had time to make newer kernels run on
> >it, otherwise I'd test it too :(
> 
> I also have kirkwood HW but that will cut me from email as I use it as
> relay server ;) Maybe I can turn it into a test bed for a while.
> 
> There is also Orion5x and Discovery Innovation (mv78xx0) to be tested.
> 
> @Jason Cooper: I will merge both irqchip and dove patches into one
> patch set. I wasn't earlier because I didn't want the above SoCs to
> slow down patch integration. And I will split dtsi changes into
> separate patches as requested.

Understood.  I'd prefer to keep patches developed together in the same
series, that way, discussions about who is taking what and which patch
depends on what are all in the same thread of the archives.

It's difficult because some series (eg pcie) touch many different areas
and _need_ to be kept together because of the chain of dependencies.
Most other series though, aren't in that situation.

thx,

Jason.
