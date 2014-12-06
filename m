From: Ashok Kumar <ashoks@broadcom.com>
Subject: Re: [RFC PATCH v2 4/4] arm64:numa: adding numa support for arm64
 platforms.
Date: Sat, 6 Dec 2014 15:06:48 +0530
Message-ID: <27958.5147429772$1417858733@news.gmane.org>
References: <1416605010-10442-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
 <1416605010-10442-5-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1416605010-10442-5-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ganapatrao Kulkarni <ganapatrao.kulkarni@caviumnetworks.com>
Cc: devicetree@vger.kernel.org, steve.capper@linaro.org, al.stone@linaro.org, ard.biesheuvel@linaro.org, catalin.marinas@arm.com, Will.Deacon@arm.com, leif.lindholm@linaro.org, roy.franz@linaro.org, robh+dt@kernel.org, hanjun.guo@linaro.org, msalter@redhat.com, grant.likely@linaro.org, jchandra@broadcom.com, linux-arm-kernel@lists.infradead.org, gpkulkarni@gmail.com
List-Id: devicetree@vger.kernel.org

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
