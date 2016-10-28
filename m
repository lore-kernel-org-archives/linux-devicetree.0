From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: hi6220: add resets property into dwmmc
 nodes
Date: Fri, 28 Oct 2016 16:33:41 +0900
Message-ID: <d7993c1a-5e50-9a33-0900-5c1a79884d3c@samsung.com>
References: <1472094041-5357-1-git-send-email-guodong.xu@linaro.org>
 <1472094041-5357-2-git-send-email-guodong.xu@linaro.org>
 <CAKfTPtB0FtGbm4C5z+LJizrsHikKt_BGFti5XY+LN3w7zO1Vjw@mail.gmail.com>
 <CALAqxLXfb48h8hMQmAaJ+YjA5=pekkQ8Dg8ReL6VTTfmuFRPDw@mail.gmail.com>
 <CAKfTPtAXdkKcfpHmUmQNwuJxO0PORcCf49noST_CCkZPigPwgw@mail.gmail.com>
 <CGME20161028072654epcas4p13cbf983b3e22dd96039ed33a4ac792d5@epcas4p1.samsung.com>
 <20161028072640.GB17266@leoy-linaro>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20161028072640.GB17266@leoy-linaro>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Leo Yan <leo.yan@linaro.org>, Vincent Guittot <vincent.guittot@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <rob.herring@linaro.org>, Guodong Xu <guodong.xu@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Xinliang Liu <xinliang.liu@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel <linux-kernel@vger.kernel.org>, Wei Xu <xuwei5@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, John Stultz <john.stultz@linaro.org>, Fathi Boudra <fathi.boudra@linaro.org>, LAK <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 10/28/2016 04:26 PM, Leo Yan wrote:
> On Fri, Oct 28, 2016 at 08:43:51AM +0200, Vincent Guittot wrote:
> 
> [...]
> 
>>> running with? Also do you have any details about the card in case its
>>> card specific?
>>
>> The sdcard is quite common: sandisk ultra 16GB
>> and my rootfs is on the sdcard
> 
> I'm using rootfs in emmc also have same failure.
> 
>>> Guodong: Is there any bootloader dependency on that change?
>>
>> FYI, I use firmwares available in AOSP
> 
> I tried latest firmware [1], still cannot boot up until revert the
> patch "arm64: dts: hi6220: add resets property into dwmmc nodes".

Could you share the log? Is there any log about failure?

Best Regards,
Jaehoon Chung

> 
> [1] http://builds.96boards.org/snapshots/hikey/linaro/uefi-openplatformpkg/latest/
> 
> Thanks,
> Leo Yan
> 
> 
> 
