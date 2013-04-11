From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH v3 5/9] ARM: dts: Add a 64 bits version of the skeleton
 device tree
Date: Thu, 11 Apr 2013 19:35:05 -0400
Message-ID: <20130411233505.GR28693@titan.lakedaemon.net>
References: <1365461538-30702-1-git-send-email-gregory.clement@free-electrons.com>
 <1365461538-30702-6-git-send-email-gregory.clement@free-electrons.com>
 <20130411181200.GP28693@titan.lakedaemon.net>
 <5167219B.8070404@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <5167219B.8070404@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Ike Pan <ike.pan@canonical.com>, Grant Likely <grant.likely@secretlab.ca>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Leif Lindholm <leif.lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Jon Masters <jcm@redhat.com>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Chris Van Hoof <vanhoof@canonical.com>, Nicolas Pitre <nico@fluxnic.net>, linux-kernel@vger.kernel.org, Maen Suleiman <maen@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Sh
List-Id: devicetree@vger.kernel.org

On Thu, Apr 11, 2013 at 10:48:27PM +0200, Gregory CLEMENT wrote:
> Hi Jason,
> 
> On 04/11/2013 08:12 PM, Jason Cooper wrote:
> > On Tue, Apr 09, 2013 at 12:52:13AM +0200, Gregory CLEMENT wrote:
> >> From: Lior Amsalem <alior@marvell.com>
> >>
> >> In order to be able to use more than 4GB address-cells and size-cells
> >> have to be set to 2
> >>
> >> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> >> Signed-off-by: Lior Amsalem <alior@marvell.com>
> >> ---
> >>  arch/arm/boot/dts/skeleton64.dtsi |   13 +++++++++++++
> >>  1 file changed, 13 insertions(+)
> >>  create mode 100644 arch/arm/boot/dts/skeleton64.dtsi
> > 
> > Applied to mvebu/dt
> > 
> > Gregory,
> > 
> > Once I can pull in Thomas' pci work, you'll just need to rebase patches
> > 1, and 6 - 9 against mvebu/dt.
> > 
> 
> Yes sure! When did you plan to pull the dts part of Thomas' pci work?
> Is there still anything left to prevent to pull this part?

Good call, I'm just waiting for the last Ack Thomas said he needs on the
first of/pci patch.  My head has been fuzzy with hay fever for the past
three days.  Obviously, I can pull in the dts portion.

thx,

Jason.
