From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v5 1/2] regulator: max14577: Add regulator driver for Maxim
 14577
Date: Mon, 02 Dec 2013 15:12:35 +0100
Message-ID: <1385993555.5573.3.camel@AMDC1943>
References: <1385559982-32039-1-git-send-email-k.kozlowski@samsung.com>
 <20131127152042.GY14725@sirena.org.uk> <20131127152358.GP3296@lee--X1>
 <20131127154221.GZ14725@sirena.org.uk> <20131127161323.GS3296@lee--X1>
 <20131127162859.GD14725@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <20131127162859.GD14725@sirena.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Wed, 2013-11-27 at 16:28 +0000, Mark Brown wrote:
> On Wed, Nov 27, 2013 at 04:13:23PM +0000, Lee Jones wrote:
> > On Wed, 27 Nov 2013, Mark Brown wrote:
> 
> > > The usual thing to do is of_get_child_by_name() on the parent to get the
> > > container to search in.
> 
> > What do you mean when you say 'usual thing'? Only the max8998 does
> > this currently. IMHO the better way to do it for MFD devices is
> > provide a compatible string and let the framework does the rest for
> > you.
> 
> No, as3722, Palmas and three of the TPS chips do the same thing.  If it
> were a purely Linux-internal thing I'd probably agree with you but as it
> is we'd just be adding compatible strings in everyone's DTs to save one
> line of code in the kernel.

Lee applied the MFD part of max14577, including the "of_compatible" of
max14577-regulator.

Do you wish me to change the patch to previous version using
of_get_child_by_name()?

Best regards,
Krzysztof



