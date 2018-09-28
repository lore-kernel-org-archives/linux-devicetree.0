From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v3 1/7] regulator/mfd: Support ROHM BD71847 power
 management IC
Date: Fri, 28 Sep 2018 10:14:37 +0300
Message-ID: <20180928071437.GB9389@localhost.localdomain>
References: <cover.1536912922.git.matti.vaittinen@fi.rohmeurope.com>
 <3996792a07fea45d94d4d712ed05527199cc4ac0.1536912922.git.matti.vaittinen@fi.rohmeurope.com>
 <20180921172959.GG20825@sirena.org.uk>
 <20180921180241.GA4358@dell>
 <20180921181217.GI20825@sirena.org.uk>
 <20180921185258.GC4358@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180921185258.GC4358@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, sboyd@kernel.org, mazziesaccount@gmail.com, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 21, 2018 at 11:52:58AM -0700, Lee Jones wrote:
> On Fri, 21 Sep 2018, Mark Brown wrote:
> 
> > On Fri, Sep 21, 2018 at 11:02:41AM -0700, Lee Jones wrote:
> > > On Fri, 21 Sep 2018, Mark Brown wrote:
> > 
> > > > This looks OK to me - Lee, the patch is almost entirely a regulator one,
> > > > are you OK with me applying it?
> > 
> > > The diff in rohm-bd718x7.h does not look significant.
> > 
> > > You can apply it so long as you provide me with a PR in order to avoid
> > > any potential merge conflicts.  Especially as Linus is out for this
> > > release.
> > 
> > Great, thanks.  There's also the MFD DT bindings and another patch later
> > on with Acked-for-MFD tags on them, should I convert the tags to acks,
> > apply those as well and include them in the pull request?
> 
> Please.

I was just wondering if I could do something to help get this patch
series applied? Mark, have you had the time to take a look on pickable
ranges addition yet? Should I do some rebasing/resending? Are you giving
me a nudge if I can do something?

Br,
	Matti Vaittinen
