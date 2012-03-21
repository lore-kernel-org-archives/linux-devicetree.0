From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] ARM: SPEAr600: Add device-tree support to SPEAr600 boards
Date: Wed, 21 Mar 2012 12:36:37 +0000
Message-ID: <201203211236.37891.arnd@arndb.de>
References: <1331650032-15274-1-git-send-email-sr@denx.de>
 <201203151339.36173.arnd@arndb.de> <4F69BC35.4010400@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F69BC35.4010400-qxv4g6HH51o@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
Cc: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>, "devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org" <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 21 March 2012, Viresh Kumar wrote:
> > 
> > What's wrong with one vic_dt_init_irq() function and an array with two entries?
> 
> Hey Arnd,
> 
> Actually i was doing 3xx DT porting and again came to this thing. I believe what
> you suggested should be fine too as the actual vic model/name is going to be
> passed from .dts file.
> 
> If this is acceptable to you, i will add patch for both vic & gic in my
> patchset.

Ok, sounds good.

Let's make sure we're on the same page with the process though. I hope
you're aware that I took Stefan's spear6xx v5 patch. I just now saw that
you were not on Cc on the submission of the patch nor on my reply, but you
had given your Ack on the patch. Just let me know how you want to handle
these things in the future -- the normal way would be to always let you
forward the patches to me, rather than having them applied to arm-soc
directly.

Regarding the spear3xx patches, I'm looking forward to your patches.
I think spear is simple and clean enough that it can serve as an example
for others doing DT conversion. Do you also plan to unify 3xx and 6xx?
I think there is hardly anything left in mach-spear6xx that justifies
having a separate platform, especially since with the DT conversion done,
we can actually remove most of the header file contents as well.

	Arnd
