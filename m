From: Matt Sealey <matt@genesi-usa.com>
Subject: Re: GPIO - marking individual pins (not) available in device tree
Date: Mon, 27 Oct 2008 19:51:23 -0500
Message-ID: <4906620B.7080308@genesi-usa.com>
References: <4900ED81.3040202@genesi-usa.com> <4900F90B.80703@firmworks.com>
	<4901032F.3090805@genesi-usa.com> <49011C42.2020101@firmworks.com>
	<20081024032944.GE4267@yookeroo.seuss>
	<49014C69.8020408@firmworks.com>
	<20081024044511.GI4267@yookeroo.seuss>
	<490248C2.9020104@genesi-usa.com>
	<20081026234747.GD22339@yookeroo.seuss>
	<4905E0DC.104@genesi-usa.com>
	<20081028001511.GD26424@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
In-Reply-To: <20081028001511.GD26424@yookeroo.seuss>
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
To: Matt Sealey <matt@genesi-usa.com>, Mitch Bradley <wmb@firmworks.com>, linuxppc-dev list <linuxppc-dev@ozlabs.org>, devicetree-discuss list <devicetree-discuss@ozlabs.org>
List-Id: devicetree@vger.kernel.org



David Gibson wrote:
> On Mon, Oct 27, 2008 at 10:40:12AM -0500, Matt Sealey wrote:
> 
> Uh.. no.  The gpio specifier has a format that's gpio controller
> specific, but it must include the actual pin number, although exactly
> how it's encoded might vary.
> 
> So, you use
> 	gpios = <&controller pin1-specifier &controller pin8-specifier
> 		 &controller pin9-specifier &controller pin11-specifier
> 		 &controller pin15-specifier &controller pin30-specifier>;

Okay that makes some more sense to me.

So now my qualm is back to the beginning of the discussion. How do
we encode the purpose of those pins reliably and within some
standard framework, without getting *driver* specific?

Take the example of an LCD controller with an 8-bit bus and two
control pins, if you put all 10 into a gpios property, explicit
knowledge of the purpose of those pins is lost. It must then be
encoded directly into the driver..

I liked Anton's suggestion of grouping them and creating new nodes,
but you didn't like it when it was suggested before, so, I'm
wondering if there's a middle ground..

-- 
Matt Sealey <matt@genesi-usa.com>
Genesi, Manager, Developer Relations
