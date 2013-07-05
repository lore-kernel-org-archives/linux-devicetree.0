From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v6 00/21] MBus DT binding: PCIe strikes back
Date: Sat, 6 Jul 2013 00:54:22 +0200
Message-ID: <201307060054.23086.arnd@arndb.de>
References: <1373060372-32357-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130705220820.GA11787@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130705220820.GA11787-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
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
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Saturday 06 July 2013, Jason Gunthorpe wrote:
> This is a good try, but this coding doesn't work...
> 
> Recall the long discussion that came up during the original
> development of this binding. The OF spec says this:
> 
>  In particular, the phys.hi fields of the child address spaces in the
>  "ranges" property for PCI does not contain
>  the same information as "reg" property entries within PCI nodes. The
>  only information that is present in
>  "ranges" phys.hi entries are the non-relocatable, prefetchable and
>  the PCI address space bits for which the en-
>  try applies. I.e., only the n, p and ss bits are present; the
>  bbbbbbbb, ddddd, fff and rrrrrrrr fields are 0.
> 
>  When an address is to be mapped through a PCI bus bridge node, the
>  phys.hi value of the address to be mapped
>  and the child field of a "ranges" entry should be masked so that only
>  the ss bits are compared. I.e., the only
>  portion of phys.hi that should participate in the range determination
>  is the address space indicator (the ss bits).
> 
> Which forbids (0x82000800 .. ..) from being in a ranges

ah, and I thought Ezequiel was being more clever than what I had suggested

> I don't have an idea how to encode MBUS_ID in the PCI-E ranges :(
> 
> Arnd? Didn't you have some idea?

The way I described it during the last review, I suggested using
the middle cell of the PCI address here. Since the PCIe port
is 32 bit only, it's otherwise unused. We can do one of two things
here:

a) put the port number in the second cell

   0x82000000 1 0xe0000000 MBUS_ID(0x04, 0xe8) 0xe0000000 0 0x08000000 /* Port 0.0 MEM */
   0x82000000 2 0xe0000000 MBUS_ID(0x04, 0xe9) 0xe0000000 0 0x08000000 /* Port 1.0 MEM */

b) translate the entire MBUS space here

   0x82000000 0 0 0 0 0x1000000 0 /* all MBUS_IDs */

In both cases, the individual ports would have another non-empty
ranges property

a) 
   0x82000000 1 0xe0000000 0x82000000 0 0xe0000000 0x08000000 /* ranges for port 0.0 */

b)
   0x82000000 MBUS_ID(0x04, 0xe8) 0xe0000000 0x82000000 0 0xe0000000 0 0x08000000

I left out the change I suggested in my other reply to not describe
the aperture in this node but translate the entire 4GB space.

	Arnd
