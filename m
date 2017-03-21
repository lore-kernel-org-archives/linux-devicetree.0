From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 0/3] dtc updates for 4.12
Date: Tue, 21 Mar 2017 14:36:02 -0500
Message-ID: <CAL_Jsq+CBiV_px_RMaxK1d6F1Bo5JbLjX74TPV_VCygcdWs9yw@mail.gmail.com>
References: <20170321161958.9658-1-robh@kernel.org> <1e151194-0768-7f73-cd5c-21f42a6555de@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1e151194-0768-7f73-cd5c-21f42a6555de@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "arm@kernel.org" <arm@kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 21, 2017 at 11:49 AM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> On 03/21/2017 09:19 AM, Rob Herring wrote:
>> This series syncs dtc with current mainline. The primary motivation is
>> to pull in the new checks I've worked on. This gives lots of new
>> warnings which are turned off by default.
>>
>> Arm-soc folks, I've left the PCI checks enabled as they are pretty much
>> all real errors and there aren't that many (about 1200, but that's lots
>> of duplicates). I have a patch for some of them.
>
> Out of curiosity, should we think about making dtc a git submodule and
> have some magic in scripts/update-dtc-source.sh to sync it to a desired
> commit?

I'd be fine with that though all of dtc is not imported and I don't
really want to be the first to try to add a git submodule to the
kernel. Not everyone is a fan I think.

Rob
