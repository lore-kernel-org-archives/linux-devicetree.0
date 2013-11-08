From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: common location for devicetree files
Date: Fri, 8 Nov 2013 14:37:22 -0500
Message-ID: <20131108193722.GK10335@titan.lakedaemon.net>
References: <1438803E-C904-428B-B042-891978BC15DF@codeaurora.org>
 <CAOesGMgyqXS8tq0Ru=ibypV89-oAJ8bzxhdFTnSAvfOobEC+Lw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMgyqXS8tq0Ru=ibypV89-oAJ8bzxhdFTnSAvfOobEC+Lw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org list" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 08, 2013 at 11:33:00AM -0800, Olof Johansson wrote:
> On Thu, Nov 7, 2013 at 3:21 PM, Kumar Gala <galak@codeaurora.org> wrote:
> > As we start having more sharing of device trees between architectures (arm & arm64, arm & powerpc, guessing maybe mips & arm) we need dts to live in location that
> >
> > I was wondering what people felt about doing:
> >
> >         arch/dts/<VENDOR>/
> >
> > as a common location that could be shared.  I'm up for other suggestions.
> 
> dts isn't an architecture, so having it directly under arch/ doesn't
> make sense. I know it's the first common parent of a lot of platforms
> though.
> 
> I'd be ok with adding a toplevel dts/ directory for this, for lack of
> better options. It doesn't really fit under firmware, lib, kernel,
> scripts, tools...

I'll admit I shied away from that thought (dts/) for fear of the wrath
of the greybeards.  :)

thx,

Jason.
