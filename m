From: Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: Re: [PATCH v2 0/5] USB: dwc2: Allow wakeup from suspend; enable for
 rk3288-veyron
Date: Mon, 22 Apr 2019 15:50:29 +0000
Message-ID: <SN1PR12MB2431362F11279C1C0E9E7793A7220@SN1PR12MB2431.namprd12.prod.outlook.com>
References: <20190418001356.124334-1-dianders@chromium.org>
 <e4b3cd69-1c91-dfbe-bea7-bbca89ca1348@synopsys.com>
 <CAD=FV=XDLqcdq_BypUYsJHKX+DY0VWvCACYgZiHeG8E3Dbwxcw@mail.gmail.com>
 <SN1PR12MB2431F918E4731FAA50A373B6A7270@SN1PR12MB2431.namprd12.prod.outlook.com>
 <SN1PR12MB24319D0BF93E22B6B913E6CAA7270@SN1PR12MB2431.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>, Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, "heiko@sntech.de" <heiko@sntech.de>, Alan Stern <stern@rowland.harvard.edu>, "amstan@chromium.org" <amstan@chromium.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, William Wu <william.wu@rock-chips.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>, Randy Li <ayaka@soulik.info>, "zyw@rock-chips.com" <zyw@rock-chips.com>, "mka@chromium.org" <mka@chromium.org>, "ryandcase@chromium.org" <ryandcase@chromium.org>, Amelie Delaunay <amelie.delaunay@st.com>, "jwerner@chromium.org" <jwerner@chromium.org>, Elaine Zhang <zhangqing@rock-chips.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Doug,=0A=
=0A=
On 4/19/2019 20:44, Artur Petrosyan wrote:=0A=
> Hi Doug,=0A=
> =0A=
> On 4/19/2019 15:43, Artur Petrosyan wrote:=0A=
>> Hi,=0A=
>>=0A=
>> On 4/18/2019 19:55, Doug Anderson wrote:=0A=
>>> Hi,=0A=
>>>=0A=
>>> On Thu, Apr 18, 2019 at 5:41 AM Minas Harutyunyan=0A=
>>> <Minas.Harutyunyan@synopsys.com> wrote:=0A=
>>>> Did you consider/reviewed patch series from Artur Petrosyan "[PATCH=0A=
>>>> 00/14] usb: dwc2: Fix and improve power saving modes" (submitted on=0A=
>>>> April 12) which fixing partial power down and hibernation flows for bo=
th=0A=
>>>> modes: host and device?=0A=
>>>> I suspect that this both patch series can be in conflict.=0A=
>>>=0A=
>>> No, I wasn't aware of them.  I'd like to try them out, but it looks=0A=
>>> like it's currently impossible because they're not archived anywhere=0A=
>>> that I can find.=0A=
>>>=0A=
>>> 1. LKML wasn't copied, so I can't find them on lore.kernel.org.  It is=
=0A=
>>> suggested to CC LKML on all patches.=0A=
>>>=0A=
>>> 2. The Linux USB patchwork only has the cover letter plus the first 6=
=0A=
>>> patches.  See <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__p=
atchwork.kernel.org_cover_10898333_&d=3DDwIBaQ&c=3DDPL6_X_6JkXFx7AXWqB0tg&r=
=3D9hPBFKCJ_nBjJhGVrrlYOeOQjP_HlVzYqrC_D7niMJI&m=3DrJbofHXqjP3sUBgEikaZ89fR=
WtsquvhFUkhSPguCiWw&s=3D_CrI0uolquXIYC5SuoZ1vBs7BM19VfCceI96qZm9kAY&e=3D>=
=0A=
>>>=0A=
>>> 3. Searching my own archives I only see the cover letter plus the=0A=
>>> first 6 patches.=0A=
>>>=0A=
>>> Maybe you have some other pointer to how I can retrieve them?  I guess=
=0A=
>>> I could try the first 6 patches without the later 8 but I'd rather get=
=0A=
>>> the whole set...=0A=
>>>=0A=
>>>=0A=
>>> -Doug=0A=
>>>=0A=
>>=0A=
>>=0A=
>> I have resend the patch set. You can find it with cover letter=0A=
>> "[PATCH v1 00/14] usb: dwc2: Fix and improve power saving modes."=0A=
>>=0A=
>> Let me know if you need any help.=0A=
>>=0A=
> =0A=
> I am so sorry to inform you that the patches have not reached to LKML.=0A=
> Looks like there is a problem with the kernel mailing list servers or=0A=
> our local servers.=0A=
> Will try to fix this as soon as possible and let you know about it.=0A=
> =0A=
=0A=
My patches has reached to LKML. You can find them with the patch set =0A=
title "[PATCH v1 00/14] usb: dwc2: Fix and improve power saving modes."=0A=
=0A=
This is the link to the patch set in marc.info=0A=
"https://marc.info/?l=3Dlinux-usb&m=3D155570003924638&w=3D2"=0A=
and a link in patchwork.kernel.org=0A=
"https://patchwork.kernel.org/project/linux-usb/list/?submitter=3D180003"=
=0A=
=0A=
Sorry for the delay.=0A=
=0A=
-- =0A=
Regards,=0A=
Artur=0A=
