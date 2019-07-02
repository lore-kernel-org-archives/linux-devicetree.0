From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH 2/3] net: phy: realtek: Enable accessing RTL8211E
 extension pages
Date: Tue, 2 Jul 2019 08:07:57 +0200
Message-ID: <bdacdf76-8eae-e865-9c00-8e70a12ad303@gmail.com>
References: <20190701195225.120808-1-mka@chromium.org>
 <20190701195225.120808-2-mka@chromium.org> <20190701200248.GJ30468@lunn.ch>
 <35db1bff-f48e-5372-06b7-3140cb7cbb71@gmail.com>
 <20190701210902.GL30468@lunn.ch> <20190702000925.GD250418@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190702000925.GD250418@google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>, Andrew Lunn <andrew@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On 02.07.2019 02:09, Matthias Kaehlcke wrote:
> On Mon, Jul 01, 2019 at 11:09:02PM +0200, Andrew Lunn wrote:
>> On Mon, Jul 01, 2019 at 10:37:16PM +0200, Heiner Kallweit wrote:
>>> On 01.07.2019 22:02, Andrew Lunn wrote:
>>>> On Mon, Jul 01, 2019 at 12:52:24PM -0700, Matthias Kaehlcke wrote:
>>>>> The RTL8211E has extension pages, which can be accessed after
>>>>> selecting a page through a custom method. Add a function to
>>>>> modify bits in a register of an extension page and a few
>>>>> helpers for dealing with ext pages.
>>>>>
>>>>> rtl8211e_modify_ext_paged() and rtl821e_restore_page() are
>>>>> inspired by their counterparts phy_modify_paged() and
>>>>> phy_restore_page().
>>>>
>>>> Hi Matthias
>>>>
>>>> While an extended page is selected, what happens to the normal
>>>> registers in the range 0-0x1c? Are they still accessible?
>>>>
>>> AFAIK: no
>>
>> This it would be better to make use of the core paged access support,
>> so that locking is done correctly.
> 
> Do I understand correctly that this would involve assigning
> .read/write_page and use phy_select_page() and phy_restore_page()?
> 
> Besides the benefit of locking this would also result in less code and
> we could get rid of the custom _restore_page().
> 
Interestingly certain Realtek PHY's (incl. RTL8211E) support two paging
mechanisms.

1. Normal paging (set reg 0x1f to page number) - set by core paging
2. Extended pages (set reg 0x1f to 7, and reg 0x1e to ext. page number)

Newer Realtek PHY's use normal paging only.
