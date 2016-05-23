From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 16/54] MAINTAINERS: Add file patterns for drm device tree bindings
Date: Mon, 23 May 2016 07:35:01 -0500
Message-ID: <CAL_Jsq+OJnTJNm9POLzSmAAko1EB171mvbNzw0ALgRMxaXTgzQ@mail.gmail.com>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
 <1463907991-7916-17-git-send-email-geert@linux-m68k.org> <CACvgo53Hpsbi91=d+jxBF85zXG8_ddSZTDxpG_ntf2wRmreU9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACvgo53Hpsbi91=d+jxBF85zXG8_ddSZTDxpG_ntf2wRmreU9Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, devicetree <devicetree@vger.kernel.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 23, 2016 at 4:33 AM, Emil Velikov <emil.l.velikov@gmail.com> wrote:
> On 22 May 2016 at 10:05, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> Submitters of device tree binding documentation may forget to CC
>> the subsystem maintainer if this is missing.
>>
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: dri-devel@lists.freedesktop.org
>> ---
>> Please apply this patch directly if you want to be involved in device
>> tree binding documentation for your subsystem.
>> ---
>>  MAINTAINERS | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index c79b99dd3a0bf22d..75138c09dd603093 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3868,6 +3868,9 @@ T:        git git://people.freedesktop.org/~airlied/linux
>>  S:     Maintained
>>  F:     drivers/gpu/drm/
>>  F:     drivers/gpu/vga/
>> +F:     Documentation/devicetree/bindings/display/
> Contains a mixed bag of fb (drivers/video) and drm ones. Perhaps one
> could/should move the former to a fb/legacy/other subfolder ?

Yes, there are some poorly designed bindings that reflect the
subsystem needs rather than the h/w. They were separate, I moved them
all together to hopefully discourage further separate bindings.

>> +F:     Documentation/devicetree/bindings/gpu/
> nvidia,gk20a.txt
> samsung-g2d.txt
> samsung-rotator.txt
>
> These three should be listed alongside the respective drivers and/or
> moved to display/{tegra,exynos} ?

Possibly, but these bindings pretty much stand on their own.

>> +F:     Documentation/devicetree/bindings/video/
> bridge/anx7814.txt move this to display ?

Yes, that directory sneaked back in.

Rob
