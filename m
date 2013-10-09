From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: [PATCH 0/2] Add support for Qualcomm's PRNG
Date: Wed, 9 Oct 2013 12:03:38 -0400
Message-ID: <20131009160338.GD1198@thunk.org>
References: <1380811955-18085-1-git-send-email-svarbanov@mm-sol.com>
 <20131003165130.GA11974@thunk.org>
 <524EEB96.6040707@mm-sol.com>
 <20131004181005.GA7022@thunk.org>
 <52556C4E.9000604@mm-sol.com>
 <52557137.5050200@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <52557137.5050200@zytor.com>
Sender: linux-doc-owner@vger.kernel.org
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Stanimir Varbanov <svarbanov@mm-sol.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.hengli.com.au>, linux-kernel@vger.kernel.org, Rob Landley <rob@landley.net>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 09, 2013 at 08:07:35AM -0700, H. Peter Anvin wrote:
> There needs to be an architecturally guaranteed lower bound on the
> entropic content for this to be at all useful.  However, the hwrandom
> interface is currently expecting fully entropic output (which is almost
> certainly bogus... consider the PowerPC random number generator[1]) and
> so using it for a PRNG output is directly wrong.  

You can specify as a command-line argument (-H) to rngd the entropy
per bit of input data.  So if you think an entropy source isn't great,
but has some uncertainty, you could do pass to rngd "-H 0.5" or maybe
even "-H 0.1".

Maybe it would be nice to have /dev/hwrandom export the quality of its
output, but the reality is that most hardware devices don't document
or export via some programmatic interface how well or how poorly their
hwrng really might be.  And even if they did, most people, who don't
have access to scanning electronic microscopes and nanometer probes,
and the ability to decrypt, reverse engineer, and decompile firmware,
couldn't know for sure whether or not to believe the claims of the
hardware or the hardware manufacturer anyway.

							- Ted
