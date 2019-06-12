From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 4/5] drm/connector: Split out orientation quirk detection
Date: Wed, 12 Jun 2019 14:33:05 +0200
Message-ID: <fe774952-6fd5-b4ec-56c9-32fd30546313@redhat.com>
References: <20190611040350.90064-1-dbasehore@chromium.org>
 <20190611040350.90064-5-dbasehore@chromium.org> <87zhmoy270.fsf@intel.com>
 <01636500-0be5-acf8-5f93-a57383bf4b20@redhat.com>
 <CAGAzgsoxpsft-vmVOuKSAbLJqR-EZvcceLpMeWkz6ikJEKGJHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGAzgsoxpsft-vmVOuKSAbLJqR-EZvcceLpMeWkz6ikJEKGJHg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "dbasehore ." <dbasehore@chromium.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, linux-kernel <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, Intel Graphics <intel-gfx@lists.freedesktop.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 12-06-19 02:16, dbasehore . wrote:
> On Tue, Jun 11, 2019 at 1:54 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 11-06-19 10:08, Jani Nikula wrote:
>>> On Mon, 10 Jun 2019, Derek Basehore <dbasehore@chromium.org> wrote:
>>>> This removes the orientation quirk detection from the code to add
>>>> an orientation property to a panel. This is used only for legacy x86
>>>> systems, yet we'd like to start using this on devicetree systems where
>>>> quirk detection like this is not needed.
>>>
>>> Not needed, but no harm done either, right?
>>>
>>> I guess I'll defer judgement on this to Hans and Ville (Cc'd).
>>
>> Hmm, I'm not big fan of this change. It adds code duplication and as
>> other models with the same issue using a different driver or panel-type
>> show up we will get more code duplication.
>>
>> Also I'm not convinced that devicetree based platforms will not need
>> this. The whole devicetree as an ABI thing, which means that all
>> devicetree bindings need to be set in stone before things are merged
>> into the mainline, is done solely so that we can get vendors to ship
>> hardware with the dtb files included in the firmware.
> 
> We've posted fixes to the devicetree well after the initial merge into
> mainline before, so I don't see what you mean about the bindings being
> set in stone.

That was just me repeating the official party line about devicetree.

> I also don't really see the point. The devicetree is in
> the kernel. If there's some setting in the devicetree that we want to
> change, it's effectively the same to make the change in the devicetree
> versus some quirk setting. The only difference seems to be that making
> the change in the devicetree is cleaner.

I agree with you that devicetree in practice is easy to update after
shipping. But at least whenever I tried to get new bindings reviewed
I was always told that I was not allowed to count on that.

>> I'm 100% sure that there is e.g. ARM hardware out there which uses
>> non upright mounted LCD panels (I used to have a few Allwinner
>> tablets which did this). And given my experience with the quality
>> of firmware bundled tables like ACPI tables I'm quite sure that
>> if we ever move to firmware included dtb files that we will need
>> quirks for those too.
> 
> Is there a timeline to start using firmware bundled tables?

Nope, as I said "if we ever move to ...".

> Since the
> quirk code only uses DMI, it will need to be changed anyways for
> firmware bundled devicetree files anyways.
> 
> We could consolidate the duplicated code into another function that
> calls drm_get_panel_orientation_quirks too. The only reason it's like
> it is is because I initially only had the call to
> drm_get_panel_orientation_quirk once in the code.

Yes if you can add a new helper for the current callers, then
I'm fine with dropping the quirk handling from
drm_connector_init_panel_orientation_property()

Regards,

Hans
