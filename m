From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH v2 1/3] devicetree: bindings: Document qcom,msm-id and qcom,board-id
Date: Wed, 11 Mar 2015 15:35:22 -0500
Message-ID: <79FFFE06-191C-404D-8923-48C9C28C61F7@codeaurora.org>
References: <1425503602-24916-1-git-send-email-galak@codeaurora.org> <7DA73171-01A5-4158-9A69-015B62D2D7E8@codeaurora.org> <CAJAp7OiVwvPjRbrBxw7Dndvk4Apwz_bx=CzSqeqd3JzYhmB7Kw@mail.gmail.com> <2155628.BceQuZbXC8@wuerfel>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <2155628.BceQuZbXC8@wuerfel>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bjorn Andersson <bjorn@kryo.se>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?iso-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org


On Mar 11, 2015, at 3:20 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> On Wednesday 11 March 2015 08:33:04 Bjorn Andersson wrote:
>> 
>> But are these values actually used by the boot loader?
>> 
>> As far as I could see in 8974 the dtbTool provided by Qualcomm
>> extracts the values from the list of dtbs and use them to create the
>> table-of-content in the QCDT blob. The boot loader then looks in this
>> TOC to pick the right dtb to use.
>> 
> 
> I guess if I understand this right, we just need to fix that dtbTool
> then to look at the top-level compatible property and/or machine
> name instead?
> 
> 	Arnd

Correct, and it means updating the tool for every board/dts that gets created in the future.

Thus, the feeling was that having the ids kept with the dtb made maintenance far easier.

- k

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
