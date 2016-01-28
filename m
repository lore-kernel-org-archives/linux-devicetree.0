From: Suravee Suthikulanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH 00/13] dtb: amd: Miscelleneous Updates for AMD Seattle DTS
Date: Thu, 28 Jan 2016 16:20:38 -0600
Message-ID: <56AA9436.60800@amd.com>
References: <1453929121-12171-1-git-send-email-Suravee.Suthikulpanit@amd.com>
 <CAOesGMgRC2vTVdmY6kKYonM1JkWD=-3k_EQ4hGvyrm-vNZczrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOesGMgRC2vTVdmY6kKYonM1JkWD=-3k_EQ4hGvyrm-vNZczrQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "arm@kernel.org" <arm@kernel.org>, brijeshkumar.singh@amd.com, Thomas Lendacky <thomas.lendacky@amd.com>, leo.duran@amd.com
List-Id: devicetree@vger.kernel.org

Hi Olof,

On 1/28/2016 3:39 PM, Olof Johansson wrote:
> Hi Suravee,
>
> On Wed, Jan 27, 2016 at 1:11 PM, Suravee Suthikulpanit
> <Suravee.Suthikulpanit@amd.com> wrote:
>> From: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
>>
>> This patch series contains several updates for the AMD Seattle SOC DTS files.
>> It also adds new board files for newer Overdrive and Linaro 96boards (Husky)
>> platforms.
>
> My Overdrive comes with DT provided by firmware, so there's no need to
> have a in-kernel-tree DT source.

You are correct that the FW comes with DT, and in typical case, you 
wouldn't need this.

> Are you aware of other reasons to have it here? I just foresee
> divergence and conflicts between the two. It was quite obvious before
> this update when the FW-provided DT was a lot more complete than what
> we had in the kernel tree.

However, there are still new/updated drivers being developed, and 
sometimes requires new/changes in DT binding. So, the DT that comes with 
the FW can get out of date, and will lack the support for new drivers.

Certain version of the FW allows overriding the DT that comes with the 
FW. So, we are providing the in-kernel DT to allow developers to provide 
the updated device tree for newer kernels. This patch series is bringing 
the in-kernel DT closer to what the latest FW is providing to avoid 
potential conflicts.

Regards,
Suravee

>
> -Olof
>
