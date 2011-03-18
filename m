From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: RFC: Platform data for onboard USB assets
Date: Sat, 19 Mar 2011 09:37:43 +1100
Message-ID: <1300487863.22236.1289.camel@pasglop>
References: <20110311165642.GA9996@kroah.com>
	<20110317214042.GQ31411@opensource.wolfsonmicro.com>
	<20110317214736.GA29014@kroah.com> <201103172333.01474.arnd@arndb.de>
	<4D82979B.2050003@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4D82979B.2050003-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2011-03-17 at 23:22 +0000, Andy Green wrote:
> 
> Is there actually a need for sort of not platform_data but universal 
> vid_pid_specific_usb_device_option_data coming from the board
> definition 
> file or bootloader for *pluggable* usb devices?  udev seems to be
> well 
> established doing that already in a generic, not-platform-specific
> way 
> that can go in all distros and so on nicely.  Maybe this is just my 
> impoverished imagination and people do want, say, some kinds of USB
> mice 
> to operate at higher DPI or whatever when plugged in a specific board 
> because it is that board. 

Except that vid/pid are the -WRONG- way to do that. Your device is
on-board, the proper way to identify it uniquely is it's topological
location, ie path of HW port numbers.

Cheers,
Ben.
