From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/2] DTC unit-address checks
Date: Thu, 11 Feb 2016 14:46:57 -0600
Message-ID: <1455223619-16052-1-git-send-email-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

I've been much more active in reviewing bindings lately and a few things 
are getting old repeating. One is unit-address issues. I happened to be 
looking at the old dtc C schema today and found this old patch[1] from 
Stephen which never got merged. It derailed into how to updated ePAPR to 
clarify for unit-address with ranges property, but didn't seem to have 
any other objections. So, I've refreshed Stephen's patch and skip the 
check if non-empty ranges is present.

I also added a 2nd patch with checks for leading '0x' or 0s. This should 
never be valid. Also, I think Stephen's comment about checking the 
address value being difficult is wrong. We should be able to check that 
as any bus specific unit addresses should contain commas.

On a build of all dtbs, ARM has 36K warnings! The good news is arm64 is 
*only* 400 or so. I've skimmed thru them and they all looked valid to 
me.

Any objections to this series will result in getting added as a DT 
binding maintainer. :)

Rob

[1] https://lkml.org/lkml/2013/9/19/301

Rob Herring (1):
  Warn on node name unit-addresses with '0x' or leading 0s

Stephen Warren (1):
  Warn on node name unit-address presence/absence mismatch

 checks.c                        | 38 ++++++++++++++++++++++++++++++++++++--
 tests/reg-without-unit-addr.dts | 10 ++++++++++
 tests/run_tests.sh              |  4 ++++
 tests/unit-addr-leading-0s.dts  | 10 ++++++++++
 tests/unit-addr-leading-0x.dts  | 10 ++++++++++
 tests/unit-addr-without-reg.dts |  9 +++++++++
 6 files changed, 79 insertions(+), 2 deletions(-)
 create mode 100644 tests/reg-without-unit-addr.dts
 create mode 100644 tests/unit-addr-leading-0s.dts
 create mode 100644 tests/unit-addr-leading-0x.dts
 create mode 100644 tests/unit-addr-without-reg.dts

-- 
2.5.0
