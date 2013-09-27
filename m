From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 0/2] ARM DT cpus/cpu and topology bindings
Date: Fri, 27 Sep 2013 15:51:35 +0100
Message-ID: <20130927145135.GA10613@e102568-lin.cambridge.arm.com>
References: <1379330464-27917-1-git-send-email-lorenzo.pieralisi@arm.com>
 <20130924160126.GC403@e102568-lin.cambridge.arm.com>
 <5242EA2E.1010106@gmail.com>
 <20130926100250.GA20705@e102568-lin.cambridge.arm.com>
 <5244AA44.7070208@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5244AA44.7070208-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Dave P Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 26, 2013 at 10:42:28PM +0100, Rob Herring wrote:
> On 09/26/2013 05:02 AM, Lorenzo Pieralisi wrote:
> > On Wed, Sep 25, 2013 at 02:50:38PM +0100, Rob Herring wrote:
> >> On 09/24/2013 11:01 AM, Lorenzo Pieralisi wrote:
> >>> [replying to self]
> >>>
> >>> Any further comments on this series ? If not, I think bindings are ready to be
> >>> queued, but for that I need acks from DT maintainers.
> >>
> >> Who do you plan to take this? Is this dependent on something for 3.13?
> >> If not, I'll apply it.
> > 
> > v3 on the lists, should be final. No, there are no dependencies on 3.13
> > to the best of my knowledge. The problem with pre-v7 UP systems with
> > cpus node #address-cells == 0 is still there and I would like to ask you
> > please what we/I should do about that, it can trigger a considerable
> > amount of churn. As soon as these bindings hit the mainline I will
> > update the DT parsing code, I can easily take all pre-v7 UP dts out
> > of the picture in the parsing loop (after all, reg property for those
> > processors is useless), but the dts are _wrong_ regardless when these
> > patches become the official bindings.
> 
> Given that this is really a don't care for the kernel, I'm not sure what
> kernel change you are thinking. It is not the kernel's job to validate
> the dtb, so I think the kernel should not care. We should do this sort
> of validation at dtb build time at the latest. As to updating the dts
> files, yes we should probably do that.

I would like to change the DT parsing loop to improve it (eg now it bails
out as soon as a cpu node does not contain a reg property), not to
change the MPIDR checks related to these new bindings. In short,
kernel changes are not related to these bindings. I will make sure that the
changes will sit in -next for a while to prevent any issues; I understand
your reticence, I will tread more carefully this time.

As to updating the dts files, I am not looking forward to it at all :D,
I would kindly ask platform maintainers to do it, but only when these
bindings get merged in the kernel.

Having said that, if you do not have any objection I would ask you please to
apply v3:

http://lists.infradead.org/pipermail/linux-arm-kernel/2013-September/200531.html
or I can send you a pull request for that, as you wish.

Thank you very much,
Lorenzo

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
