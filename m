From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH v3 0/5] dts patches for qcom tsens support
Date: Wed, 24 Aug 2016 22:21:17 -0500
Message-ID: <CAPBZ5Qdy2kf+xRC9f7ndE3GdJx0HyCabJWxyaYDbZ50HCj82Bg@mail.gmail.com>
References: <1471411128-4002-1-git-send-email-rnayak@codeaurora.org>
 <20160817193340.GA18215@hector.attlocal.net> <20160824102256.GA14048@harukaze>
 <20160825031328.GI15161@tuxbot>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160825031328.GI15161@tuxbot>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Paolo Pisati <p.pisati@gmail.com>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 24 August 2016 at 22:13, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
> On Wed 24 Aug 03:22 PDT 2016, Paolo Pisati wrote:
>
>> On Wed, Aug 17, 2016 at 02:33:40PM -0500, Andy Gross wrote:
>> > On Wed, Aug 17, 2016 at 10:48:43AM +0530, Rajendra Nayak wrote:
>> > > Hey Andy,
>> > >
>> > > This is a respin of v2 with some minor fixes pointed out by Rob.
>> > > Please pull these in for 4.9
>> > >
>> > > Thanks,
>> > > Rajendra
>> >
>> > I pulled these in.
>>
>> Did you try to read the content of the qfprom from userspace?
>>
>> $ uname -a
>> Linux dragon410c 4.8.0-rc1+ #6 SMP PREEMPT Wed Aug 24 11:11:02 CEST 2016 aarch64
>> aarch64 aarch64 GNU/Linux
>> $ lsmod
>> Module                  Size  Used by
>> nvmem_qfprom           16384  0
>> nvmem_core             24576  1 nvmem_qfprom
>> $ ls -la /sys/bus/nvmem/devices/
>> total 0
>> drwxr-xr-x 2 root root 0 Aug 24 10:17 .
>> drwxr-xr-x 4 root root 0 Aug 24 10:15 ..
>> lrwxrwxrwx 1 root root 0 Aug 24 10:17 qfprom0 ->
>> ../../../devices/platform/soc/5c000.qfprom/qfprom0
>> $ cat /sys/bus/nvmem/devices/qfprom0/nvmem
>>
>> [spontaneous reboot]
>>
>> This using agross's for-next tree as of today ("54ba896 Merge branch
>> 'arm64-defconfig-for-4.9' into all-for-4.8") and defconfig.
>
> This was reported in some other forum as well, after some investigation
> we concluded that it looks like one of the entries are locked down -
> probably from some security reason.
>
> I'm not aware of any way to query this configuration. But the main use
> case for the qfprom is in-kernel access to certain elements and that we
> do get from the driver as is...

Yeah this appears to be the case.  So I guess the response is 'don't
do that'.  At least don't cat or od the file.  You need to seek and
read.

Andy
