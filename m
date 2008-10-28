From: Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
Subject: Re: GPIO - marking individual pins (not) available in device tree
Date: Tue, 28 Oct 2008 17:11:58 +0300
Message-ID: <20081028141158.GA9650@oksana.dev.rtsoft.ru>
References: <7b6eafc46f644dea59fbf0af17dbc005@localhost>
Reply-To: avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7b6eafc46f644dea59fbf0af17dbc005@localhost>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Konstantinos Margaritis <markos-VYMTaqK72Q4@public.gmane.org>
Cc: linuxppc-dev list <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-discuss list <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 28, 2008 at 02:31:29PM +0100, Konstantinos Margaritis wrote:
> 
> Pardon my intrusion in the conversation, but I just couldn't not comment on
> this:
> 
> On Tue, 28 Oct 2008 12:50:03 +1100, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >> So now my qualm is back to the beginning of the discussion. How do
> >> we encode the purpose of those pins reliably and within some
> >> standard framework, without getting *driver* specific?
> >
> > Um.. I fail to see how the purpose of a pin can be not driver
> > specific.
> 
> GPIO stands for _General_ Purpose IO. The driver should just expose that
> info to user space and it should be up to the userspace application to
> decide what to do with that. The programmer should require absolutely
> no other intervention to the driver whatsoever.
> Anyone that has worked on data mining scientific equipment -eg.
> particle/photon scanners on VME boards with lots of GPIO pins- will tell
> you that meddling with kernel coding is totally unneeded, in fact it's
> stupid to require the student to do so. Usually some Windows API is given
> and the students write the programs on Windows to collect the data and
> control the device. I guess GPIOLIB and the new framework would have
> similar application in Linux -ie, requiring the programmer to write only
> a userspace to access the GPIO pins. From my understanding of the
> conversation, there are some people who fail to see the necessity of
> doing extra work to abstract this information away from the driver.

Heh. You _have_ the API to work with the GPIOs. In-kernel and userland
APIs. What you don't have in the _device tree_ is:

1. The mapping of invalid GPIOs. Though again, this can be easily
   implemented, just nobody bothers with it since there are million
   of other ways to do bad things with the hardware resources.

2. The mapping of board's external pins to gpio-controller's GPIOs. This
   is also can be trivially implemented. Sometimes this mapping could
   make some sense, and could be useful. You just need describe the
   board's headers in the device tree. You don't even need the driver
   for this, your userspace application can just look into the
   /proc/device-tree directly, and find out which GPIOs are wired
   to the board's headers.

See? You _can_ use the GPIOs. If you don't believe me, just find
some PPC board for which we support some GPIO controller, and compile
the kernel with CONFIG_GPIO_SYSFS=y, then look into the
/sys/class/gpio/. ;-)

-- 
Anton Vorontsov
email: cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
irc://irc.freenode.net/bd2
