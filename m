From: Olof Kindgren <olof.kindgren@gmail.com>
Subject: Re: [PATCH] openrisc: Add DTS and defconfig for DE0-Nano
Date: Sat, 16 Nov 2013 12:01:04 +0100
Message-ID: <CAKaYPCNOLbX09Pqx7Zn=ivO++iBZMbBpu-pMjNgayVDBrBX1yQ@mail.gmail.com>
References: <1384029451-16555-1-git-send-email-geert@linux-m68k.org>
	<5285EE5A.1070202@southpole.se>
	<20131116084505.GA26233@chokladfabriken.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-bounces@lists.openrisc.net>
In-Reply-To: <20131116084505.GA26233@chokladfabriken.org>
List-Unsubscribe: <http://lists.openrisc.net/options/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=unsubscribe>
List-Archive: <http://lists.openrisc.net/pipermail/linux>
List-Post: <mailto:linux@lists.openrisc.net>
List-Help: <mailto:linux-request@lists.openrisc.net?subject=help>
List-Subscribe: <http://lists.openrisc.net/listinfo/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=subscribe>
Sender: linux-bounces@lists.openrisc.net
Errors-To: linux-bounces@lists.openrisc.net
To: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kevin Mehall <contact@kevinmehall.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux <linux@lists.openrisc.net>
List-Id: devicetree@vger.kernel.org

2013/11/16 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
>
> On Fri, Nov 15, 2013 at 10:50:18AM +0100, Jonas Bonn wrote:
> > >+
> > >+    i2c0: ocores@a0000000 {
> > >+            #address-cells = <1>;
> > >+            #size-cells = <0>;
> > >+            compatible = "opencores,i2c-ocores";
> >
> > Version number needed.  OpenCores wanted "projectname-rtlsvn###"
> > where ### is the SVN commit number of the RTL directory in the
> > project's source repository.
> >
>
> That will also require a change to the driver.
>
> Using svn commit ids as version info seems a bit too fine grained to me,
> but if that's what's agreed on, then it should be the commit id from the
> projects official repository at opencores.org I think.
>
> Stefan
> _______________________________________________
> Linux mailing list
> Linux@lists.openrisc.net
> http://lists.openrisc.net/listinfo/linux


I agree. I don't like doing versioning with revision numbers. It's too
closely tied to the currently used VCS. The problem is that no one has
bothered to do proper releases of the cores for the last ten years or
so.

But since we are talking about a relatively small amount of cores
here, I think it could be worth to take a quick glance to see if the
latest SVN version is compatible with the latest tagged release. I
would suspect that is the case for the majority of the cores and the
we can just use the latest tag as version. For the other cores we
could
1. Use latest tag + 1 (a bit ugly if the maintainer wants to do a proper release
2. Take over maintainership/fork and just release what's in the trunk
(taking over maintenance is preferrable here to avoid  more repo
confusion)
3. Use SVN revisions

option 2 would be my preferred choice here, given that we get someone
to do the actual work. I could probably help out with a few of the
cores

Jonas, you said that opencores wanted projectname-svnversion. Do you
know where that comes from? My proposal here would conflict with that

//Olof
