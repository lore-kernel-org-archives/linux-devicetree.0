From: Matt Sealey <matt@genesi-usa.com>
Subject: Re: GPIO - marking individual pins (not) available in device tree
Date: Fri, 24 Oct 2008 17:14:26 -0500
Message-ID: <490248C2.9020104@genesi-usa.com>
References: <4900ED81.3040202@genesi-usa.com> <4900F90B.80703@firmworks.com>
	<4901032F.3090805@genesi-usa.com> <49011C42.2020101@firmworks.com>
	<20081024032944.GE4267@yookeroo.seuss>
	<49014C69.8020408@firmworks.com>
	<20081024044511.GI4267@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
In-Reply-To: <20081024044511.GI4267@yookeroo.seuss>
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
To: Mitch Bradley <wmb@firmworks.com>, Matt Sealey <matt@genesi-usa.com>, linuxppc-dev list <linuxppc-dev@ozlabs.org>, devicetree-discuss list <devicetree-discuss@ozlabs.org>
List-Id: devicetree@vger.kernel.org



David Gibson wrote:
> Don't be patronising.
> 
> There is an existing address space defined by the gpio binding.
> Defining another one is pointless redundancy.  This is standard good
> ideas in computer science, no further argument necessary.

The existing address space, and the patches Anton etc. just submitted
which I started this discussion to address, don't fulfil certain needs.

You could do better than call it insane, by describing how you would
define a gpio bank that used 3 seperate pins which are NOT together
in a register, using a base address (reg) and base property (offset
of first pin) with the current system?

-- 
Matt Sealey <matt@genesi-usa.com>
Genesi, Manager, Developer Relations
