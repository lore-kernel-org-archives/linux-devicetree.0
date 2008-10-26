From: Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Subject: Re: GPIO - marking individual pins (not) available in device tree
Date: Sun, 26 Oct 2008 16:13:26 -0500
Message-ID: <4904DD76.7070706@genesi-usa.com>
References: <4900ED81.3040202@genesi-usa.com> <4900F90B.80703@firmworks.com>
	<4901032F.3090805@genesi-usa.com> <49011C42.2020101@firmworks.com>
	<49024646.3050300@genesi-usa.com> <49025DE0.6070403@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <49025DE0.6070403-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: linuxppc-dev list <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-discuss list <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



Mitch Bradley wrote:
> 
> I don't use device_type much, if at all, anymore.  Generic name + 
> compatible just works better than device_type + specific name.  When
 > I write code that has to find a node that is suitable for a given purpose,
 > I look for the existence of suitable methods and perhaps other properties.
 > I was just too hard to keep the list of device_type values properly
 > synchronized with all the possible things that you might want to infer
 > from that set of names.

The simple problem comes when you define a device_type for everything,
I do agree it's best not to add any *MORE* that aren't in the IEEE1275
or CHRP etc. bindings, but for those that still exist and are well
defined (serial port probably the best, but network devices too) I
think we should keep using them where possible and where relevant.

> device_type is one of those things that seemed like a good idea at the 
> time, but didn't work out as well as I had hoped.

I can imagine a scenario where you would want to perhaps have a serial
port, where you want to say a) that is is a serial port, b) that it is
for a specific purpose without creating some new standard or proprietary
property set and c) tell the world what kind of serial port it is.

How about name = "debug" or "modem" or something else, which gives you
a pretty name for what the port is for (and maybe matches the markings
on the outside of a case) but the device_type would always be "serial",
and compatible would give you "mpc5200b-psc-uart" or so. You can find
all the serial ports, you can find the serial port that is assigned to
the modem or debug (this may actually allow the driver to be informed
not to do anything crazy - if you've ever connected a modem to a port
that gets set up to output firmware debug data or whatever, you'll know
sometimes it's kind of difficult to bring the modem back out of it's
funk from being hammered with data for the duration of boot), and you
know which driver to attach to it.

I personally think while deprecate and shouldn't be used for new
definitions, the old ones work really well for devices it encompasses.
On the MPC8641D board I have here there are 4 network ports; in the
device tree they're all called ethernet, device_type "network",
compatible "gianfar" and have a model "TSEC" - in a real OF
implementation you shouldn't have to check for a "ping" method to
make sure it's ACTUALLY a network device :D

(I'd advocate all those ports being renamed to eTSEC{n} since that
matches the board documentation, for example, and while cell-index
tells you which port is is on the back of the board, this is not
user friendly (a simple "boot eTSEC0 tftpboot/kernel" is more
intuitive than cd /boot/ethernet@24000, .properties, backing out
if it wasn't the one you were looking for.. or assuming that the
lowest numbered "reg" is the first port on the back of the chassis
and finding out that is not how it's connected :)

I'm really big on descriptive device trees that I can just browse
and know what I am looking at without delving. There is already
too much needless cross-referencing in Linux as it is.

-- 
Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Genesi, Manager, Developer Relations
