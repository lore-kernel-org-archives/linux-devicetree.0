From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] ARM: SPEAr600: Add device-tree support to SPEAr600 boards
Date: Wed, 14 Mar 2012 09:58:26 +0000
Message-ID: <201203140958.27289.arnd@arndb.de>
References: <1331650032-15274-1-git-send-email-sr@denx.de>
 <201203131644.12048.arnd@arndb.de> <4F604400.1040805@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F604400.1040805-qxv4g6HH51o@public.gmane.org>
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

On Wednesday 14 March 2012, Viresh Kumar wrote:
> On 3/13/2012 10:14 PM, Arnd Bergmann wrote:
> > I think you should add all the code from this file to spear6xx.c instead
> > of adding a new file. We can then delete the spear600.c and spear600_evb.c
> > files once the DT support has matured.
> 
> But what if have another board in future, and this is what Stefan is going
> to do soon, as they have another board.
> 
> So we may actually move this code to spear600_evb.c instead.
> 
> Sorry for any bad suggestions, i am new to DT. :)

No problem, we are all learning things as we are working on them.

The idea with DT is that you no longer need any board files because all of
the information in those files is now passed as a data structure to the kernel
at boot time. Platforms that are fully converted to DT don't have any
board files but just have one DT_MACHINE_START entry for all of them in
the common platform files. Since spear600 has very little board specific
contents at the moment, it is very easy to get to this point now, and
that will actually help support other boards without having to do more
patches to add board files.

When this work is completed, we might actually be able to extend the
spear6xx DT code to also support spear3xx and spear13xx, renaming it
to mach-spear. In that case, we would probably need one DT_MACHINE_START
entry for each family and would not be able to actually build 13xx together
with the other ones, but I guess a lot of the infrastructure could be shared.

I would suggest you read Documentation/devicetree/booting-without-of.txt
to get a better understanding of what this is all about.

	Arnd
