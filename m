From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: GPIO - marking individual pins (not) available in device tree
Date: Wed, 29 Oct 2008 10:37:32 +1100
Message-ID: <20081028233732.GB9124@yookeroo.seuss>
References: <7b6eafc46f644dea59fbf0af17dbc005@localhost>
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

Yes, which is exactly why the purpose of the pin is driver specific.
That's the driver for the user of the pin, not the gpio controller.
In some cases that's another kernel driver, where some device needs
gpio access, in your case it's the userspace application.  But in
either case it's this driver that must know what gpio line to use, and
how to use it.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
