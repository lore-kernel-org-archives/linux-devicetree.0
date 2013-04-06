From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 2/9] arm: mvebu: Align the internal registers virtual
 base to support LPAE
Date: Sat, 6 Apr 2013 10:31:45 +0200
Message-ID: <201304061031.45598.arnd@arndb.de>
References: <1365193444-13441-1-git-send-email-gregory.clement@free-electrons.com>
 <201304052250.28641.arnd@arndb.de> <515F3E96.4040307@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <515F3E96.4040307@free-electrons.com>
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
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Ike Pan <ike.pan@canonical.com>, Grant Likely <grant.likely@secretlab.ca>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Leif Lindholm <leif.lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Nadav Haklai <nadavh@marvell.com>, Jon Masters <jcm@redhat.com>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Chris Van Hoof <vanhoof@canonical.com>, Nicolas Pitre <nico@fluxnic.net>, linux-kernel@vger.kernel.org, Maen Suleiman <maen@marvell.com>
List-Id: devicetree@vger.kernel.org

On Friday 05 April 2013, Gregory CLEMENT wrote:
> On 04/05/2013 10:50 PM, Arnd Bergmann wrote:
> > On Friday 05 April 2013, Gregory CLEMENT wrote:
> >> From: Lior Amsalem <alior@marvell.com>
> > 
> > This is a surprising limitation. Can you extend the above text to go into more
> > detail where that alignment requirement comes from?
> > 
> 
> The explanation I had was that in LPAE section size is 2MB, in earlyprintk we map
> the internal registers and it must be section aligned.
> 

Ah, I see. Please put that in the text then.

	Arnd
