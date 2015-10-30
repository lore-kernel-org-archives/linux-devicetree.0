From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 2/2] dma: add Qualcomm Technologies HIDMA channel driver
Date: Fri, 30 Oct 2015 17:36:45 -0500
Message-ID: <5633F0FD.7060506@codeaurora.org>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org>
 <5741892.rRLhcI7KQG@wuerfel> <5633E442.3010003@codeaurora.org>
 <4552697.VhjWnxQoIo@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4552697.VhjWnxQoIo@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Sinan Kaya <okaya@codeaurora.org>
Cc: dmaengine@vger.kernel.org, cov@codeaurora.org, jcm@redhat.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/30/2015 05:28 PM, Arnd Bergmann wrote:
>>> > >Why ENODEV? Could you make this handle restarted system calls?
>> >
>> >This is the self test code. It gets called from probe. If there is a
>> >problem with the device or system configuration, I don't want to enable
>> >this device. I can certainly return a different error code though.
>> >What's a good code?
> I see. probe() is not restartable, so it cannot be -ERESTARTSYS.
>
> Maybe better use wait_event_timeout and not handle the signals then.
> It will eventually time out if something goes wrong.

What about -EPROBE_DEFER?  Isn't that "restartable"?  Granted, it's only 
supposed to be used if the driver is dependent on another driver to 
probe, so I'm not sure it applies here.  If the self-test fails, then it 
is possible that it could succeed later?

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
