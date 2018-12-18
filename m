From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 2/2] of: __of_detach_node() - remove node from phandle cache
Date: Tue, 18 Dec 2018 14:58:55 -0600
Message-ID: <CAL_JsqLjhc4LSVKLVm7d+T+74xLK5kYNN0NLZySv1zV0tg5ibQ@mail.gmail.com>
References: <1545033396-24485-1-git-send-email-frowand.list@gmail.com>
 <1545033396-24485-3-git-send-email-frowand.list@gmail.com>
 <871s6gv30z.fsf@concordia.ellerman.id.au> <b81f9268-a36c-963d-5b1e-d81b38b05143@gmail.com>
 <CAL_JsqLjc-tWYOT7ga4oAsgx=rpcWX6_cj80pih-kt=KbFVV=w@mail.gmail.com>
 <893d9327-4353-066d-2efa-414a3db4c282@gmail.com> <6b6a3d11-e60a-f55c-04fa-deafdd58ccec@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6b6a3d11-e60a-f55c-04fa-deafdd58ccec@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, mwb@linux.vnet.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, tlfalcon@linux.vnet.ibm.com, minkim@us.ibm.com, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 18, 2018 at 2:33 PM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 12/18/18 12:09 PM, Frank Rowand wrote:
> > On 12/18/18 12:01 PM, Rob Herring wrote:
> >> On Tue, Dec 18, 2018 at 12:57 PM Frank Rowand <frowand.list@gmail.com> wrote:
> >>>
> >>> On 12/17/18 2:52 AM, Michael Ellerman wrote:
> >>>> Hi Frank,
> >>>>
> >>>> frowand.list@gmail.com writes:
> >>>>> From: Frank Rowand <frank.rowand@sony.com>
> >>>>>
> >>>>> Non-overlay dynamic devicetree node removal may leave the node in
> >>>>> the phandle cache.  Subsequent calls to of_find_node_by_phandle()
> >>>>> will incorrectly find the stale entry.  Remove the node from the
> >>>>> cache.
> >>>>>
> >>>>> Add paranoia checks in of_find_node_by_phandle() as a second level
> >>>>> of defense (do not return cached node if detached, do not add node
> >>>>> to cache if detached).
> >>>>>
> >>>>> Reported-by: Michael Bringmann <mwb@linux.vnet.ibm.com>
> >>>>> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
> >>>>> ---
> >>>>
> >>>> Similarly here can we add:
> >>>>
> >>>> Fixes: 0b3ce78e90fc ("of: cache phandle nodes to reduce cost of of_find_node_by_phandle()")
> >>>
> >>> Yes, thanks.
> >>>
> >>>
> >>>> Cc: stable@vger.kernel.org # v4.17+
> >>>
> >>> Nope, 0b3ce78e90fc does not belong in stable (it is a feature, not a bug
> >>> fix).  So the bug will not be in stable.
> >>
> >> 0b3ce78e90fc landed in v4.17, so Michael's line above is correct.
> >> Annotating it with 4.17 only saves Greg from trying and then emailing
> >> us to backport this patch as it wouldn't apply.
> >
> > Thanks for the correction.  I was both under-thinking and over-thinking,
> > ending up with an incorrect answer.
> >
> > Can you add the Cc: to version 3 patch comments (both 1/2 and 2/2) or do
> > you want me to re-spin?
>
> Now that my thinking has been straightened out, a little bit more checking
> for the other pre-requisite patches show:
>
>   v4.18: commit b9952b5218ad ("of: overlay: update phandle cache on overlay apply and remove")
>   v4.19: commit e54192b48da7 ("of: fix phandle cache creation for DTs with no phandles")
>
> These can be addressed by changing the "Cc:" to ... # v4.19+
> because stable v4.17.* and v4.18.* are end of life.

EOL shouldn't factor into it. There's always the possibility someone
else picks any kernel version.

> Or the pre-requisites can be listed:
>
>    # v4.17: b9952b5218ad of: overlay: update phandle cache
>    # v4.17: e54192b48da7 of: fix phandle cache creation
>    # v4.17
>
>    # v4.18: e54192b48da7 of: fix phandle cache creation
>    # v4.18
>
>    # v4.19+
>
> Do you have a preference?

I think we just list v4.17 and be done with it.

Rob
