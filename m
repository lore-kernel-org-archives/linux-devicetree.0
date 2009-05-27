From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Wed, 27 May 2009 13:25:53 -0700 (PDT)
Message-ID: <20090527.132553.40558501.davem@davemloft.net>
References: <20090527192909.GA32398@flint.arm.linux.org.uk>
	<4A1D9A1E.80603@freescale.com> <4A1D9A66.5020002@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <4A1D9A66.5020002-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: rmk+lkml-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Date: Wed, 27 May 2009 14:54:14 -0500

> How does a Linux driver normally get a MAC address if it's not
> passed via the device tree and it isn't already programmed in the
> hardware?  Is there some file in /etc that stores these things?

It depends.  Some devices have EEPROM's that store the permanently
assigned MAC address, some have NVRAM for this, and yet other's put it
into the PCI ROM.

Some platforms that have real OF device trees often do not put the
permanent MAC address into the EEPROM or NVRAM even if it is
customary to do so on a particular device.  The MAC has to be
obtained from the OF device tree.
