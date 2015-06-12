From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH non-pretimeout 6/7] Watchdog: enable ACPI GTDT
 support for ARM SBSA watchdog driver
Date: Fri, 12 Jun 2015 08:16:32 -0500
Message-ID: <557ADBB0.7080008@codeaurora.org>
References: <=fu.wei@linaro.org> <1433958452-23721-1-git-send-email-fu.wei@linaro.org> <1433958452-23721-7-git-send-email-fu.wei@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1433958452-23721-7-git-send-email-fu.wei@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: fu.wei@linaro.org, Suravee.Suthikulpanit@amd.com, linaro-acpi@lists.linaro.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc: tekkamanninja@gmail.com, graeme.gregory@linaro.org, al.stone@linaro.org, hanjun.guo@linaro.org, ashwin.chaugule@linaro.org, arnd@arndb.de, linux@roeck-us.net, vgandhi@codeaurora.org, wim@iguana.be, jcm@redhat.com, leo.duran@amd.com, corbet@lwn.net, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, rjw@rjwysocki.net
List-Id: devicetree@vger.kernel.org

fu.wei@linaro.org wrote:
> This patch enables ACPI GTDT support for ARM SBSA
> watchdog driver automatically, if ACPI support is enabled.

You don't need this patch if you reorder your patches, like this:

#4 ACPI: add GTDT table parse driver into ACPI driver
#5 Watchdog: introduce ARM SBSA watchdog driver

And then this patch becomes part of patch #5.

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, hosted by The Linux Foundation.
