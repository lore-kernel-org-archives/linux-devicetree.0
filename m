From: Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: Re: [PATCH v2 0/5] USB: dwc2: Allow wakeup from suspend; enable for
 rk3288-veyron
Date: Fri, 19 Apr 2019 16:44:34 +0000
Message-ID: <SN1PR12MB24319D0BF93E22B6B913E6CAA7270@SN1PR12MB2431.namprd12.prod.outlook.com>
References: <20190418001356.124334-1-dianders@chromium.org>
 <e4b3cd69-1c91-dfbe-bea7-bbca89ca1348@synopsys.com>
 <CAD=FV=XDLqcdq_BypUYsJHKX+DY0VWvCACYgZiHeG8E3Dbwxcw@mail.gmail.com>
 <SN1PR12MB2431F918E4731FAA50A373B6A7270@SN1PR12MB2431.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Doug Anderson <dianders@chromium.org>, Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Amelie Delaunay <amelie.delaunay@st.com>, "heiko@sntech.de" <heiko@sntech.de>, Kai-Heng Feng <kai.heng.feng@canonical.com>, "zyw@rock-chips.com" <zyw@rock-chips.com>, Stefan Wahren <stefan.wahren@i2se.com>, Nicolas Boichat <drinkcat@chromium.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "mka@chromium.org" <mka@chromium.org>, Alan Stern <stern@rowland.harvard.edu>, Jon Flatley <jflat@chromium.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Elaine Zhang <zhangqing@rock-chips.com>, "amstan@chromium.org" <amstan@chromium.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Randy Li <ayaka@soulik.info>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Greg Kroah-Hartman <gregkh@>
List-Id: devicetree@vger.kernel.org

Hi Doug,

On 4/19/2019 15:43, Artur Petrosyan wrote:
> Hi,
> 
> On 4/18/2019 19:55, Doug Anderson wrote:
>> Hi,
>>
>> On Thu, Apr 18, 2019 at 5:41 AM Minas Harutyunyan
>> <Minas.Harutyunyan@synopsys.com> wrote:
>>> Did you consider/reviewed patch series from Artur Petrosyan "[PATCH
>>> 00/14] usb: dwc2: Fix and improve power saving modes" (submitted on
>>> April 12) which fixing partial power down and hibernation flows for both
>>> modes: host and device?
>>> I suspect that this both patch series can be in conflict.
>>
>> No, I wasn't aware of them.  I'd like to try them out, but it looks
>> like it's currently impossible because they're not archived anywhere
>> that I can find.
>>
>> 1. LKML wasn't copied, so I can't find them on lore.kernel.org.  It is
>> suggested to CC LKML on all patches.
>>
>> 2. The Linux USB patchwork only has the cover letter plus the first 6
>> patches.  See <https://urldefense.proofpoint.com/v2/url?u=https-3A__patchwork.kernel.org_cover_10898333_&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=9hPBFKCJ_nBjJhGVrrlYOeOQjP_HlVzYqrC_D7niMJI&m=rJbofHXqjP3sUBgEikaZ89fRWtsquvhFUkhSPguCiWw&s=_CrI0uolquXIYC5SuoZ1vBs7BM19VfCceI96qZm9kAY&e=>
>>
>> 3. Searching my own archives I only see the cover letter plus the
>> first 6 patches.
>>
>> Maybe you have some other pointer to how I can retrieve them?  I guess
>> I could try the first 6 patches without the later 8 but I'd rather get
>> the whole set...
>>
>>
>> -Doug
>>
> 
> 
> I have resend the patch set. You can find it with cover letter
> "[PATCH v1 00/14] usb: dwc2: Fix and improve power saving modes."
> 
> Let me know if you need any help.
> 

I am so sorry to inform you that the patches have not reached to LKML.
Looks like there is a problem with the kernel mailing list servers or 
our local servers.
Will try to fix this as soon as possible and let you know about it.

-- 
Regards,
Artur
