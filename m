From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] ARM: SPEAr600: Add device-tree support to SPEAr600 boards
Date: Tue, 27 Mar 2012 11:59:35 +0000
Message-ID: <201203271159.35306.arnd@arndb.de>
References: <1331650032-15274-1-git-send-email-sr@denx.de>
 <201203271115.07805.arnd@arndb.de> <4F71A42C.3090108@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F71A42C.3090108-qxv4g6HH51o@public.gmane.org>
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
Cc: spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>, viresh kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org" <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 27 March 2012, Viresh Kumar wrote:
> On 3/27/2012 4:45 PM, Arnd Bergmann wrote:
> > On Tuesday 27 March 2012, Viresh Kumar wrote:
> > The normal way is to turn around the logic so you don't have to include this test
> > at all. Just have one soc-specific init_machine and map_io function, that calls
> > both soc-specific and shared soc functions, e.g.
> 
> But with that, i need multiple DT_MACHINE_START(). Isn't it?
> Is this advisable?

Having one DT_MACHINE_START per soc is ok if it helps you. Of course if you
have multiple ones that are basically identical, it's simpler to just
combine them.

> > In case of the clocks, I think you could already merge all the clk_lookup
> > arrays into one, which would result in a larger kernel image but should
> > do no harm otherwise.
> 
> Actually we can't do it. :(
> If i boot 300 then i will also get clocks of 310 and 320 in my clock list.
> And once i go through this clock list to create clock tree (parent-child
> relationship), i will try to access hardware registers of 310 & 320,
> which are just not valid for 300. Kernel Crash!!

Ok, I see. BTW, have you tried what I first recommended to you, which is
to check the compatible property of the clock node instead of the machine?

Obviously that only works when you initialize the clocks from init_early()
instead of from map_io(), but I think that would be the cleanest choice
if you want to have single function with run-time dependencies.

	Arnd
