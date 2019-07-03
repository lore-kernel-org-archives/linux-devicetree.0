From: David Collins <collinsd@codeaurora.org>
Subject: Re: [PATCH v3 0/4] Solve postboot supplier cleanup and optimize probe
 ordering
Date: Tue, 2 Jul 2019 17:03:49 -0700
Message-ID: <7900c670-5b3a-f950-dec9-70d98d94a84f@codeaurora.org>
References: <20190702004811.136450-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190702004811.136450-1-saravanak@google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@android.com
List-Id: devicetree@vger.kernel.org

Hello Saravana,

On 7/1/19 5:48 PM, Saravana Kannan wrote:
...
> TODO:
> - For the case of consumer child sub-nodes being added by a parent
>   device after late_initcall_sync we might be able to address that by
>   recursively parsing all child nodes and adding all their suppliers as
>   suppliers of the parent node too. The parent probe will add the
>   children before its probe is completed and that will prevent the
>   supplier's sync_state from being executed before the children are
>   probed.
> 
> But I'll write that part once I see how this series is received.

I don't think that this scheme will work in all cases.  It can also lead
to probing deadlock.

Here is an example:

Three DT devices (top level A with subnodes B and C):
/A
/A/B
/A/C
C is a consumer of B.

When device A is created, a search of its subnodes will find the link from
C to B.  Since device B hasn't been created yet, of_link_to_suppliers()
will fail and add A to the wait_for_suppliers list.  This will cause the
probe of A to fail with -EPROBE_DEFER (thanks to the check in
device_links_check_suppliers()).  As a result device B will not be created
and device A will never probe.

You could try to resolve this situation by detecting the cycle and *not*
adding A to the wait_for_suppliers list.  However, that would get us back
to the problem we had before.  A would be allowed to probe which would
then result in devices being added for B and C.  If the device for B is
added before C, then it would be allowed to immediately probe and
(assuming this all takes place after late_initcall_sync thanks to modules)
its sync_state() callback would be called since no consumer devices are
linked to B.

Please note that to change this example from theoretical to practical,
replace "A" with apps_rsc, "B" with pmi8998-rpmh-regulators, and "C" with
pm8998-rpmh-regulators in [1].

Take care,
David

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/sdm845-mtp.dts?h=v5.2-rc7#n55

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
