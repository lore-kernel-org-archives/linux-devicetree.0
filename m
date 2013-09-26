From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [dtc PATCH V2] Warn on node name unit-address presence/absence mismatch
Date: Thu, 26 Sep 2013 13:21:23 -0500
Message-ID: <3D2FE31C-A6BB-4F70-9B3B-C55012CB56B3@codeaurora.org>
References: <1379613263-32080-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379613263-32080-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rohit Vaswani <rvaswani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Sep 19, 2013, at 12:54 PM, Stephen Warren wrote:

> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> ePAPR 1.1 section 2.2.1.1 "Node Name Requirements" specifies that any
> node that has a reg property must include a unit address in its name
> with value matching the first entry in its reg property. Conversely, if
> a node does not have a reg property, the node name must not include a
> unit address.
> 
> Implement a check for this. The code doesn't validate the format of the
> unit address; ePAPR implies this may vary from (containing bus) binding
> to binding, so doing so would be much more complex.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v2: Implement the new checks separately, rather than as part of existing
>    checkes. downgrade from errors to warnings. Add tests.
> 
> Question: Do I need to make a special exception for the /memory node? I
> assume we do want to fix that too, so the answer is no. That will require
> removing the /memory node from skeleton.dtsi in the kernel though.
> ---
> checks.c                        | 22 ++++++++++++++++++++--
> tests/reg-without-unit-addr.dts | 10 ++++++++++
> tests/run_tests.sh              |  2 ++
> tests/unit-addr-without-reg.dts |  9 +++++++++
> 4 files changed, 41 insertions(+), 2 deletions(-)
> create mode 100644 tests/reg-without-unit-addr.dts
> create mode 100644 tests/unit-addr-without-reg.dts

What about the case of no reg but a ranges?

This pattern shows up on a lot (if not all) the PPC dts:

arch/powerpc/boot/dts/mpc8544ds.dts:

        board_soc: soc: soc8544@e0000000 {
                ranges = <0x0 0x0 0xe0000000 0x100000>;
        };

- k

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
