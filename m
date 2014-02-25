From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Movement of testcases.dtsi
Date: Tue, 25 Feb 2014 12:09:48 +0000
Message-ID: <20140225120949.DAB3DC41EDA@trevor.secretlab.ca>
References: <1393237542.16570.26.camel@kazak.uk.xensource.com> < 20140224194821.3D196C409F3@trevor.secretlab.ca> <1393272348.9640.4.camel@ dagon.hellion.org.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393272348.9640.4.camel-ztPmHsLffjjnO4AKDKe2m+kiAK3p4hvP@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 24 Feb 2014 20:05:48 +0000, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org> wrote:
> On Mon, 2014-02-24 at 19:48 +0000, Grant Likely wrote:
> > On Mon, 24 Feb 2014 10:25:42 +0000, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org> wrote:
> > > My device-tree-rebasing.git repo no longer builds, it fails with:
> > > src/arm/versatile-pb.dts:50:26: fatal error: testcases.dtsi: No such file or directory
> > > 
> > > I suspect this is due to b5190516b282 "of: Move testcase FDT data into
> > > drivers/of". I think I need to add drivers/of/testcase-data to the list
> > > of paths to convert, probably extracting it to /testcase-data in the dt
> > > repo and teach the build system about the new path in the obvious way.
> > > 
> > > Does that make sense?
> > 
> > Yup, that's the right thing to do... 
> 
> Thanks, I'll look into it.
> 
> > although I would like it to be a
> > short term solution. Ultimately I want the testcase data to be loaded at
> > runtime by the selftest module.
> 
> I suppose at this point linux.git will have a git rm done and my
> conversion script will just import that as expected?

Yes. When versatile-pb.dts stops including the testcases it will become
a non-issue.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
