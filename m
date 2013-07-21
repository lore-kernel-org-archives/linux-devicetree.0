From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 3/3] MAINTAINERS: Refactor device tree maintainership
Date: Sat, 20 Jul 2013 17:29:37 -0700
Message-ID: <1374366577.1940.10.camel@joe-AO722>
References: <1374290388-19308-1-git-send-email-grant.likely@linaro.org>
	 <1374290388-19308-3-git-send-email-grant.likely@linaro.org>
	 <CAOesGMhaAy93J=Q1STZUHHA-SbH+WXCVuUn0ef14_18du2dk6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOesGMhaAy93J=Q1STZUHHA-SbH+WXCVuUn0ef14_18du2dk6w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Grant Likely <grant.likely@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Rob Herring <rob.herring@calxeda.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, 2013-07-20 at 17:17 -0700, Olof Johansson wrote:
> On Fri, Jul 19, 2013 at 8:19 PM, Grant Likely <grant.likely@linaro.org> wrote:
> > Device tree bindings require a lot more attention than they used to.
> > We've got a group of volunteers willing to take over maintaining
> > bindings. This patch adds them to the MAINTAINERS file.
[]
> > diff --git a/MAINTAINERS b/MAINTAINERS
[]
> > +OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
[]
> > +F:     arch/*/
[]
> This seems a bit broad.

Yep, that's every file anywhere under arch.
