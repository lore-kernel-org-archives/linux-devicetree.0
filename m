From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 5/5] arm: dts: Convert mvebu device tree files to 64 bits
Date: Thu, 21 Mar 2013 21:31:07 +0000
Message-ID: <201303212131.07629.arnd@arndb.de>
References: <1363883179-1361-1-git-send-email-gregory.clement@free-electrons.com>
 <201303211903.52383.arnd@arndb.de> <20130321201807.7cb04978@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130321201807.7cb04978@skate>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Ike Pan <ike.pan@canonical.com>, Grant Likely <grant.likely@secretlab.ca>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Leif Lindholm <leif.lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Nadav Haklai <nadavh@marvell.com>, Jon Masters <jcm@redhat.com>, devicetree-discuss@lists.ozlabs.org, Gregory CLEMENT <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Chris Van Hoof <vanhoof@canonical.com>, Nicolas Pitre <nico@fluxnic.net>, linux-kernel@vger.kernel.org, Maen Suleiman <maen@marvell.com>, Shadi Ammouri <shadi@marvell.com>, Ol
List-Id: devicetree@vger.kernel.org

On Thursday 21 March 2013, Thomas Petazzoni wrote:
> In the mean time can we do something like:
> 
>         soc {
>                 compatible = "simple-bus";
>                 range = <...>;
> 
>                 [... all the peripherals ...]
>         };
> 
> with the range = <...> property converting the peripheral registers
> base address (expressed as offsets in the reg = <...> properties of the
> subnodes) into the absolute physical address?

Yes, that is what Rob suggested you do.
 
> I'm planning to work on the DT binding for the mvebu-mbus driver as
> soon as the PCIe driver gets accepted, but it would be good to have an
> intermediate solution to get the LPAE support in.

Sounds good.

	Arnd
