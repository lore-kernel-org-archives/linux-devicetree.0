From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 11/12] ARM: mvebu: Relocate Armada 370 PCIe device
 tree nodes
Date: Tue, 18 Jun 2013 19:15:35 +0200
Message-ID: <20130618191535.44fe595c@skate>
References: <1371554737-25319-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1371554737-25319-12-git-send-email-ezequiel.garcia@free-electrons.com>
 <201306181829.35514.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201306181829.35514.arnd-r2nGTMty4D4@public.gmane.org>
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
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Arnd Bergmann,

On Tue, 18 Jun 2013 18:29:35 +0200, Arnd Bergmann wrote:

> To clarify my earlier comment, I think it would be nicer to write this as
> 
>                        ranges =
>                               <0x82000000 0 0x40000    0xffff0001 0x40000 0 0x00002000
>                                0x82000000 0 0x80000    0xffff0001 0x80000 0 0x00002000
>                                0x82000000 1 0 MBUS_ID(0x12, 0x34) 0  1 0
>                                0x82000000 2 0 MBUS_ID(0x13, 0x34) 0  1 0
>                                0x81000000 1 0 MBUS_ID(0x12, 0x35) 0 0 0x10000;
>                                0x81000000 2 0 MBUS_ID(0x13, 0x35) 0 0 0x10000>;
> 
> The MBUS_ID numbers above are made up since I don't know them, but this way you can
> describe how the entire 4GB MMIO address space of the PCI bus is mapped into the
> MBUS address space.

This is *NOT* possible because we don't know in advance how much memory
space and I/O space each PCIe device will require.

Arnd, we've discussed this at length with you while getting the PCIe
driver merged, and we've explained this to you numerous times. Could
you please understand that *any* of your proposal that suggests writing
down static windows for PCIe devices will *not* work?

> Does this make sense?

Not at all. Please read once again the hundreds of e-mails we've
exchanged about the need for dynamic windows for PCIe devices, which
lead us to have the emulated PCI-to-PCI bridge stuff. I'm starting to
be fed up to re-explain this to you over-and-over again.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
