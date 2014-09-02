From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: Formal license ambiguity in arch/arm/boot/dts/sun?i-a*.dts
Date: Tue, 2 Sep 2014 11:40:02 +0100
Message-ID: <20140902104002.GN30401@n2100.arm.linux.org.uk>
References: <20140731192016.GA6869@excalibur.cnev.de>
 <20140803130430.GY3952@lukather> <201408031959.27607.arnd@arndb.de>
 <20140804192510.GF3952@lukather>
 <20140804212317.GL30282@n2100.arm.linux.org.uk>
 <20140807132023.GG15297@lukather> <20140902102206.GU15297@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20140902102206.GU15297@lukather>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: devicetree@vger.kernel.org, khilman@linaro.org, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Olof Johansson <olof@lixom.net>, Karsten Merker <merker@debian.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 02, 2014 at 12:22:06PM +0200, Maxime Ripard wrote:
> On Thu, Aug 07, 2014 at 03:20:23PM +0200, Maxime Ripard wrote:
> > Hi Russell,
> > 
> > On Mon, Aug 04, 2014 at 10:23:17PM +0100, Russell King - ARM Linux wrote:
> > > On Mon, Aug 04, 2014 at 09:25:10PM +0200, Maxime Ripard wrote:
> > > > On Sun, Aug 03, 2014 at 07:59:27PM +0200, Arnd Bergmann wrote:
> > > > > I would actually prefer if we could migrate a lot of these files to BSD license,
> > > > > provided the original authors agree. We want the dtb blobs to be embeddable into
> > > > > boot loaders of any license.
> > > > 
> > > > Even though I'd be open to having my contributions to DTBs under the
> > > > BSD, is this really a thing?
> > > > 
> > > > I mean, for all I know, an OS/Bootloader would just parse a documented
> > > > binary file, and I don't see any derivative work there.
> > > 
> > > How does the OS/Bootloader end up with that binary file?
> > > 
> > > For the sake of argument, let's say that the BSDs want to move to DT on
> > > ARM.  Great, they convert over to parsing our DT blobs.
> > > 
> > > However, they can't distribute the binary DT blobs to their users without
> > > coming up against the problems of the GPL wrt binary distribution.
> > > 
> > > They could distribute the source files, but remember that many of those
> > > are currently GPL licensed, so they'd probably end up having to package
> > > them entirely separately, if they're willing to do that at all.
> > > 
> > > Or they could decide to ignore us altogether, and do their own DT stuff,
> > > maybe partially implementing our properties, or maybe coming up with
> > > different and/or incompatible properties - which would be bad because
> > > we now end up with two ways to describe the same hardware in active use.
> > > 
> > > I suspect the final option is the one they'd choose, and it's in our
> > > interest that _that_ doesn't happen.
> > 
> > Ah, yes, it's not really about a fear of a GPL-spread, but rather a
> > concern about the source distribution. Makes sense.
> > 
> > How should we deal with such relicensing?
> 
> Ping?
> 
> Are we doing this on a per platform basis? Should we enforce this dual
> licensing for the future DTS patches? If so, starting from when?

I have no answers to your questions - I put the question a number of
times to Grant directly, and have been totally ignored.

So, I think we just do whatever we think is the correct approach.

Remember, when you change the licensing on something which has had
multiple contributors, you need to seek the permission from everyone
how contributed to it - so it will have to be done on a per platform
and per-SoC basis.

I would also strongly suggest that future DTS files should be dual
licensed from the start, and that we require contributions for the
DTS files to be under both licenses.

-- 
FTTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
according to speedtest.net.
