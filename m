Return-Path: <ashoks@broadcom.com>
Message-ID: <5482d073.47f0440a.2f15.ffffd043SMTPIN_ADDED_BROKEN@mx.google.com>
Date: Sat, 6 Dec 2014 15:06:48 +0530
From: Ashok Kumar <ashoks@broadcom.com>
Subject: Re: [RFC PATCH v2 4/4] arm64:numa: adding numa support for arm64
 platforms.
References: <1416605010-10442-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
 <1416605010-10442-5-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1416605010-10442-5-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
To: Ganapatrao Kulkarni <ganapatrao.kulkarni@caviumnetworks.com>
Cc: linux-arm-kernel@lists.infradead.org, Will.Deacon@arm.com, catalin.marinas@arm.com, grant.likely@linaro.org, devicetree@vger.kernel.org, leif.lindholm@linaro.org, roy.franz@linaro.org, ard.biesheuvel@linaro.org, msalter@redhat.com, robh+dt@kernel.org, steve.capper@linaro.org, hanjun.guo@linaro.org, jchandra@broadcom.com, al.stone@linaro.org, gpkulkarni@gmail.com
List-ID: <devicetree@vger.kernel.org>

On Sat, Nov 22, 2014 at 02:53:30AM +0530, Ganapatrao Kulkarni wrote:
> Adding numa support for arm64 based platforms.
> creating numa mapping by parsing the dt node numa-map.
> 
> Signed-off-by: Ganapatrao Kulkarni <ganapatrao.kulkarni@caviumnetworks.com>
Ganapat,

Can we get a simple version of this patchset with just the associativity parameter for the cpu and memory nodes
upstream? The initial patchset can be with the assumption of a simple full mesh topology for the distance.  The
hierarchical complex topologies and the DT nodes and properties for that can be added in a later patch, once the
standard for that is agreed upon.
We are planning to support ACPI based NUMA for                                                                        Broadcom Vulcan processors(http://www.broadcom.com/press/release.php?id=s797235).
I am working on a patch to add support for the SRAT and SLIT ACPI tables based on your patch and I will post that
patchset soon, so it will be helpful if the core changes are upstream.

Thanks,
Ashok
