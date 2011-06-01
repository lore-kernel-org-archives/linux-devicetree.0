From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC PATCH v3 2/2] dt: add custom device creation to platform bus
	scan
Date: Wed, 1 Jun 2011 23:29:20 +0200
Message-ID: <201106012329.20651.arnd@arndb.de>
References: <1306359073-16274-1-git-send-email-robherring2@gmail.com>
	<4DE66E39.2070300@gmail.com>
	<BANLkTimTdVKspjJ8GD4M90wiKCC0SzkgpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <BANLkTimTdVKspjJ8GD4M90wiKCC0SzkgpA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 01 June 2011, Grant Likely wrote:
> >
> > Shouldn't the hierarchy in linux reflect the h/w? It seems a bit pointless
> > to me to create a device just to create another device. amba_bus is already
> > a bit strange in that it is not really a bus type, but a certain class of
> > peripherals.
> >
> > I'd like to hear Grant's thoughts on this.
> 
> AMBA and platform_devices are "special" in that they don't have
> requirements on their parent device.  I see absolutely zero issue with
> having platform_device and amba_device as siblings.

Hmm, if we accept that platform and AMBA devices are just different from
all the others, maybe we can do a simpler solution and just hardcode that
difference in the of_platform_bus_create function. It probably doesn't
hurt if we grow a handful of these at most, as long as we wouldn't add
code for a lot of different bus types to the common probing function.

	Arnd
