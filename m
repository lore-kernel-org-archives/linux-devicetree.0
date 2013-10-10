From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 0/2] Add support for Qualcomm's PRNG
Date: Thu, 10 Oct 2013 08:08:25 -0700
Message-ID: <5256C2E9.4010704@zytor.com>
References: <1380811955-18085-1-git-send-email-svarbanov@mm-sol.com> <20131003165130.GA11974@thunk.org> <524EEB96.6040707@mm-sol.com> <20131004181005.GA7022@thunk.org> <52556C4E.9000604@mm-sol.com> <52557137.5050200@zytor.com> <20131010104140.GE9906@iris.ozlabs.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20131010104140.GE9906@iris.ozlabs.ibm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Paul Mackerras <paulus@samba.org>
Cc: Stanimir Varbanov <svarbanov@mm-sol.com>, Theodore Ts'o <tytso@mit.edu>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.hengli.com.au>, linux-kernel@vger.kernel.org, Rob Landley <rob@landley.net>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/10/2013 03:41 AM, Paul Mackerras wrote:
> On Wed, Oct 09, 2013 at 08:07:35AM -0700, H. Peter Anvin wrote:
> 
>> consider the PowerPC random number generator[1]) and
> 
> [snip]
> 
>> [1] which has a known first-order bias which they "correct" for by
>> XORing two datums together in a very simple data reduction step.
> 
> 65 actually, not two.
> 
>> However, if their random source has bias it is extremely likely it also
>> has nonzero correlations, which require stronger reductions.  It would
> 
> The correlations are essentially zero, by design, and experiment
> confirms it.  Did you see my mail on the kvm list where I explained
> how it works?
> 

No, sorry... I got a bit of detached discussion as part of benh talking
about KVM and randomness (for the record, I'm all for better randomness
on all platforms.)

Either way, XORing samples is a pretty inefficient (both in terms of
anticorrelation and in terms of entropy efficiency) form of data
reduction/conditioning.  It would still be better to feed the output
into the pool with a 65x derating.

	-hpa
