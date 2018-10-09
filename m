From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: arizona: Correct link for sound binding document
Date: Mon, 8 Oct 2018 23:55:22 -0700
Message-ID: <20181009065522.GD32033@dell>
References: <20180917153322.29206-1-ckeepax@opensource.cirrus.com>
 <20180926223944.GA30051@bogus>
 <20180928054646.GK8485@dell>
 <CAL_JsqLD=qzXiAptsR4X16_tYwSocFhrLJ=yh6caw1ke8YdESQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLD=qzXiAptsR4X16_tYwSocFhrLJ=yh6caw1ke8YdESQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com
List-Id: devicetree@vger.kernel.org

On Fri, 28 Sep 2018, Rob Herring wrote:

> On Fri, Sep 28, 2018 at 12:46 AM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > On Wed, 26 Sep 2018, Rob Herring wrote:
> >
> > > On Mon, Sep 17, 2018 at 04:33:22PM +0100, Charles Keepax wrote:
> > > > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/mfd/arizona.txt | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > Applied.
> >
> > Probably won't do any harm in this instance, but it's usually better
> > for MFD binding changes to go through the MFD tree to avoid
> > merge-conflicts.
> 
> It had been sitting there for a while, so I picked it up. Plus if we

A little over a week is not 'a while'. :)

> have conflicts within a binding (other than tree wide clean ups I do),
> that's not a good sign that the binding is changing.

Not sure I understand this.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
