From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH] arm: mvebu: support for the new Armada XP evaluation
 board(DB-MV784MP-GP)
Date: Thu, 31 Jan 2013 07:45:42 -0500
Message-ID: <20130131124542.GB7717@titan.lakedaemon.net>
References: <1359566774-27669-1-git-send-email-gregory.clement@free-electrons.com>
 <1359566774-27669-2-git-send-email-gregory.clement@free-electrons.com>
 <20130130173306.GO7717@titan.lakedaemon.net>
 <510959D5.1010305@free-electrons.com>
 <20130130181035.GP7717@titan.lakedaemon.net>
 <510A5E87.60509@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <510A5E87.60509-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
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
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Ike Pan <ike.pan-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, David Marlin <dmarlin-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jani Monoses <jani.monoses-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Simon Guinot <simon.guinot-jKBdWWKqtFpg9hUCZPvPmw@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Dan Frazier <dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Eran Ben-Avi <benavi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Leif Lindholm <leif.lindholm-5wv7dgnIgG8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chris Van Hoof <vanhoof-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Shadi Ammouri <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 31, 2013 at 01:07:35PM +0100, Gregory CLEMENT wrote:
> On 01/30/2013 07:10 PM, Jason Cooper wrote:
> > 
> > Gregory,
> > 
> > Adding devicetree-discuss.
> 
> I should have added it in in CC in my first version
> 
> > 
> > Guys, how do you prefer to handle plug-in RAM modules?  describe the
> > soldered-in amount, or?
> > 
> > On Wed, Jan 30, 2013 at 06:35:17PM +0100, Gregory CLEMENT wrote:
> >> On 01/30/2013 06:33 PM, Jason Cooper wrote:
> >>> On Wed, Jan 30, 2013 at 06:26:14PM +0100, Gregory CLEMENT wrote:
> >>>> This is the new Armada XP evaluation board from Marvell. It comes with
> >>>> a RS232 port over USB, a SATA link, an internal SSD, 4 Ethernet
> >>>> Gigabit links.
> >>>>
> >>>> Support for USB (Host and device), SDIO, PCIe will be added as drivers
> >>>> when they become available for Armada XP in mainline.
> >>>>
> >>>> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >>>> ---
> >>>>  arch/arm/boot/dts/Makefile         |    1 +
> >>>>  arch/arm/boot/dts/armada-xp-gp.dts |   94 ++++++++++++++++++++++++++++++++++++
> >>>>  2 files changed, 95 insertions(+)
> >>>>  create mode 100644 arch/arm/boot/dts/armada-xp-gp.dts
> >>>>
> > ...
> >>>> +	memory {
> >>>> +		device_type = "memory";
> >>>> +		reg = <0x00000000 0xC0000000>; /* 3 GB */
> >>>
> >>> Is this the soldered on the board amount, or the amount with an
> >>> expandable slot filled?
> >>
> >> It is not soldered, so you can change the amount of memory
> > 
> > Well, there's something we don't encounter too much in the embedded
> > world.  ;-)  I'm inclined to think the entry here should be the soldered
> > on amount, and the bootloader would (hypothetically) change the DT to
> > the probed amount.  But I haven't seen a precedent set yet...
> 
> Well on this board there is no soldered memory at all.

So it has two slots? 1GB and 2GB?

thx,

Jason.
