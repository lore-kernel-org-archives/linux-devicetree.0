From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH 1/2] of: Allow selection of OF_DYNAMIC and OF_OVERLAY if
 OF_UNITTEST
Date: Tue, 24 Mar 2015 15:54:28 -0700
Message-ID: <20150324225428.94AF4C4091C@trevor.secretlab.ca>
References: <1422029405-9353-1-git-send-email-geert+renesas@glider.be>
	<1422029405-9353-2-git-send-email-geert+renesas@glider.be>
	<20150320122502.EB491C40724@trevor.secretlab.ca>
	<CAL_Jsq+mVvSs-9jLEHyYec2RYfqpCSev3k0oUu=7PE06h+gFXQ@mail.gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+mVvSs-9jLEHyYec2RYfqpCSev3k0oUu=7PE06h+gFXQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, 20 Mar 2015 08:32:12 -0500
, Rob Herring <robherring2@gmail.com>
 wrote:
> On Fri, Mar 20, 2015 at 7:25 AM, Grant Likely <grant.likely@linaro.org> wrote:
> > On Fri, 23 Jan 2015 17:10:04 +0100
> > , Geert Uytterhoeven <geert+renesas@glider.be>
> >  wrote:
> >> Currently OF_DYNAMIC and OF_OVERLAY are not visible to the user, and are
> >> selected automatically only when needed.
> >>
> >> Allow them to be enabled manually to improve device tree unit test
> >> coverage.
> >>
> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > I like the change. Merged, thanks.
> 
> Making OF_OVERLAY visible is already in 4.0-rc4.

Yes, I modified the patch to fit.

g.
