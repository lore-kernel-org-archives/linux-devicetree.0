From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V4 0/2] vfio, platform: add ACPI support
Date: Tue, 03 May 2016 22:12:23 +0200
Message-ID: <3322250.xDEDujoeAM@wuerfel>
References: <1462136872-17590-1-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1462136872-17590-1-git-send-email-okaya@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Sinan Kaya <okaya@codeaurora.org>, kvm@vger.kernel.org, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, eric.auger@linaro.org, mark.rutland@arm.com, devicetree@vger.kernel.org, vikrams@codeaurora.org, marc.zyngier@arm.com, linux-arm-msm@vger.kernel.org, vinod.koul@intel.com, agross@codeaurora.org, shankerd@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Sunday 01 May 2016 17:07:50 Sinan Kaya wrote:
> The patchset makes three different changes.
> 1. Add support for probing ACPI platform devices.
> 2. Add support for ACPI _RST method support during reset
> 3. Make reset driver a requirement by default with an optional
>    kernel command line override

Looks nice, thanks for rewriting this!

For future submissions, it would help to have a list of changes
compared to the previous versions a the patch set in the cover
letter to help reviewers, but this time my memory was still fresh
enough.

	Arnd
