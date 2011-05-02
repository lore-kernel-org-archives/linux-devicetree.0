From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [RFC PATCH 4/4] ARM: Xilinx: Adding Xilinx board support
Date: Tue, 3 May 2011 00:01:18 +0100
Message-ID: <20110502230118.GE28001@n2100.arm.linux.org.uk>
References: <90477150.2231869.1304372815517.JavaMail.root@sz0140a.emeryville.ca.mail.comcast.net>
	<1319927287.2232106.1304373011082.JavaMail.root@sz0140a.emeryville.ca.mail.comcast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1319927287.2232106.1304373011082.JavaMail.root-2//McUVsTWSpNjDeV5bKuMcQQQXLS/gekU1+q43GAIqQvBXZIOnqxg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: johnlinn-Wuw85uim5zDR7s880joybQ@public.gmane.org
Cc: nicolas pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, May 02, 2011 at 09:50:11PM +0000, johnlinn-Wuw85uim5zDR7s880joybQ@public.gmane.org wrote:
> Seems easy enough assuming we don't need the SCU early for the core count
> and can get that from the device tree.

Beware.  Things may not be that trivial when you start considering some
of the weirdnesses that some vendors start coming out with.

> Since the SCU and part of the GIC end up in the same 4K page they need to be
> together (unless I'm thinking about that wrong).
> 
> SCU 0xF8000000
> GIC_CPU 0xF8000100
> GIC_DIS 0xF8001000

It is preferable to use the same mapping, as it ensures that you're not
going to create incompatible aliases.

But, before we get too bogged down with this, please realise that it is
possible to setup early mappings from the device tree for things like the
SCU.  Maybe not using ioremap(), but I'm sure we can find some way to use
the iotable_init() stuff to setup some early mappings from DT for this
stuff.
