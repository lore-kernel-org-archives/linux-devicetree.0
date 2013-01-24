From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] drm/i2c: Add driver for PTN3460 LVDS/DP bridge
Date: Thu, 24 Jan 2013 16:39:56 -0500
Message-ID: <CAOw6vbL4AoAtQtsWnL88PWpG+LW=8tYDOXtEhBxGtHyGJKsbVA@mail.gmail.com>
References: <1359050946-25061-1-git-send-email-seanpaul@chromium.org>
 <CAKMK7uGQredcS=rqH+m8uDKb72mszOxY6HPjcJpj5g0AwhHvOw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAKMK7uGQredcS=rqH+m8uDKb72mszOxY6HPjcJpj5g0AwhHvOw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 24, 2013 at 4:22 PM, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org> wrote:
> On Thu, Jan 24, 2013 at 7:09 PM, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> This patch adds the driver for the PTN3460 LVDS/DP bridge chip.
>>
>> The driver allows the EDID emulation to be selected from device tree,
>> along with specifying the GPIOs driving powerdown and reset pins.
>>
>> The chip has a bug in it such that when the powerdown and reset pins
>> are toggled, the hotplug line blips before the bridge is completely
>> ready. This forces us to wait for the maximum specified setup time
>> (90ms) before interacting with the chip via i2c or doing DP training, as
>> opposed to watching the hotplug line. This limitation means that we need
>> to synchronize the bridge driver with the DP driver via the
>> ptn3460_wait_until_ready function.
>>
>> Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
>>  .../devicetree/bindings/drm/i2c/ptn3460.txt        |   27 ++
>>  drivers/gpu/drm/Kconfig                            |    2 +
>>  drivers/gpu/drm/i2c/Kconfig                        |    6 +
>>  drivers/gpu/drm/i2c/Makefile                       |    2 +
>>  drivers/gpu/drm/i2c/ptn3460.c                      |  283 ++++++++++++++++++++
>
> Afaict from reading through the code, this is just a bit of
> special-purpose i2c code to control some hw. Imo you can just put that
> into your driver directory, since currently all the drivers in drm/i2c
> are drm_encoder_slaves (potentially shared between drivers), and I
> think we should keep it at that.
>
> Of course, if you plane to extend that to such an encoder slave
> driver, then we could move it back.

Yep, right on, it's not using any drm specific bits at the moment. I
have it in drm since I was using from the exynos DP driver in the
chromium tree (which has been moved into drm to alleviate the power
on/suspend/resume ordering issues that exist). I'm happy to move it
out, but want to avoid needlessly having to move it back in at some
point (depending on where the DP driver ends up).

Apart from that, I think there's a chance that it can be expanded to a
drm_encoder_slave if things get more complex, or potentially
daisy-chained as a CDF display, but that remains to be seen.

Suggestions welcome!

Sean


> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
