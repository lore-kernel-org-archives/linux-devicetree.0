From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] of, numa: Validate some distance map rules
Date: Thu, 8 Nov 2018 07:08:26 -0600
Message-ID: <20181108130826.GA18544@bogus>
References: <1541672223-131326-1-git-send-email-john.garry@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1541672223-131326-1-git-send-email-john.garry@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Garry <john.garry@huawei.com>
Cc: frowand.list@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linuxarm@huawei.com, will.deacon@arm.com, anshuman.khandual@arm.com, peterz@infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 08, 2018 at 06:17:03PM +0800, John Garry wrote:
> Currently the NUMA distance map parsing does not validate the distance
> table for the distance-matrix rules 1-2 in [1].
> 
> However the arch NUMA code may enforce some of these rules, but not all.
> Such is the case for the arm64 port, which does not enforce the rule that
> the distance between separates nodes cannot equal LOCAL_DISTANCE.
> 
> The patch adds the following rules validation:
> - distance of node to self equals LOCAL_DISTANCE
> - distance of separate nodes > LOCAL_DISTANCE
> 
> This change avoids a yet-unresolved crash reported in [2].
> 
> A note on dealing with symmetrical distances between nodes:
> 
> Validating symmetrical distances between nodes is difficult. If it were
> mandated in the bindings that every distance must be recorded in the
> table, then it would be easy. However, it isn't.
> 
> In addition to this, it is also possible to record [b, a] distance only
> (and not [a, b]). So, when processing the table for [b, a], we cannot
> assert that current distance of [a, b] != [b, a] as invalid, as [a, b]
> distance may not be present in the table and current distance would be
> default at REMOTE_DISTANCE.
> 
> As such, we maintain the policy that we overwrite distance [a, b] = [b, a]
> for b > a. This policy is different to kernel ACPI SLIT validation, which
> allows non-symmetrical distances (ACPI spec SLIT rules allow it). However,
> the distance debug message is dropped as it may be misleading (for a distance
> which is later overwritten).
> 
> Some final notes on semantics:
> 
> - It is implied that it is the responsibility of the arch NUMA code to
>   reset the NUMA distance map for an error in distance map parsing.
> 
> - It is the responsibility of the FW NUMA topology parsing (whether OF or
>   ACPI) to enforce NUMA distance rules, and not arch NUMA code.
> 
> [1] Documents/devicetree/bindings/numa.txt
> [2] https://www.spinics.net/lists/arm-kernel/msg683304.html
> 
> Cc: stable@vger.kernel.org # 4.7
> Signed-off-by: John Garry <john.garry@huawei.com>
> Acked-by: Will Deacon <will.deacon@arm.com>
> ---

Applied, thanks.

Rob
