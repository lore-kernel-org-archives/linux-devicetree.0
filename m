From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [RFC PATCH V2 2/2] kbuild: dtbs_install: new make target
Date: Mon, 18 Nov 2013 14:52:43 -0500
Message-ID: <20131118195243.GJ10335@titan.lakedaemon.net>
References: <1384201760-16785-1-git-send-email-jason@lakedaemon.net>
 <cover.1384798508.git.jason@lakedaemon.net>
 <eaf050fbd62803784856a4f37d4b332f7778e22c.1384798508.git.jason@lakedaemon.net>
 <528A65DF.8060000@wwwdotorg.org>
 <20131118191955.GG10335@titan.lakedaemon.net>
 <528A6944.3070303@wwwdotorg.org>
 <20131118192852.GI10335@titan.lakedaemon.net>
 <528A6CA3.9030904@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <528A6CA3.9030904-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 18, 2013 at 12:38:11PM -0700, Stephen Warren wrote:
> On 11/18/2013 12:28 PM, Jason Cooper wrote:
> > On Mon, Nov 18, 2013 at 12:23:48PM -0700, Stephen Warren wrote:
> >> On 11/18/2013 12:19 PM, Jason Cooper wrote:
> >>> On Mon, Nov 18, 2013 at 12:09:19PM -0700, Stephen Warren wrote:
> >>>> On 11/18/2013 11:38 AM, Jason Cooper wrote:
> >>>>> Unlike other build products in the Linux kernel, the devicetree blobs
> >>>>> are simply the name of their source file, s/dts/dtb/.  There is also no
> >>>>> 'make *install' mechanism to put them in a standard place with a
> >>>>> standard naming structure.
> >>>>>
> >>>>> Unfortunately, users have begun scripting pulling the needed dtbs from
> >>>>> within the kernel tree, thus hardcoding the dtbs names.  In turn, this
> >>>>> means any changes to the dts filenames breaks these scripts.
> >>>>>
> >>>>> This patch is an attempt to fix this problem.  Akin to 'make install',
> >>>>> this creates a new make target, dtbs_install.  The script that gets
> >>>>> called defers to a vendor or distribution supplied installdtbs binary,
> >>>>> if found in the system.  Otherwise, the default action is to install a
> >>>>> given dtb into
> >> ...
> >>>> This only appears to create ${compat}.dtb, and not ${dtb} too. 
> >>>
> >>> See my comment, above.
> >>>
> >>>> So, it doesn't seem to address part of the cover letter, "In addition,
> >>>> some vendors have done a diligent job naming their devicetree source
> >>>> files appropriately and we don't want to break their setups." Was that
> >>>> deliberate? If so, I guess I need to send some patches to U-Boot.
> >>>
> >>> I assume you are still pulling from arch/arm/boot/dts/*.dtb, right?
> >>> Those build products don't go away with this patch, so you should be
> >>> fine.  Unless I'm mis-understanding your workflow...
> >>
> >> Yes, but I thought the whole point of this was that everyone would/could
> >> switch to running "make dtbs_install", then pulling out the files from
> >> the install tree, instead of any use-case requiring obtaining files
> >> directly from the source/build tree?
> > 
> > Yes, in the script, it checks for the existence of /sbin/installdtbs.
> > If it's there, it will override the default behavior and execute that
> > script.
> 
> But that means everyone (a lot of people, and all distros) has to write,
> or at least download and install, such a script. 

They would already be modifying their build environment to make use of
'make dtbs_install', and few extra lines of shell script to integrate
with existing systems certainly isn't unreasonable?

> Equally, that script would incorrectly affect the naming of non-Tegra
> DTBs that follow the new convention. The naming of the Tegra DTBs is
> based more on the fact that they're the Tegra DTBs than the fact that
> I'm using them.

Umm, I wrote that script in 2 minutes.  I'm sure you could come up with
something Tegra-specific (perhaps using fdtget?) that places only the
Tegra dtbs in the location that works with Tegra's u-boot.

The point is, we're trying to set a reasonable default, _and_ respect
the pre-existing workflows.  I don't think 15 lines of script is too
much to ask.  Especially since it would be written to adopt a *new*
workflow, not fix a workflow broken by callous kernel maintainers. ;-)

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
