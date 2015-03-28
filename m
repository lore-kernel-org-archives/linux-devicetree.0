From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [Patch 0/5] dt: unittest: fix breakage and warnings
Date: Fri, 27 Mar 2015 19:55:03 -0700
Message-ID: <20150328025503.814D4C40B5F@trevor.secretlab.ca>
References: <5503C65F.4030000@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5503C65F.4030000@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: frowand.list@gmail.com, Rob Herring <robh+dt@kernel.org>, Linux Kernel list <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, 13 Mar 2015 22:25:51 -0700
, Frank Rowand <frowand.list@gmail.com>
 wrote:
> Running checkpatch on early versions of my patchset to fix the devicetree
> make dependency issues exposed a large number of warnings, including some that
> are actual bugs.  http://lkml.iu.edu/hypermail/linux/kernel/1503.1/03335.html
> 
> These patches fix those bugs, and another bug exposed by fixing those bugs.
> As a result, the number of tests completed increased from 102 to 107.
> 
> Since I was already poking around, I fixed a few classes of checkpatch warnings.
> 
> There are still plenty of warnings, but the noise is greatly reduced and future
> checkpatch warnings that are problems should stand out more clearly.

Thanks for rooting these out. I'll apply the bug fix for v4.0, and the
rest for v4.1

g.
