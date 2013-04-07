From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC PATCH] CLK: Allow parent clock and rate to be configured in
 DT.
Date: Sun, 7 Apr 2013 15:26:23 +0200
Message-ID: <20130407132623.GP1906@pengutronix.de>
References: <20130319170933.28337.50448.stgit@localhost>
 <CAOMZO5ASkvquyzPCEGObvB5Xh9bDPTJ2zx26eOUJT_Vb36Bn3Q@mail.gmail.com>
 <CAKGA1bkWLrOs15ni=8D__BvuG6kvqkeeLZGOLrVZY9g0q0z4Bg@mail.gmail.com>
 <6581638.FPkNsv6peb@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6581638.FPkNsv6peb@flatron>
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
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Turquette <mturquette-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Apr 06, 2013 at 03:21:19PM +0200, Tomasz Figa wrote:
> Hi,
> 
> [RANT]
> 
> I tend to disagree about this whole hype about device tree usage for other 
> things than pure hardware description. I don't think device tree should be  
> a way to force some kind of new world order, but rather a more convenient 
> and more maintainable (than board files) way of support hardware platforms 
> in Linux kernel.

Honestly I'm annoyed by this aswell. The devicetree contains a nice and
complete hardware description and it seems convenient to put hardware
related configuration data there aswell.

The problem is that hardware description and configuration data are two
completely different sets of data. The hardware description is static
for a given board and should (ideally) never change. The configuration
data instead is often usecase specific and changes over the lifetime of
a board. The configuration data can only handle a single (or maybe a
table of) static setup(s). It's a good way to specify a sane default or
a very special setup, but doesn't handle the case when some OS (or
version thereof) wants to have a static setup and another wants to
figure out the same data dynamically.

For these reasons I am against throwing the two data sets into a single
pot. Still I also want to have the devicetree way to configure some
static setup items.

People are already working on devicetree overlays.  Maybe it would be
possible to have some kind of configuration overlay for the devicetree.
This would make it possible to store the data in different places and to
exchange the configuration data while keeping the hardware description.
Also board designers could describe the hardware and give one or more
usage hints without forcing anybody to actually use them.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
