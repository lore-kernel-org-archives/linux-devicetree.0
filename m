From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH v2 1/3] devicetree: bindings: Document qcom,msm-id and qcom,board-id
Date: Fri, 6 Mar 2015 10:08:09 -0600
Message-ID: <B8019148-3B26-453E-A3F0-9D67874083E0@codeaurora.org>
References: <1425503602-24916-1-git-send-email-galak@codeaurora.org> <7h8ufbjkod.fsf@deeprootsystems.com> <07D4E4D1-BF8C-4583-9505-9F321DB10406@codeaurora.org> <CAOesGMgy3VY=4-t+N0BYqCuSLQkh-rYe8nd9iJh1mMeBFz_sWQ@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOesGMgy3VY=4-t+N0BYqCuSLQkh-rYe8nd9iJh1mMeBFz_sWQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kevin Hilman <khilman@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?iso-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org


On Mar 5, 2015, at 7:59 PM, Olof Johansson <olof@lixom.net> wrote:

> On Thu, Mar 5, 2015 at 12:23 PM, Kumar Gala <galak@codeaurora.org> wrote:
>> 
>> On Mar 5, 2015, at 1:42 PM, Kevin Hilman <khilman@kernel.org> wrote:
>> 
>>> Kumar Gala <galak@codeaurora.org> writes:
>>> 
>>>> The top level qcom,msm-id and qcom,board-id are utilized by bootloaders
>>>> on Qualcomm MSM platforms to determine which device tree should be
>>>> utilized and passed to the kernel.
>>>> 
>>>> Cc: <devicetree@vger.kernel.org>
>>>> Signed-off-by: Kumar Gala <galak@codeaurora.org>
>>> 
>>> Is this the special magic that allows qcom bootloaders to take a kernel
>>> plus multiple DTBs and figure out which DTB to pass?
>>> 
>>> Kevin
>> 
>> yes
> 
> That's a bummer.
> 
> Luckily, the solution for upstream is still quite simple: Provide only
> one devicetree, and it'll be used, right?

We can provide only one, we still need the IDs in the DT.

- k
-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
