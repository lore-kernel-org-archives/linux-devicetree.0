From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [RFC PATCH 4/4] ARM: Xilinx: Adding Xilinx board support
Date: Tue, 3 May 2011 09:52:20 +0100
Message-ID: <20110503085220.GL28001@n2100.arm.linux.org.uk>
References: <90477150.2231869.1304372815517.JavaMail.root@sz0140a.emeryville.ca.mail.comcast.net>
	<1319927287.2232106.1304373011082.JavaMail.root@sz0140a.emeryville.ca.mail.comcast.net>
	<20110502230118.GE28001@n2100.arm.linux.org.uk>
	<201105030958.14698.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201105030958.14698.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: nicolas pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, johnlinn-Wuw85uim5zDR7s880joybQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 03, 2011 at 09:58:14AM +0200, Arnd Bergmann wrote:
> On Tuesday 03 May 2011 01:01:18 Russell King - ARM Linux wrote:
> > It is preferable to use the same mapping, as it ensures that you're not
> > going to create incompatible aliases.
> 
> Is aliasing a problem for MMIO mappings? I would think that you can
> ioremap registers anywhere and as often as you want because they are
> never cacheable.

Provided the type and sharability is identical then there is no problem.
I wasn't referring to multiple ioremap()s of the same region - that
should be fine as the same attributes will be used.  If you mix ioremap()
and iotable_init() then you _could_ have problems if you don't use
MT_DEVICE in the iotable.

What I'm basically saying is that mixing the methods of creating these
mappings makes it much easier to get tripped up over these issues.
