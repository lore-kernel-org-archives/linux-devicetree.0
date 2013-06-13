From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [GIT PULL] devicetree bugfixes for v3.10
Date: Thu, 13 Jun 2013 16:56:07 -0600
Message-ID: <51BA4E07.7060001@wwwdotorg.org>
References: <CACxGe6sE5qm5CmGxO8p1dR9v7bbqipm5pYRz8F6pQdWVHetCgA@mail.gmail.com> <1371163963.5555.25.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1371163963.5555.25.camel@pasglop>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Grant Likely <grant.likely@linaro.org>, Stephen Warren <SWarren@nvidia.com>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On 06/13/2013 04:52 PM, Benjamin Herrenschmidt wrote:
> On Thu, 2013-06-13 at 23:22 +0100, Grant Likely wrote:
>> Grant Likely (2):
>>       dtc: Update generated files to output from Bison 2.5
>>       dtc: ensure #line directives don't consume data from the next 
> 
> Question. Are those fixes also in the upstream dtc from jdl ? Or have we
> effectively forked it ?

Patch 1 just edits generated files which don't exist upstream (the
kernel checks them in, but upstream relies on the user running Bison/...
as part of make).

Patch 2 is a cherry-pick from upstream (plus regenerating some
difference generated files)
