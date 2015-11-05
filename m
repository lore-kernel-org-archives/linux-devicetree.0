From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH V2 1/3] dma: add Qualcomm Technologies HIDMA management
 driver
Date: Thu, 5 Nov 2015 08:43:00 -0600
Message-ID: <563B6AF4.1010806@codeaurora.org>
References: <1446444460-21600-1-git-send-email-okaya@codeaurora.org>
 <1446444460-21600-2-git-send-email-okaya@codeaurora.org>
 <CAL_Jsq+XCkaPD_Bop_BaTfEVP2YuOQ+=ChFvyLN47jps2NcZSA@mail.gmail.com>
 <56378D38.9050509@codeaurora.org> <56379CD6.5020807@codeaurora.org>
 <CAL_JsqJYOe+uE1VE_ojSq=Hx=2roW1CAiB2Hyow0tKUR85cV0Q@mail.gmail.com>
 <5637A1EB.9080002@codeaurora.org>
 <CAL_JsqLeDEUk6fQN4J20jL5Yma12ucNb0V7PxbQqUC6jJUH3oQ@mail.gmail.com>
 <5637ABD1.5060707@codeaurora.org>
 <CAL_JsqLFjUx2KK1nx=c0b30VWcdgQLGsZy0Ps927AMBMJ-vZaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLFjUx2KK1nx=c0b30VWcdgQLGsZy0Ps927AMBMJ-vZaA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Sinan Kaya <okaya@codeaurora.org>, dmaengine@vger.kernel.org, Christopher Covington <cov@codeaurora.org>, "jcm@redhat.com" <jcm@redhat.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Rob Herring wrote:
> I'm saying document it as "qcom,<chip>-hidma-mgmt" and when you have
> the part number update the binding. Meanwhile push on the powers that
> be to decide on a part number.

Got it.  But we should we do about this:

static const struct of_device_id qcom_hidma_mgmt_match[] = {
	{ .compatible = "qcom,hidma-mgmt-1.0", },
	{},
};

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, hosted by The Linux Foundation.
