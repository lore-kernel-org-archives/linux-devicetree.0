From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Appended DTB files for multi-machine kernels
Date: Thu, 4 Jul 2013 23:34:36 +0200
Message-ID: <201307042334.37161.arnd@arndb.de>
References: <51D5A938.30607@gmail.com> <20130704171148.GJ27646@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130704171148.GJ27646@sirena.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>
Cc: stigge@antcom.de, Stephen Warren <swarren@nvidia.com>, Magnus Damm <magnus.damm@gmail.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Sven Neumann <s.neumann@raumfeld.com>, Daniel Mack <zonque@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thursday 04 July 2013, Mark Brown wrote:
> On Thu, Jul 04, 2013 at 06:56:24PM +0200, Daniel Mack wrote:
> 
> > Unless I missed some recent discussion, this case is not easy to handle.
> > Yes, I know that these kind of things should be handled by a
> > next-generation bootloader, but in our case, we want to avoid a loader
> > update of already shipped hardware by all means.
> 
> There was some discussion about appending multiple DTBs recently.  I
> can't actually recall anything about it though so that's not an entirely
> helpful thing...

Yes, it keeps coming up, I think by now everybody agreed it's a good
idea to extend the ATAGS compat mode, but so far nobody has implemented
it. Magnus Damm was very interested in this feature last year and
was planning to work on it, but I don't know how far he got.

> > As a solution, I'm thinking of a small framework that could for example
> > work as follows.
> 
> > a) A small mechanism allows storing multiple DTB binary files inside the
> > kernel binary at compile time, and a simple function can extract them
> > again by name at runtime (something like what the firmware framework
> > does, but I don't know if that one can be used at such an early stage in
> > the boot process).
> 
> Another way of skinning this would be for either the kernel to contain
> a set of machine ID to compatible string mappings or for the device
> trees for the boards to have an additional properties giving the machine
> IDs that the boards match.  The kernel could then look for multiple DTBs
> appended to the image and try to pick one based on ATAGs.

IIRC there is actually an unused field in the dtb header that could
be used to match a board ID.

	Arnd
