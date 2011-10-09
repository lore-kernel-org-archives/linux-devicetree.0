From: Jason <linux-arm-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: orion/kirkwood and device tree support
Date: Sun, 9 Oct 2011 12:23:27 -0400
Message-ID: <20111009162327.GI31288@titan.lakedaemon.net>
References: <201110091545.55645.michael@walle.cc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201110091545.55645.michael-QKn5cuLxLXY@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Michael Walle <michael-QKn5cuLxLXY@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Lennert Buytenhek <kernel-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Michael,

On Sun, Oct 09, 2011 at 03:45:55PM +0200, Michael Walle wrote:
> I submitted a patch to support the Buffalo LS-XHL three months ago, which was 
> rejected because no more old fashioned board setup patches will be merged. 

We have the same situation with the dreamplug (kirkwood based).

> Are there any plans or even ongoing developments to convert these platforms to 
> support device trees?

I'm attempting to, but that requires my learning devicetree.  Which is
fine in and of itself, but it also means I'm learning how Linux supports
arm SoCs.  Which is taking some time.  My current thought process is this:

1.) add arch/arm/mach-kirkwood/board-dt.c, arch/arm/boot/dts/kirkwood.dtsi,
    and arch/arm/boot/dts/kirkwood-dreamplug.dts
2.) fill it in with replacements of calls in common.c and irq.c
3.) get it working cleanly.
4.) add in calls from mpp.c, pcie.c, and cpuidle.c
5.) build arch/arm/boot/dts/kirkwood-*.dts for other boards.

I'd be happy to coordinate and test, although I have no buffalo gear.
And I sure would appreciate some help. ;-)

thx,

Jason.
