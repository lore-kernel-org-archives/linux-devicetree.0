From: Christian Ruppert <christian.ruppert@abilis.com>
Subject: Re: [PATCH] clk: Add device tree binding to clk-fixed-factor
Date: Fri, 12 Apr 2013 11:12:35 +0200
Message-ID: <20130412091234.GC29291@ab42.lan>
References: <1365608443-30350-1-git-send-email-christian.ruppert@abilis.com>
 <51658BA9.7030508@free-electrons.com>
 <20130410162747.GG32603@ab42.lan> <20130411091952.GF8400@ab42.lan>
 <5166E41F.7060100@free-electrons.com>
 <20130412065417.GA29291@ab42.lan>
 <5167CE33.9010403@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <5167CE33.9010403@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Mike Turquette <mturquette@linaro.org>, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Landley <rob@landley.net>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 12, 2013 at 11:04:51AM +0200, Gregory CLEMENT wrote:
> On 04/12/2013 08:54 AM, Christian Ruppert wrote:
> > On Thu, Apr 11, 2013 at 06:26:07PM +0200, Gregory CLEMENT wrote:
> >> On 04/11/2013 11:19 AM, Christian Ruppert wrote:
> >>> Hi Gregory,
> >>>
> >>> Since there doesn't seem to be anyone opposing this feature I just
> >>> checked your patch and after adding the CLK_OF_DECLARE macro in the e=
nd
> >>> it works well for us. Tell me if you would like to rebase and resubmit
> >>> your patch or if I should follow up on our own.
> >>
> >> I can rebase and resubmit my patch, it's pretty straightforward.
> >> The problem was the lack of user in the kernel. And by user I mean
> >> a driver using these functions. Usually a new function enter in the
> >> kernel only if there are users for it inside the kernel so if you plan
> >> to submit a driver using this piece of code, then I see no reason
> >> to not get it.
> > =

> > If you add the line
> > =

> > CLK_OF_DECLARE(fixed_factor_clk, "fixed-factor-clkdiv", =

> =

> Why did you add the div suffix?
> =

> There is nothing in the function which prevent to have "mul" greater than
> "div" and hence having a multiplicative factor.
> =

> I think that this suffix is misleading.

You are right, let's remove it.

> [...]

-- =

  Christian Ruppert              ,          <christian.ruppert@abilis.com>
                                /|
  Tel: +41/(0)22 816 19-42     //|                 3, Chemin du Pr=E9-Fleuri
                             _// | bilis Systems   CH-1228 Plan-les-Ouates
