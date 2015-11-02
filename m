From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH V2 1/3] dma: add Qualcomm Technologies HIDMA management
 driver
Date: Mon, 2 Nov 2015 11:26:46 -0600
Message-ID: <56379CD6.5020807@codeaurora.org>
References: <1446444460-21600-1-git-send-email-okaya@codeaurora.org>
 <1446444460-21600-2-git-send-email-okaya@codeaurora.org>
 <CAL_Jsq+XCkaPD_Bop_BaTfEVP2YuOQ+=ChFvyLN47jps2NcZSA@mail.gmail.com>
 <56378D38.9050509@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56378D38.9050509@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sinan Kaya <okaya@codeaurora.org>, Rob Herring <robh+dt@kernel.org>
Cc: dmaengine@vger.kernel.org, Christopher Covington <cov@codeaurora.org>, "jcm@redhat.com" <jcm@redhat.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 11/02/2015 10:20 AM, Sinan Kaya wrote:
>>
> Is there a good example I can look or a wiki about the device-tree
> naming conventions?
>
> I'm more of an ACPI person than DTS.

I think Rob is talking about something like this:

	compatible="qcom,hidma-mgmt-1.0", "qcom,hidma-mgmt"

This specifies that this is the v1.0 of the HIDMA management engine (or, 
the management engine for the 1.0 HIDMA device).  That way, if in the 
future there's a v1.1, you can do this:

	compatible="qcom,hidma-mgmt-1.1", "qcom,hidma-mgmt"

The driver will probe only on ""qcom,hidma-mgmt", but in the probe 
function, it can query the version number and act accordingly.

Alternatively, the driver can probe on both:

static const struct of_device_id hidma_match[] = {
	{ .compatible = "qcom,hidma-mgmt-1.0", &v10_struct},
	{ .compatible = "qcom,hidma-mgmt-1.1", &v11_struct},
	{},
};
MODULE_DEVICE_TABLE(of, hidma_match);

And then the probe function will automatically get a pointer to either 
v10_struct or v11_struct.
	
-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
