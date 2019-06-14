From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH next] of/fdt: Fix defined but not used compiler warning
Date: Fri, 14 Jun 2019 07:53:27 -0600
Message-ID: <CAL_Jsq+EVO9OiEK5bidywgKsfOCK+BgWvKehCNonqogegRfikA@mail.gmail.com>
References: <20190612010011.90185-1-wangkefeng.wang@huawei.com>
 <0702fa2d-1952-e9fc-8e17-a93f3b90a958@gmail.com> <CAL_JsqKsjK237W+-Yz4McxSZG=Gd3Pfp2JtgMnfAqiNRUcCg1g@mail.gmail.com>
 <41acc800-1ab8-c715-2674-c1204d546b4f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <41acc800-1ab8-c715-2674-c1204d546b4f@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>, Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 12, 2019 at 12:29 PM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 6/12/19 10:00 AM, Rob Herring wrote:
> > On Wed, Jun 12, 2019 at 10:45 AM Frank Rowand <frowand.list@gmail.com> wrote:
> >>
> >> Hi Kefeng,
> >>
> >> If Rob agrees, I'd like to see one more change in this patch.
> >>
> >> Since the only caller of of_fdt_match() is of_flat_dt_match(),
> >> can you move the body of of_fdt_match() into  of_flat_dt_match()
> >> and eliminate of_fdt_match()?
> >
> > That's fine as long as we think there's never any use for of_fdt_match
> > after init? Fixup of nodes in an overlay for example.
>
> We can always re-expose the functionality as of_fdt_match() in the future
> if the need arises.  But Stephen's recent patch was moving in the opposite
> direction, removing of_fdt_match() from the header file and making it
> static.

Yes, we can, but it is just churn if we think it is likely needed.

OTOH, we probably want users to just use libfdt API directly and
should add this to libfdt if needed.

So yes, please implement Frank's suggestion.

Rob
