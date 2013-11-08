From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH v3 7/9] ARM: add Armada 1500 and Sony NSZ-GS7 device
 tree files
Date: Fri, 8 Nov 2013 11:57:21 -0500
Message-ID: <20131108165721.GA10335@titan.lakedaemon.net>
References: <1381235073-17134-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1383661723-17956-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1383661723-17956-8-git-send-email-sebastian.hesselbarth@gmail.com>
 <0AF697FD-60AA-4B8B-A35F-3DF2FFBCF7AF@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0AF697FD-60AA-4B8B-A35F-3DF2FFBCF7AF@codeaurora.org>
Sender: linux-doc-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Olof Johansson <olof@lixom.net>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 08, 2013 at 10:13:19AM -0600, Kumar Gala wrote:
> On Nov 5, 2013, at 8:28 AM, Sebastian Hesselbarth wrote:
...
> > .../devicetree/bindings/arm/marvell,berlin.txt     |   24 +++
> > arch/arm/boot/dts/Makefile                         |    2 +
> > arch/arm/boot/dts/berlin2-sony-nsz-gs7.dts         |   29 +++
> > arch/arm/boot/dts/berlin2.dtsi                     |  227 ++++++++++++++++++++
> > 4 files changed, 282 insertions(+)
> > create mode 100644 Documentation/devicetree/bindings/arm/marvell,berlin.txt
> > create mode 100644 arch/arm/boot/dts/berlin2-sony-nsz-gs7.dts
> > create mode 100644 arch/arm/boot/dts/berlin2.dtsi
> 
> Haven't we been trying to go away from non-prefixed dts/dtsi?

hmmm, this is the first I've heard of that.  Although, your proposal
(in another thread) makes more sense now.  :)

> So should these be something like marvell-berlin2-...

I don't recall this being brought up at the summit, nor in Grant's
report.  I do need to give it a more careful read this weekend, though.
Perhaps I missed something.

thx,

Jason.
