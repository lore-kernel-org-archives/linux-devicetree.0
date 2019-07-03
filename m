From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 4/7] net: phy: realtek: Enable accessing RTL8211E
 extension pages
Date: Wed, 3 Jul 2019 23:27:41 +0200
Message-ID: <3e47639a-bbbb-f438-bc66-a29423090e95@gmail.com>
References: <20190703193724.246854-1-mka@chromium.org>
 <20190703193724.246854-4-mka@chromium.org>
 <dd7a569b-41e4-5925-88fc-227e69c82f67@gmail.com>
 <20190703203650.GF250418@google.com>
 <98326ec2-6e90-fd3a-32f5-cf0db26c31a9@gmail.com>
 <20190703212407.GI250418@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703212407.GI250418@google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On 03.07.2019 23:24, Matthias Kaehlcke wrote:
> On Wed, Jul 03, 2019 at 11:01:09PM +0200, Heiner Kallweit wrote:
>> On 03.07.2019 22:36, Matthias Kaehlcke wrote:
>>> On Wed, Jul 03, 2019 at 10:12:12PM +0200, Heiner Kallweit wrote:
>>>> On 03.07.2019 21:37, Matthias Kaehlcke wrote:
>>>>> The RTL8211E has extension pages, which can be accessed after
>>>>> selecting a page through a custom method. Add a function to
>>>>> modify bits in a register of an extension page and a helper for
>>>>> selecting an ext page.
>>>>>
>>>>> rtl8211e_modify_ext_paged() is inspired by its counterpart
>>>>> phy_modify_paged().
>>>>>
>>>>> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
>>>>> ---
>>>>> Changes in v2:
>>>>> - assign .read/write_page handlers for RTL8211E
>>>>
>>>> Maybe this was planned, but it's not part of the patch.
>>>
>>> Oops, it was definitely there when I tested ... I guess this got
>>> somehow lost when changing the patch order and resolving minor
>>> conflicts, seems like I only build tested after that :/
>>>
>> RTL8211E also supports normal pages (reg 0x1f = page).
>> See e.g. rtl8168e_2_hw_phy_config in the r8169 driver, this network
>> chip has an integrated RTL8211E PHY. There settings on page 3 and 5
>> are done.
>> Therefore I would prefer to use .read/write_page for normal paging
>> in all Realtek PHY drivers. Means the code here would remain as it
>> is and just the changelog would need to be fixed.
> 
> Do I understand correctly that you suggest an additional patch that
> assigns .read/write_page() for all entries of realtek_drvs?
> 

No, basically all the Realtek PHY drivers use the following already:
.read_page	= rtl821x_read_page,
.write_page	= rtl821x_write_page,
What I mean is that this should stay as it is, and not be overwritten
with the extended paging.
