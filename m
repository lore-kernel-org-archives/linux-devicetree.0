From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] Adding selftest testdata dynamically into live tree
Date: Fri, 25 Jul 2014 00:10:58 -0600
Message-ID: <20140725061058.6BCBCC4063E@trevor.secretlab.ca>
References: <1405577379-4587-1-git-send-email-gaurav.minocha.os@gmail.com>
	<20140725055304.5C61EC4063E@trevor.secretlab.ca>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140725055304.5C61EC4063E-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 24 Jul 2014 23:53:04 -0600, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Wed, 16 Jul 2014 23:09:39 -0700, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > This patch attaches selftest's device tree data (required by /drivers/of/selftest.c)
> > dynamically into live device tree. First, it links selftest device tree data into the
> > kernel image and then iterates over all the nodes and attaches them into the live tree.
> > Once the testcases are complete, it removes the data attached.
> > 
> > This patch will remove the manual process of addition and removal of selftest device
> > tree data into the machine's dts file. Also, it can be build as a loadable kernel
> > module by setting the config symbol OF_SELFTEST=m.
> > 
> > Tested successfully with current selftest's testcases.
> > 
> > Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Merged, thanks. I've run tested on QEMU PowerPC pseries and ARM
> Versatile Express models. One of the testcases fails on powerpc, but
> that is a problem with the testcase itself, and not with this code.

I have however removed the ability to build it as a module for now.
There are other patches in my tree that conflict and I didn't want to
deal with the merge conflict. I'll get you to re-add the module feature
on top of the new tree when I push it out.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
