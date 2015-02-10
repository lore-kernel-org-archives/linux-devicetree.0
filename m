From: Andy Gross <agross@codeaurora.org>
Subject: Re: [Patch v3 0/6] GSBI CRCI Autoconfiguration Support
Date: Tue, 10 Feb 2015 14:25:43 -0600
Message-ID: <20150210202543.GB21808@qualcomm.com>
References: <1423519271-4238-1-git-send-email-agross@codeaurora.org>
 <92B272B3-7F22-426E-8BC4-B6A66C001836@codeaurora.org>
 <20150210185936.GA21808@qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150210185936.GA21808@qualcomm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
List-Id: devicetree@vger.kernel.org

<snip>

> > 
> > Series looks good, do we need a qcom_defconfig update to enable anything new for this?
> > 
> > - k
> 
> I'll send a followup to enable qcom_defconfig.
> 

Correction:
Since I use a 'selects MFD_SYSCON' in the Kconfig we shouldn't need anything.

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
