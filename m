From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC PATCH V2 2/2] kbuild: dtbs_install: new make target
Date: Mon, 18 Nov 2013 12:23:48 -0700
Message-ID: <528A6944.3070303@wwwdotorg.org>
References: <1384201760-16785-1-git-send-email-jason@lakedaemon.net> <cover.1384798508.git.jason@lakedaemon.net> <eaf050fbd62803784856a4f37d4b332f7778e22c.1384798508.git.jason@lakedaemon.net> <528A65DF.8060000@wwwdotorg.org> <20131118191955.GG10335@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131118191955.GG10335-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/18/2013 12:19 PM, Jason Cooper wrote:
> On Mon, Nov 18, 2013 at 12:09:19PM -0700, Stephen Warren wrote:
>> On 11/18/2013 11:38 AM, Jason Cooper wrote:
>>> Unlike other build products in the Linux kernel, the devicetree blobs
>>> are simply the name of their source file, s/dts/dtb/.  There is also no
>>> 'make *install' mechanism to put them in a standard place with a
>>> standard naming structure.
>>>
>>> Unfortunately, users have begun scripting pulling the needed dtbs from
>>> within the kernel tree, thus hardcoding the dtbs names.  In turn, this
>>> means any changes to the dts filenames breaks these scripts.
>>>
>>> This patch is an attempt to fix this problem.  Akin to 'make install',
>>> this creates a new make target, dtbs_install.  The script that gets
>>> called defers to a vendor or distribution supplied installdtbs binary,
>>> if found in the system.  Otherwise, the default action is to install a
>>> given dtb into
...
>> This only appears to create ${compat}.dtb, and not ${dtb} too. 
> 
> See my comment, above.
> 
>> So, it doesn't seem to address part of the cover letter, "In addition,
>> some vendors have done a diligent job naming their devicetree source
>> files appropriately and we don't want to break their setups." Was that
>> deliberate? If so, I guess I need to send some patches to U-Boot.
> 
> I assume you are still pulling from arch/arm/boot/dts/*.dtb, right?
> Those build products don't go away with this patch, so you should be
> fine.  Unless I'm mis-understanding your workflow...

Yes, but I thought the whole point of this was that everyone would/could
switch to running "make dtbs_install", then pulling out the files from
the install tree, instead of any use-case requiring obtaining files
directly from the source/build tree?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
