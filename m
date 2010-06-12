From: Olof Johansson <olof@lixom.net>
Subject: Re: Request review of device tree documentation
Date: Sat, 12 Jun 2010 17:15:54 -0500
Message-ID: <20100612221554.GA17876@lixom.net>
References: <AANLkTilK4YkRMJqlcRDOAlGBzpdlZuSo9NF5NrRNocHT@mail.gmail.com>
	<33BD8E86-9397-432A-97BF-F154812C157B@digitaldans.com>
	<AANLkTilv6TtPZs0DAwd8JlSV_J3VvMsvtVVOOeQauOIn@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
Content-Disposition: inline
In-Reply-To: <AANLkTilv6TtPZs0DAwd8JlSV_J3VvMsvtVVOOeQauOIn@mail.gmail.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: microblaze-uclinux@itee.uq.edu.au, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>, Mitch Bradley <wmb@firmworks.com>, Dan Malek <ppc6dev@digitaldans.com>, Jeremy Kerr <jeremy.kerr@canonical.com>
List-Id: devicetree@vger.kernel.org

On Sat, Jun 12, 2010 at 12:53:59AM -0600, Grant Likely wrote:

> I also changed the property in the cpu nodes from model to compatible
> so that the exact CPU version can be specified.  This isn't actually
> in any spec anywhere, but I need something to properly identify the
> different ARM cores.

I don't see why this has to be in the device tree. It's not there on PPC.
The exact CPU version is found through the PVR register on PPC, ARM also
has cpu version and feature registers for runtime probing.


-Olof
