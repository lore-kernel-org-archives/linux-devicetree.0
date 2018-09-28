From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] mfd: arizona: Correct link for sound binding document
Date: Fri, 28 Sep 2018 11:00:13 -0500
Message-ID: <CAL_JsqLD=qzXiAptsR4X16_tYwSocFhrLJ=yh6caw1ke8YdESQ@mail.gmail.com>
References: <20180917153322.29206-1-ckeepax@opensource.cirrus.com>
 <20180926223944.GA30051@bogus> <20180928054646.GK8485@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180928054646.GK8485@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com
List-Id: devicetree@vger.kernel.org

On Fri, Sep 28, 2018 at 12:46 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Wed, 26 Sep 2018, Rob Herring wrote:
>
> > On Mon, Sep 17, 2018 at 04:33:22PM +0100, Charles Keepax wrote:
> > > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > > ---
> > >  Documentation/devicetree/bindings/mfd/arizona.txt | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > Applied.
>
> Probably won't do any harm in this instance, but it's usually better
> for MFD binding changes to go through the MFD tree to avoid
> merge-conflicts.

It had been sitting there for a while, so I picked it up. Plus if we
have conflicts within a binding (other than tree wide clean ups I do),
that's not a good sign that the binding is changing.

Rob
