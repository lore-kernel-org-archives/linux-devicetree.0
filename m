From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 03/12] bus: mvebu-mbus: Add static window allocation to
 the DT binding
Date: Tue, 18 Jun 2013 20:39:50 +0200
Message-ID: <201306182039.50736.arnd@arndb.de>
References: <1371554737-25319-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130618174622.GD2204@obsidianresearch.com> <51C0A5F8.8030300@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51C0A5F8.8030300-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 18 June 2013, Sebastian Hesselbarth wrote:
> On 06/18/2013 07:46 PM, Jason Gunthorpe wrote:
> > On Tue, Jun 18, 2013 at 08:25:28AM -0300, Ezequiel Garcia wrote:
> >> +
> >> +IIAA0000
> >> +
> >> +Where:
> >> +  -- I = Marvell defined target ID for programmable windows
> >> +  -- A = Marvell defined target attributes for programmable windows
> >
> > I thought we agreed to something like:
> >
> > SIAA0000
> >
> > Where 'S' is the designator for the special items like PCI-E and
> > internal-regs. 0 = normal target ids, 0xF = special ids.
> >
> > The target is only 4 bits, the attr is 8, so a little doc update to
> > clarify this should be enough, no need to change the DTs.
> 
> +1 for SIAA0000, as it allows to use MBUS_ID also for those fake
> windows. It makes it more readable IMHO.

+1

> Also allows you to have up to 40b offset, which might be important
> with LPAE enabled.

Not with the current generation I think, since the mbus windows are
32 bit only, but it would avoid having to come up with a new format
for a potential future-generation mbus that has wider address.

	Arnd
