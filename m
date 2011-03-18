From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: RFC: Platform data for onboard USB assets
Date: Sat, 19 Mar 2011 09:54:09 +1100
Message-ID: <1300488849.22236.1296.camel@pasglop>
References: <20110311165642.GA9996@kroah.com>
	<20110317214042.GQ31411@opensource.wolfsonmicro.com>
	<20110317214736.GA29014@kroah.com> <201103172333.01474.arnd@arndb.de>
	<20110317225328.GB31581@kroah.com> <4D8296D1.9060106@linaro.org>
	<20110317232503.GA14561@kroah.com>  <4D830CEC.4040608@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4D830CEC.4040608-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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

On Fri, 2011-03-18 at 07:42 +0000, Andy Green wrote:
> 
> No, if you read Arnd's post you will find Device Tree does not support 
> targeting USB devices yet, and if you further read the 1998 document he 
> points to as the basis of actually implementing it, it seems to me at 
> least it'll be a little project yet to do that on Linux side.

You are getting seriously full of sh*t here. Read again what Arnd said
rather than twisting it to try to make your point.

The age of the OF binding document for USB has no relevance. The fact
that it's a very simple binding however does. As Arnd mention, nobody
says that somebody/something has to generate a full and complete
representation of USB for your board, that would be beyond the scope.

However, it should be trivial to layout in the fixed part of the board
device-tree nodes representing on-board (fixed) devices with the right
amount of properties for allowing the linkage to happen between those
nodes and the Linux usb_device object.

Basically it boils down to one property afaik, "reg". That's about it
(oh and possibly #address-cells and compatible for hubs that are on the
way to the device if any). About 15mn of work if you are familiar with
the .dts syntax, maybe twice as much if you are not.  

Cheers,
Ben.
