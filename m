From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] scripts/dtc: Update to upstream version 53bf130b1cdd
Date: Tue, 8 Mar 2016 01:37:47 -0600
Message-ID: <CAL_JsqKpZ7FgtH6zyanbnrq3u76RK23s1TQhvnaH_by_NtktCA@mail.gmail.com>
References: <1457104420-18350-1-git-send-email-robh@kernel.org> <CAOesGMhCMMf_3g-pT4G_fB9NHx1=TLwU_qKK+UjO_GJYMjSEAA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOesGMhCMMf_3g-pT4G_fB9NHx1=TLwU_qKK+UjO_GJYMjSEAA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 7, 2016 at 5:10 PM, Olof Johansson <olof@lixom.net> wrote:
> Hi,
>
> On Fri, Mar 4, 2016 at 7:13 AM, Rob Herring <robh@kernel.org> wrote:
>> Sync to upstream dtc commit 53bf130b1cdd ("libfdt: simplify
>> fdt_node_check_compatible()"). This adds the following commits from
>> upstream:
>>
>> 53bf130 libfdt: simplify fdt_node_check_compatible()
>> c9d9121 Warn on node name unit-address presence/absence mismatch
>> 2e53f9d Catch unsigned 32bit overflow when parsing flattened device tree offsets
>>
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> ---
>> As usual, this is just an automated copy of upstream dtc into the kernel
>> tree. The changeset is small enough that I have left it here.
>>
>> The main reason for this sync is to pick-up the new unit-address
>> warnings.
>
> This spews a crazy amount of warnings on a multi_v7_defconfig build.

Shocking, huh? And I've got more checks in the works. :)

> I'd prefer to see most of those warnings fixed _before_ we introduce
> it by default. Otherwise we just add a huge amount of noise that will
> hide any real valid warnings that are now brought up.

How do you propose to do that? If it is not enabled, then no one will
see them nor care. I don't intend to fix everyone's stuff myself. We
could hide the check behind COMPILE_TEST perhaps.

Rob
