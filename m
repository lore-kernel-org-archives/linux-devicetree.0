From: Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: [PATCH] ARM: kbuild: Fix forced rebuild after 'make dtbs'
Date: Wed, 26 Nov 2014 10:39:48 +0100
Message-ID: <54759FE4.5030700@suse.cz>
References: <CACRpkdYmJWy1_vs0tWRA7SvkQnvbXXKqf7pHpH5b5tZ6vR+KJg@mail.gmail.com> <1414961549-31666-1-git-send-email-jason@lakedaemon.net> <5474F78F.2060906@suse.cz> <20141125235150.GH3836@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141125235150.GH3836-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2014-11-26 00:51, Russell King - ARM Linux wrote:
> On Tue, Nov 25, 2014 at 10:41:35PM +0100, Michal Marek wrote:
>> Dne 2.11.2014 v 21:52 Jason Cooper napsal(a):
>>> After this patch:
>>>
>>>   f4d4ffc03efc kbuild: dtbs_install: new make target
>>>
>>> was added the kernel tree, Linus Walleij noticed that 'make dtbs' forced
>>> a following 'make zImage' to rebuild the entire tree, even though
>>> nothing had changed.  His report:
>>>
>>>   After this patch a while back I have observed the following behaviour
>>>   of the kernel build:
>>>
>>>   make zImage
>>>   make zImage
>>>   -> incremental build, just relink
>>>
>>>   make zImage
>>>   make dtbs
>>>   make zImage
>>>   -> The whole kernel gets rebuilt
>>>
>>>   So now if I happen to recompile my device trees, I suddenly want
>>>   the entire zImage to be rebuilt to? It's by definition not changes
>>>   that affect the kernel build :-(
>>>
>>>   I noticed this because my build scripts calls make dtbs && make
>>>   zImage, and started to rebuild absolutely everything all the time.
>>>
>>> To fix this, we make only the dtbs_install target depend on the prepare
>>> target.  It's needed to make sure KERNELVERSION is calculated prior to
>>> installing.
>>
>> If a mere 'make prepare' causes a rebuild of the whole kernel, then
>> there is something fishy in the ARM Makefiles. However, if you only need
>> the KERNELRELEASE variable, then you do not need to depend on prepare.
>> The main Makefile makes sure that silentoldconfig is ran and therefore
>> KERNELRELEASE set for all targets except make *config.
> 
> Running make prepare and then re-running a build doesn't rebuild anything
> for me.  However, I always build with O=  Also works if I do a make
> dtbs too.  So, everything seems to work as expected here.

Good :).


> I think this needs a bit more debugging to see why the whole kernel is
> being rebuilt - the kernel build system has methods to tell you why stuff
> is being built, which would be a good place to start.

Right, this is make V=2.

Michal
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
