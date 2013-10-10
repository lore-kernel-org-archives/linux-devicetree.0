From: Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH 0/2] Add support for Qualcomm's PRNG
Date: Thu, 10 Oct 2013 21:41:40 +1100
Message-ID: <20131010104140.GE9906@iris.ozlabs.ibm.com>
References: <1380811955-18085-1-git-send-email-svarbanov@mm-sol.com>
 <20131003165130.GA11974@thunk.org>
 <524EEB96.6040707@mm-sol.com>
 <20131004181005.GA7022@thunk.org>
 <52556C4E.9000604@mm-sol.com>
 <52557137.5050200@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <52557137.5050200@zytor.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Stanimir Varbanov <svarbanov@mm-sol.com>, Theodore Ts'o <tytso@mit.edu>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.hengli.com.au>, linux-kernel@vger.kernel.org, Rob Landley <rob@landley.net>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 09, 2013 at 08:07:35AM -0700, H. Peter Anvin wrote:

> consider the PowerPC random number generator[1]) and

[snip]

> [1] which has a known first-order bias which they "correct" for by
> XORing two datums together in a very simple data reduction step.

65 actually, not two.

> However, if their random source has bias it is extremely likely it also
> has nonzero correlations, which require stronger reductions.  It would

The correlations are essentially zero, by design, and experiment
confirms it.  Did you see my mail on the kvm list where I explained
how it works?

Paul.
