From: Ian Campbell <ian.campbell@citrix.com>
Subject: Re: [PATCH 3/3] MAINTAINERS: Refactor device tree maintainership
Date: Tue, 23 Jul 2013 19:09:17 +0100
Message-ID: <1374602957.6623.142.camel@hastur.hellion.org.uk>
References: <1374290388-19308-1-git-send-email-grant.likely@linaro.org>
	  <1374290388-19308-3-git-send-email-grant.likely@linaro.org>
	  <1374511851.3609.10.camel@hornet> <51ED9018.1020003@gmail.com>
	 <1374599667.25700.92.camel@hornet> <51EEC49A.4080909@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51EEC49A.4080909@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Pawel Moll <pawel.moll@arm.com>, Rob Herring <robherring2@gmail.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Olof Johansson <olof@lixom.net>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2013-07-23 at 10:59 -0700, Stephen Warren wrote:

> I think the solution is to introduce some new shared/common location for
> shared/common *.dtsi files, into the kernel tree, in the interim.
> 
> When *.dts move out of the kernel, this common location can simply be
> consumed as part of the DT tree re-organization.
> 
> Or perhaps, we could move *.dts around in the kernel to match the
> proposed DT tree structure before that point in time?

FWIW I can easily handle any transformation as part of the automated
extraction into the device-tree.git. If it can expressed as a sed script
then so much the better, e.g. the current rules are
http://xenbits.xen.org/gitweb/?p=people/ianc/device-tree-rebasing.git;a=blob;f=scripts/rewrite-paths.sed;h=f7a157d1b486bac058f50e42cf7bedc8630e54ff;hb=HEAD.
If it gets too complicated for sed I can always switch to something
else.

I'm already pending a complete rebuild of the export to add in the
Documentation/devicetree/bindings sub tree but since it takes an age to
run I was waiting for the output of this conversation before kicking
that off.

Ian.
