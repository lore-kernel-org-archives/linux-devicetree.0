From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH 04/14] bus: mvebu-mbus: Add static window allocation to
 the DT binding
Date: Tue, 11 Jun 2013 17:08:45 -0600
Message-ID: <20130611230845.GB13892@obsidianresearch.com>
References: <1370623671-7748-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130609014506.GB10027@obsidianresearch.com>
 <20130611135737.GC3996@localhost> <20835253.Agl4DfuI3k@wuerfel>
 <20130611215023.GA12649@obsidianresearch.com>
 <51B7A325.8070108@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51B7A325.8070108-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 12, 2013 at 12:22:29AM +0200, Sebastian Hesselbarth wrote:

> sorry to kick into this thread that late but Ezequiel made me think of
> address windows when asking on IRC. From what I can see from your and
> Arnd's proposal the only real difference is that having it Arnd's way
> allows you to have two or more windows mapped to e.g. devbus with
> totally independent address ranges - while yours requires one large
> window for all child devices?

Sorry, I'm having problems following the possessives in your paragraph
- which things are you comparing?

> Although, not thought to the bare end this could also work and maybe
> reflects the actual hardware more accuate:

I actually posted something like this a time ago, but Arnd's
suggestion to encode the target id in the address seems much clearer,
and more accurate, though a bit more work to parse.

It is 'better' in that the base addresses are in exactly one place -
the ranges of the mbus node. With marvell,mbus-target the base
addreses are strewn everywhere and now are difficult to change.

A main consideration here is that the bootloader needs to update the
base addresses - to support the 0xd0 vs 0xf1 internal-regs base
address issue. So I think that requirement alone is enough to make
marvell,mbus-target undesirable.

> When removing size from marvell,mbus-target above, mbus driver could
> also probe for required max size from the reg properties of the child
> nodes. Arnd already said that mbus isn't "simple-bus" anymore, why
> can't it just walk through the nodes and collect required windows?

With enough restrictions, I think it is pretty easy to parse
marvell,mbus-target, but you can employ the same restrictions to
simplify parsing the 2 cell address format too.

Jason
