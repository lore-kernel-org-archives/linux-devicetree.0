From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 00/10] of: Core devicetree changeset support
Date: Sun, 27 Jul 2014 08:43:31 -0600
Message-ID: <20140727144331.73789C40603@trevor.secretlab.ca>
References: <1406159064-21366-1-git-send-email-grant.likely@linaro.org>
	<53D29D87.4060708@austin.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53D29D87.4060708-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tyrel Datwyler <turtle.in.the.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 25 Jul 2014 13:10:15 -0500, Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org> wrote:
> On 07/23/2014 06:44 PM, Grant Likely wrote:
> > Hi all,
> > 
> > This is a rollup of all the patches that I queued up today for
> > linux-next for the devicetree changeset and overlay work. I'm reposting
> > these patches because some have been significantly changed since their
> > first posting. None of the code is actually live yet, but the test cases
> > are there.
> > 
> > There is one significant functional change which may affect pseries. The
> > OF_DYNAMIC code has been changed to emit notifiers after applying a
> > change to the tree instead of before. I think I've got all they users
> > taken care of correctly, but I'd like to see some testing. I don't have
> > access to pseries (and I can't get the QEMU pseries model to boot reliably)
> > 
> > Nathan/Tyrel, can you give it a spin? The changes can be found in my git tree:
> 
> Grant,
> 
> I was able to do some sniff testing by adding/removing memory, cpus, and pci
> devices and it appears that all device tree nodes and properties were updated
> properly.
> 
> I would still like to try doing live partition migration where we can update
> many pieces of the device tree. I'll be out next week, will try to get
> on that when I return.

Thanks Nathan,

In the mean time, all this stuff is in Linux next. I would really like
to merge it for v3.17. I expect the merge window will open next weekend.
Let me know once you've been able to do the migration test. I can hold
off sending Linus a pull request until wk2 of the merge window if you
need the extra time.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
