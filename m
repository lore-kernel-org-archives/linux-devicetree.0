From: Kumar Gala <galak@codeaurora.org>
Subject: common location for devicetree files
Date: Thu, 7 Nov 2013 17:21:58 -0600
Message-ID: <1438803E-C904-428B-B042-891978BC15DF@codeaurora.org>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: "linux-kernel@vger.kernel.org list" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

As we start having more sharing of device trees between architectures (arm & arm64, arm & powerpc, guessing maybe mips & arm) we need dts to live in location that 

I was wondering what people felt about doing:

	arch/dts/<VENDOR>/

as a common location that could be shared.  I'm up for other suggestions.

- k

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
