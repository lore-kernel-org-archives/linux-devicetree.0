From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: "memory" binding issues
Date: Tue, 17 Sep 2013 18:38:23 -0700
Message-ID: <20130918013823.D617CC42C81@trevor.secretlab.ca>
References: <1379300274.4098.77.camel@pasglop> <52372F2A.2050003@wwwdotorg.org> <1379371567.3721.46.camel@pasglop>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1379371567.3721.46.camel@pasglop>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Stephen Warren <swarren@wwwdotorg.org>
Cc: devicetree@vger.kernel.org, Linux Kernel list <linux-kernel@vger.kernel.org>, m.szyprowski@samsung.com, swarren@nvidia.com, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

On Tue, 17 Sep 2013 08:46:07 +1000, Benjamin Herrenschmidt <benh@kernel.crashing.org> wrote:
> In anycase, just "/memory" will break on at least powerpc.

Ummm, really?

~/hacking/linux$ git grep 'memory {' arch/powerpc/boot/dts/* | wc -l
159
~/hacking/linux$ git grep 'memory@' arch/powerpc/boot/dts/* | wc -l
4

g.
