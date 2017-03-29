From: Anup Patel <anup.patel@broadcom.com>
Subject: Re: [PATCH v7 0/3] Broadcom FlexRM ring manager support
Date: Wed, 29 Mar 2017 11:22:25 +0530
Message-ID: <CAALAos-mFVCYFo31NJ=MTkU00mLthn9Rqre7sgMBpW9ZP--rPw@mail.gmail.com>
References: <1490765455-8556-1-git-send-email-anup.patel@broadcom.com> <CABb+yY3n2OuvBKfsWj5m5RvdBEZ5_aWpVNUJ9V8oikyJjchZAw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABb+yY3n2OuvBKfsWj5m5RvdBEZ5_aWpVNUJ9V8oikyJjchZAw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Pramod KUMAR <pramod.kumar@broadcom.com>, Rob Rice <rob.rice@broadcom.com>, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 29, 2017 at 11:05 AM, Jassi Brar <jassisinghbrar@gmail.com> wrote:
> On Wed, Mar 29, 2017 at 11:00 AM, Anup Patel <anup.patel@broadcom.com> wrote:
>> The Broadcom FlexRM ring manager provides producer-consumer style
>> ring interface for offload engines on Broadcom iProc SoCs. We can
>> have one or more instances of Broadcom FlexRM ring manager in a SoC.
>>
>> This patchset adds a mailbox driver for Broadcom FlexRM ring manager
>> which can be used by offload engine drivers as mailbox clients.
>>
>> The Broadcom FlexRM mailbox driver is feature complete for RAID and
>> Crypto offload engines. We will have incremental patches in-future
>> for ring-level statistics using debugfs and minor optimizations.
>>
>> This patchset is based on Linux-4.11-rc4 and it is also available
>> at flexrm-v7 branch of https://github.com/Broadcom/arm64-linux.git
>>
>> Changes since v6:
>>  - Rebased patches for Linux-4.11-rc4
>>  - Added a patch to remove depends on COMPILE_TEST for kconfig
>>    option BCM_FLEXRM_MBOX
>>
> You only needed to send the fix to compilation failure reports, not
> the whole series.

My bad for the noise.

> I believe only the patch-3 is new in the series and I need not even
> look at patch-1,2 ?

Yes, only patch-3 is required to fix compilation failure.

Regards,
Anup
