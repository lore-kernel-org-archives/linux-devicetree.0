From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3] patches to allow DTB to be appended to the ARM zImage
Date: Sun, 12 Jun 2011 11:45:28 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.1106121144080.2142@xanadu.home>
References: <1307858800-16712-1-git-send-email-nicolas.pitre@linaro.org>
	<201106121615.24059.arnd@arndb.de>
	<20110612143428.GI10283@n2100.arm.linux.org.uk>
	<201106121701.22418.arnd@arndb.de>
	<20110612153536.GL10283@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110612153536.GL10283-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, =?ISO-8859-15?Q?Petr_=A6tetiar?= <ynezz-knWk7/PSn+s@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 12 Jun 2011, Russell King - ARM Linux wrote:

> On Sun, Jun 12, 2011 at 05:01:22PM +0200, Arnd Bergmann wrote:
> > Of course it should override the device tree, I'm not arguing that.
> > All I'm saying is that we don't need to special-case this or support
> > both formats once the kernel is there as long as we move the information
> > into appropriate DT-representation of the same data.
> 
> You're arguing for it to be parsed by whatever fragment of assembly code
> we have to place around the zImage to merge it into DT.
> 
> And yes, it's going to have to be assembly code because we don't have a
> C environment at that point which can run in a relocatable way.

The prototype patch translating ATAGs into DT defer that processing to C 
code.  Doing that in assembly is of course madness.


Nicolas
