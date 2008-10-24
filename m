From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: GPIO - marking individual pins (not) available in device tree
Date: Fri, 24 Oct 2008 15:58:24 +1100
Message-ID: <20081024045824.GJ4267@yookeroo.seuss>
References: <4900ED81.3040202@genesi-usa.com> <4900F90B.80703@firmworks.com>
	<4901032F.3090805@genesi-usa.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
Content-Disposition: inline
In-Reply-To: <4901032F.3090805@genesi-usa.com>
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
To: Matt Sealey <matt@genesi-usa.com>
Cc: Mitch Bradley <wmb@firmworks.com>, linuxppc-dev list <linuxppc-dev@ozlabs.org>, devicetree-discuss list <devicetree-discuss@ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 23, 2008 at 06:05:19PM -0500, Matt Sealey wrote:
>
>
> Mitch Bradley wrote:
> [snip]
>
>> You could adopt the convention that preassigned GPIOs must be  
>> represented by subordinate nodes, and any GPIO that is not covered by a 
>> subordinate node's "reg" property is implicitly available.  That's the  
>> way it works for other address spaces.

[snip]
> At the moment it's encoded as:
>
> 	gpios = <&controller-phandle pin-number pin-flags>

Actually, it's not.  The gpios property is:
	<controller-phandle gpio-descriptor ...>

The "gpio-descriptor" (like an interrupt descriptor from IEEE1275) is
a blob with number of cells equal to #gpio-cells from the controller.
The internal layout of the descriptor is specific to the gpio
controller.  Typically it includes a pin number and flags/mode.
However, it could be, and sometimes is, encoded as bank-number /
pin-number / flags.  Or even something more involved still, if that's
useful for the specific gpio controller in question.  Or it could
simply be pin number if it's associated with a really simple gpio
controller where all pins have the same behaviour.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
