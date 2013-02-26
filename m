From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/2] gpio: gpio-generic: Fix bug in big endian bit
 conversion
Date: Tue, 26 Feb 2013 07:52:28 +0000
Message-ID: <20130226075228.A963F3E0AEF@localhost>
References: <1360060383-16880-1-git-send-email-andreas@gaisler.com>
 <1360060383-16880-2-git-send-email-andreas@gaisler.com>
 <20130209145855.D517E3E328E@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130209145855.D517E3E328E@localhost>
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
To: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, software-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 09 Feb 2013 14:58:55 +0000, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> On Tue,  5 Feb 2013 11:33:02 +0100, Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org> wrote:
> > The swap to convert LE to BE in bgpio_pin2mask_be should be on byte level, not
> > on bit level.
> > 
> > Signed-off-by: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
> > ---
> >  drivers/gpio/gpio-generic.c |    5 ++++-
> >  1 files changed, 4 insertions(+), 1 deletions(-)
> > 
> > diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
> > index 05fcc0f..7f11537 100644
> > --- a/drivers/gpio/gpio-generic.c
> > +++ b/drivers/gpio/gpio-generic.c
> > @@ -112,7 +112,10 @@ static unsigned long bgpio_pin2mask(struct bgpio_chip *bgc, unsigned int pin)
> >  static unsigned long bgpio_pin2mask_be(struct bgpio_chip *bgc,
> >  				       unsigned int pin)
> >  {
> > -	return 1 << (bgc->bits - 1 - pin);
> > +	unsigned int bit = pin & 0x7; /* Bit number within byte */
> > +	unsigned int base = pin - bit; /* Pin that is bit 0 within byte */
> > +
> > +	return 1 << ((bgc->bits - base - 8) + bit); /* shifted base + bit */
> 
> Ah, sorry for my previous reply. I see you have seen gpio-generic.  :-)
> 
> No, the original calculation is correct. BE and LE bit numbering are
> opposite, bit Linux always uses LE numbers as far as bit masks are
> concerned. Therefore pin 0 is the most significant bit, and
> pin (nr_bits-1) is the least significant bit.

Hi Andreas,

Actually I'm wrong here (at least partially) after looking closer at the
generic gpio driver. The problem is that things get messed up on 16 or
32 bit access depending on how the hardware expects to be accessed.
bgpio always uses iowrite/ioread for register access which is inherently
little endian, but if the hardware is wired up as a big-endian device
then you have to do the fiddly bit you did above to get the bit
positions to line up where you what then. So, there could potentially be
4 different ways to count bits on a value ioread() from a gpio register:

little-endian, LSB = 0 (sane)
little-endian, MSB = 0 (odd)
big-endian (bytes swapped), MSB = 0 (common on BE platforms)
big-endian (bytes swapped), LSB = 0 (why are you making my life hard?)

We /could/ have a ioread32be/write32be mode in the driver, but I don't
think that is the right approach. It means we need yet another set of
accessors for register except using the 'be' variants. Blech. What I'd
actually like to do is add a bitmask field to the gpio_desc which can be
calculated ahead of time to whatever madness is required from the way
the device is wired. Then the access routines don't need to even care.
they just apply the bitmask to ioread/iowrite and it doesn't even need
to know what the bit number actually is. The new support for gpio_desc
in the core code makes this feasable.

g.
